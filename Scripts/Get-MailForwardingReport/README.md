# Exchange Server mail forwarding report

This script gets a list of mailboxes with mail forwarding enabled through a mail contact.

## Script syntax

```powershell
$mailboxes = Get-Mailbox
foreach ($mailbox in $mailboxes){
$MailContact = @()
$MailContact = Get-MailContact $mailbox.ForwardingAddress
$Obj = @{"DisplayName"=$mailbox.DisplayName
"WindowsEmailAddress"=$mailbox.WindowsEmailAddress
"ForwardingAddress"=$MailContact.ExternalEmailAddress}
$Obj = New-Object -TypeName PSObject -Property $Obj
Write-Output $Obj | select DisplayName,WindowsEmailAddress,ForwardingAddress}
```