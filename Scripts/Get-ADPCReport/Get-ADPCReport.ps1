
$ReportDate = Get-Date -format ddMMyyyy
$smtpServer="SMTP_SERVER_IP_OR_DNS"
$MailTo="MailToAddress@example.com"
$MailFrom="MailFromAddress@example.com"
$MailSubject="Domain PC Report - $ReportDate"
$MailBody="CSV Report of current domain joined workstation and servers. Run date - $ReportDate"
$SearchBase="OU=Workstations,DC=example,DC=com"
$ExportPath="C:\Report\"
$KeepHistory=$true
Get-ADComputer -SearchBase $SearchBase -Filter * -Properties * | select Name,OperatingSystem,OperatingSystemServicePack,@{Name = "OU"; Expression = {$_.CanonicalName -replace $_.Name,''}},whenChanged | Export-Csv $ExportPath$ReportDate.csv -NoTypeInformation
Send-MailMessage -To $MailTo -From $MailFrom -Subject $MailSubject -Body $MailBody -Attachments $ExportPath$ReportDate.csv -SmtpServer $smtpServer
if (!$KeepHistory) {Remove-Item $ExportPath$ReportDate.csv -Force}