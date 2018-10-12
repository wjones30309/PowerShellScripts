$Mailbox = Get-Mailbox | where {$_.RecipientTypeDetails -ne "DiscoveryMailbox"} 
$Report = @()
foreach ($Email in $Mailbox) 
{
$Email = $Email.PrimarySmtpAddress.ToString()
$SentLog = Get-MessageTrace -SenderAddress $Email -Status Delivered  | measure
$ReceiveLog = Get-MessageTrace -RecipientAddress $Email -Status Delivered | measure
$SentCount = $SentLog.count
$ReceiveCount = $ReceiveLog.count
$Out = New-Object PSObject
$Out | Add-Member -type NoteProperty Email ($Email)
$Out | Add-Member -type NoteProperty SentCount ($SentCount)
$Out | Add-Member -type NoteProperty ReceiveCount ($ReceiveCount)
$Report += $Out
}
$Report | export-csv Report.csv