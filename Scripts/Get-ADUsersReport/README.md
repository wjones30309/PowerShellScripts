# Active Directory user accounts report

PowerShell script connects to your Active Directory and gets information about user accounts in a specific OU, then emails the report in a CSV format.

## Requirements

Permissions to run `Get-ADUser` and `Get-ADDefaultDomainPasswordPolicy` cmdlet's.  
Mail relay configured.

## Script Output (CSV)

**Name** - AD Account name.  
**OU** - Organizational Unit.  
**Enabled** - Enabled or Disabled state of the account (`True` or `False`).  
**LockedOut** - Shows if an account is locked out.  
**PasswordNeverExpires** - Return `True` if an account is set with password never expire.  
**PasswordAge** - Password age (Days).  
**PasswordExpires** - Date when password is going to expire.  
**LastLogonDate** - Account last logon date.  
**AccountExpirationDate** -  Account expiration date.

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
$MailSubject="AD Domain Accounts Report - $ReportDate"
$MailBody="CSV Report of current AD Accounts. Run date - $ReportDate"
```

Let the script know the OU and path for CSV report:

```PowerShell
$SearchBase="OU=UserAccountsOU,DC=example,DC=com"
$ExportPath="C:\Report\"
```

Set below setting `$true` or `$false` if you want to keep reports or remove them after the script execution:

```PowerShell
$KeepHistory=$true
```

Check Active Directory Domain Password Policy. It will be used in a password age calculation:

```PowerShell
$MaxPasswordAge = (Get-ADDefaultDomainPasswordPolicy).MaxPasswordAge.Days
```

Main part of the script. Some tricks are here. First one with getting OU name, just removing account name from CanonicalName attribute - `{$_.CanonicalName -replace $_.Name,''}`. Second one with PasswordAge, just minus current and password last set dates - `((get-date)-($_.PasswordLastSet)).Days`. Last one is Password Expiration calculation, simply add to Password Last Set date maximum password age from `$MaxPasswordAge` variable - `($_.PasswordLastSet).AddDays($MaxPasswordAge)`

```PowerShell
Get-ADUser -SearchBase $SearchBase -Filter * -Properties * | select Name,@{Name="OU"; Expression={$_.CanonicalName -replace $_.Name,''}},Enabled,LockedOut,PasswordNeverExpires,@{Name="PasswordAge"; Expression={((get-date)-($_.PasswordLastSet)).Days}},@{Name="PasswordExpires"; Expression={($_.PasswordLastSet).AddDays($MaxPasswordAge)}},LastLogonDate,AccountExpirationDate | Export-Csv $ExportPath$ReportDate.csv -NoTypeInformation
```

Send email with CSV file attached:

```PowerShell
Send-MailMessage -To $MailTo -From $MailFrom -Subject $MailSubject -Body $MailBody -Attachments $ExportPath$ReportDate.csv -SmtpServer $smtpServer
```

Remove the report if needed:

```PowerShell
if (!$KeepHistory) {Remove-Item $ExportPath$ReportDate.csv -Force}
```