[cmdletbinding()]
Param (
[parameter(Mandatory=$True)]
[string[]]$ServiceName,

[parameter(Mandatory=$True)]
$IntervalSeconds
)

while (1) {
if (Get-Service -Name $ServiceName | where {$_.Status -eq "Stopped"}) {
$log = "$(Get-Date);$ServiceName; service state is stopped" | Out-File "$($ServiceName)_log.txt" -Append
Start-Service -Name $ServiceName
$log = "$(Get-Date);$ServiceName; starting the service" | Out-File "$($ServiceName)_log.txt" -Append
Start-Sleep -Seconds $IntervalSeconds } 
if ($check = Get-Service -Name $ServiceName | where {$_.Status -ne "Running" -and $_.Status -ne "Stopped"}) {
$log = "$(Get-Date);$ServiceName; service state is $($check.Status)" | Out-File "$($ServiceName)_log.txt" -Append
Start-Sleep -Seconds $IntervalSeconds }
}