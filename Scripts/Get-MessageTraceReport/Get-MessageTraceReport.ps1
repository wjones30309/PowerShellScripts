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