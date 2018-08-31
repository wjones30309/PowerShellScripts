$ReportDate = Get-Date -format ddMMyyyy
$ExportPath="C:\test\"
Start-Transcript -Path $ExportPath$ReportDate.log
$smtpServer="SMTP_SERVER_IP"
$MailTo="admin@example.com"
$MailFrom="passwordnotification@example.com"
$MailSubject="AD Domain Accounts Password Expiration Report - $ReportDate"
$SearchBase="OU=UsersOU,DC=example,DC=com"
$KeepHistory=$true
$AdminReportOnly=$true
$NotifyBeforeDays = 7

$MaxPasswordAge = (Get-ADDefaultDomainPasswordPolicy).MaxPasswordAge.Days
$Report = @()
$Users = Get-ADUser -SearchBase $SearchBase -Filter * -Properties Mail,PasswordLastSet | where {$_.Enabled -and !$_.PasswordExpired -and !$_.PasswordNeverExpires}

foreach ($User in $Users)
{
$UserPasswordAge = ((Get-Date)-($User.PasswordLastSet)).Days
$DaysToExpire = $MaxPasswordAge - $UserPasswordAge
    if ($DaysToExpire -lt $NotifyBeforeDays)
    {
   $MessageSent = $false
        if ($User.Mail -and !$AdminReportOnly)
        {
        $UserNotificationMailSubject = "Your password will expire in $DaysToExpire days"
        $UserNotificationMailBody = "Dear $($User.Name),`n`nYour password is about to expire in $DaysToExpire days. Please change it as soon as possible.`n`n`nBest Regards,`nYour Support Team"
        Send-MailMessage -To $User.Mail -From $MailFrom -Subject $UserNotificationMailSubject -Body $UserNotificationMailBody -SmtpServer $smtpServer
        $MessageSent = $true
        }
    $Properties = [Ordered]@{
    Name = $User.Name
    UserPrincipalName = $User.UserPrincipalName
    Mail = $User.Mail
    DaysToExpire = $DaysToExpire
    MessageSent = $MessageSent}
    $Report += New-Object -TypeName PSObject -Property $Properties
    }
}

if ($Report) {
$Report = $Report | Sort-Object DaysToExpire
$Report | Export-Csv $ExportPath$ReportDate.csv -NoTypeInformation
$Script = $MyInvocation.InvocationName
Stop-Transcript
$MailBody = "AD Users with expiring passwords:`n$(Get-Content $ExportPath$ReportDate.csv | Out-String)`n`nScript execution log:`n$(Get-Content $ExportPath$ReportDate.log | Out-String)`n`nScript syntax:`n$(Get-Content $Script | Out-String)"
Send-MailMessage -To $MailTo -From $MailFrom -Subject $MailSubject -Body $MailBody -Attachments $ExportPath$ReportDate.csv,$ExportPath$ReportDate.log,$Script -SmtpServer $smtpServer}

if (!$KeepHistory) {
Remove-Item $ExportPath$ReportDate.csv -Force
Remove-Item $ExportPath$ReportDate.log -Force}