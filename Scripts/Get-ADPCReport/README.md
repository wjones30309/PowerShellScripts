# Active Directory domain joined workstations report

PowerShell script connects to your Active Directory and gets information about workstations and servers in a specific OU, then emails the report in a CSV format.

## Requirements

Permissions to run `Get-ADComputer` cmdlet.  
Mail relay configured.

## Script Syntax

Specify date format:

```PowerShell
$ReportDate = Get-Date -format ddMMyyyy
```

Fill in mail related variables:

```PowerShell
$smtpServer="SMTP_SERVER_IP_OR_DNS"
$MailTo="MailToAddress@example.com"
$MailFrom="MailFromAddress@example.com"
$MailSubject="Domain PC Report - $ReportDate"
$MailBody="CSV Report of current domain joined workstation and servers. Run date - $ReportDate"
```

Let the script know the OU and path for CSV report:

```PowerShell
$SearchBase="OU=Workstations,DC=example,DC=com"
$ExportPath="C:\Report\"
```

Set below setting `$true` or `$false` if you want to keep reports or remove them after the script execution:

```PowerShell
$KeepHistory=$true
```

Main part of the script. One trick to get OU name, just removing workstation name from CanonicalName attribute - `{$_.CanonicalName -replace $_.Name,''}`

```PowerShell
Get-ADComputer -SearchBase $SearchBase -Filter * -Properties * | select Name,OperatingSystem,OperatingSystemServicePack,@{Name = "OU"; Expression = {$_.CanonicalName -replace $_.Name,''}},whenChanged | Export-Csv $ExportPath$ReportDate.csv -NoTypeInformation
```

Send email with CSV file attached:

```PowerShell
Send-MailMessage -To $MailTo -From $MailFrom -Subject $MailSubject -Body $MailBody -Attachments $ExportPath$ReportDate.csv -SmtpServer $smtpServer
```

Remove the report if needed:

```PowerShell
if (!$KeepHistory) {Remove-Item $ExportPath$ReportDate.csv -Force}
```