$mailboxes = Get-Mailbox -OrganizationalUnit "example.local/mailboxes"
foreach ($mailbox in $mailboxes) {
$MailContact = @()
$MailContact = Get-MailContact $mailbox.ForwardingAddress 

$Obj = @{"DisplayName"=$mailbox.DisplayName;
"WindowsEmailAddress"=$mailbox.WindowsEmailAddress;
"ForwardingAddress"=$MailContact.ExternalEmailAddress
}

$Obj = New-Object -TypeName PSObject -Property $Obj
Write-Output $Obj | select DisplayName,WindowsEmailAddress,ForwardingAddress

}