# Script author Vyacheslav Fedenko - https://github.com/vfedenko/PowerShellScripts
# Fill in script variables below.
# Set the date format. It will be used in filenames and mail subjects.
$ReportDate = Get-Date -format ddMMyyyy
# Set folder, where the report and its log will be stored. In this example it is "C:\test\" folder.
$ExportPath="C:\test\"
# Start transcript. Script execution logs will be stored with .log extension. Requirement #5.
Start-Transcript -Path $ExportPath$ReportDate.log
# Specify SMTP server IP or DNS name.
$smtpServer="SMTP_SERVER_IP"
# Set admin email, who is going to receive a summary report.
$MailTo="admin@example.com"
# Set mail from address.
$MailFrom="passwordnotification@example.com"
# Mail subject.
$MailSubject="AD Domain Accounts Password Expiration Report - $ReportDate"
# Active Directory Organizational Unit name, where the user accounts are located. In this example it is UsersOU.
$SearchBase="OU=UsersOU,DC=example,DC=com"
# [$true | $false] Let script know if you want to keep the reporting history. In this example the reports and logs will not be removed after the script execution.
$KeepHistory=$true
# Set to $false if you want to notify users with password expiration. When it is set to $true, only administrator ($MailTo) will receive the summary report. Requirement #7.
$AdminReportOnly=$true
# Specify how many days before expiration to start reporting.
$NotifyBeforeDays = 7

# Main part of the script begins here.
# Check AD Default Password Policy to get a maximum password age.
$MaxPasswordAge = (Get-ADDefaultDomainPasswordPolicy).MaxPasswordAge.Days
# Create empty array for Reports. Otherwise you will get no method found when trying "$Report +=".
$Report = @()
# Get list of users with required additional properties. Simply query Active Directory by Get-ADUser cmdlet.
$Users = Get-ADUser -SearchBase $SearchBase -Filter * -Properties Mail,PasswordLastSet | where {$_.Enabled -and !$_.PasswordExpired -and !$_.PasswordNeverExpires}

# Main loop starts here. It checks each user and if users password is about to expire (less than $NotifyBeforeDays variable) mail alert will be sent to the user (sure if $AdminReportOnly set to $false)
foreach ($User in $Users)
{
# Get current date and calculate password age for user account.
$UserPasswordAge = ((Get-Date)-($User.PasswordLastSet)).Days
# Then calculate against $MaxPasswordAge and see how many days left before password is expired.
$DaysToExpire = $MaxPasswordAge - $UserPasswordAge

# If $DaysToExpire is less than $NotifyBeforeDays variable execute the following script block.
    if ($DaysToExpire -lt $NotifyBeforeDays)
    {
# This line is used for reporting. Simply defaulting MessageSent row to $false in a report.
    $MessageSent = $false
# This IF statement sends an email notification to users if user Mail attribute is set and $AdminReportOnly variable is set to false.
        if ($User.Mail -and !$AdminReportOnly)
        {
# These two lines below build Subject and Body for users notification.
        $UserNotificationMailSubject = "Your password will expire in $DaysToExpire days"
        $UserNotificationMailBody = "Dear $($User.Name),`n`nYour password is about to expire in $DaysToExpire days. Please change it as soon as possible.`n`n`nBest Regards,`nYour Support Team"
# This one actually sends an email to the user.
        Send-MailMessage -To $User.Mail -From $MailFrom -Subject $UserNotificationMailSubject -Body $UserNotificationMailBody -SmtpServer $smtpServer
# Sets the $MessageSent variable to $true so we can see in the report that user is notified. At least we attempted to send an email.
        $MessageSent = $true
        }
# Here we build the report.
    $Properties = [Ordered]@{
    Name = $User.Name
    UserPrincipalName = $User.UserPrincipalName
    Mail = $User.Mail
    DaysToExpire = $DaysToExpire
    MessageSent = $MessageSent}
# Updating the Report array created earlier.
    $Report += New-Object -TypeName PSObject -Property $Properties
    }
}
# This IF statement is needed for #8 requirement. If no report generated, do not send any emails. No need to spam administrators if there are no expiring passwords.
if ($Report) {
# This line sorts the accounts by expiration days count.
$Report = $Report | Sort-Object DaysToExpire
# Export the report to CSV file. It will be attached in the report.
$Report | Export-Csv $ExportPath$ReportDate.csv -NoTypeInformation
# One trick to get a path to the executed script. This will help in attaching the script into the report (requirement #6). Works even if the script is renamed.
$Script = $MyInvocation.InvocationName
# Stopping the transcript.
Stop-Transcript
# Build mail body for the admin report. It includes the list of users, script execution log and the script itself. Without Out-String the data is represented as a single line, which is not readable. "`n" is used to represent a new line in the plain text mail body. You can include any information you want, contact details, instructions etc.
$MailBody = "AD Users with expiring passwords:`n$(Get-Content $ExportPath$ReportDate.csv | Out-String)`n`nScript execution log:`n$(Get-Content $ExportPath$ReportDate.log | Out-String)`n`nScript syntax:`n$(Get-Content $Script | Out-String)"
# Send an email to administrator.
Send-MailMessage -To $MailTo -From $MailFrom -Subject $MailSubject -Body $MailBody -Attachments $ExportPath$ReportDate.csv,$ExportPath$ReportDate.log,$Script -SmtpServer $smtpServer}
# This IF statement controls history. Simply removing or not (depending on $KeepHistory variable) the report and log files after the script execution. If required, this syntax can be updated to include some kind of retention. Something like remove logs older than 1 month if needed.
if (!$KeepHistory) {
Remove-Item $ExportPath$ReportDate.csv -Force
Remove-Item $ExportPath$ReportDate.log -Force}