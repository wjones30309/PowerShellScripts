# Exchange Online - Message trace report

This script connects to Exchange Online tenant and gathers message trace information. The report contains sent/receive and spam messages count.

## Requirements

Installed Exchange Online PowerShell module.  
Permissions to run `Get-Mailbox` and `Get-MessageTrace` cmdlet's.

## Limitations

`Get-MessageTrace` cmdlet returns maximum of 10KK results, and not older than 10 days. There is `Days` variable in the script, default is 7 days.

## Output example

```text
Email                        Sent Received Spam
-----                        ---- -------- ----
user1@example.com              22       41    5
user2@example.com              15       59    4
```

## Script syntax

```powershell
$Mailbox = Get-Mailbox | where {$_.RecipientTypeDetails -ne "DiscoveryMailbox"}
$Days = 7
$StartDate = (Get-Date).AddDays(-$Days)
$EndDate = Get-Date
foreach ($Email in $Mailbox) {
$Email = $Email.PrimarySmtpAddress
$ReceiveLog = Get-MessageTrace -RecipientAddress $Email -StartDate $StartDate -EndDate $EndDate | Where-Object {$_.Status -eq "Delivered" -or $_.Status -eq "FilteredAsSpam"} | Group-Object Status
$SentLog = Get-MessageTrace -SenderAddress $Email -StartDate $StartDate -EndDate $EndDate -Status Delivered | measure
$Out = New-Object PSObject
$Out | Add-Member -type NoteProperty Email $Email
$Out | Add-Member -type NoteProperty Sent $SentLog.count
$Out | Add-Member -type NoteProperty Received ($ReceiveLog | Where-Object {$_.Name -eq "Delivered"}).Count
$Out | Add-Member -type NoteProperty Spam ($ReceiveLog | Where-Object {$_.Name -eq "FilteredAsSpam"}).Count
Write-Output $Out}
```