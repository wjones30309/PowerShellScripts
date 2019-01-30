[CmdletBinding()]
Param(
 [Parameter(Mandatory=$False)]
 [ValidateNotNull()]
 [String]$Instance,

 [Parameter(Mandatory=$False)]
 [ValidateNotNull()]
 [Int]$Timeout
)

if ($Timeout) {$Timeoutt = New-TimeSpan -Seconds $Timeout}
if (!$Instance) {$Instance = "_total"}

$Time = [diagnostics.stopwatch]::StartNew()

while ($Time.elapsed -lt $Timeoutt) 
{
$Connections = (Get-Counter "\Web Service($Instance)\Current Connections" | select -ExpandProperty CounterSamples).cookedvalue
Clear-Host
if (!$Connections) {Write-Host "IIS Instance not found. Please check the name"; break}
else {Write-Host "Current IIS Connections: $Connections"}
Start-Sleep -Seconds 1
}