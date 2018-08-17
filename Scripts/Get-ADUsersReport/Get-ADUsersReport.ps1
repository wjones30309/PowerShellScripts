$ReportDate = Get-Date -format ddMMyyyy
$smtpServer="SMTP_SERVER_IP_OR_DNS"
$MailTo="MailToAddress@example.com"
$MailFrom="MailFromAddress@example.com"
$MailSubject="AD Domain Accounts Report - $ReportDate"
$MailBody="CSV Report of current AD Accounts. Run date - $ReportDate"
$SearchBase="OU=UserAccountsOU,DC=example,DC=com"
$ExportPath="C:\Report\"
$KeepHistory=$true
$MaxPasswordAge = (Get-ADDefaultDomainPasswordPolicy).MaxPasswordAge.Days
Get-ADUser -SearchBase $SearchBase -Filter * -Properties * | select Name,@{Name="OU"; Expression={$_.CanonicalName -replace $_.Name,''}},Enabled,LockedOut,PasswordNeverExpires,@{Name="PasswordAge"; Expression={((get-date)-($_.PasswordLastSet)).Days}},@{Name="PasswordExpires"; Expression={($_.PasswordLastSet).AddDays($MaxPasswordAge)}},LastLogonDate,AccountExpirationDate | Export-Csv $ExportPath$ReportDate.csv -NoTypeInformation
Send-MailMessage -To $MailTo -From $MailFrom -Subject $MailSubject -Body $MailBody -Attachments $ExportPath$ReportDate.csv -SmtpServer $smtpServer
if (!$KeepHistory) {Remove-Item $ExportPath$ReportDate.csv -Force}