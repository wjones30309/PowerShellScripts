# Monitor current IIS connections using PowerShell

This simple PowerShell script checks Web Service Current Connections counter. It queries the counter every second and outputs the results.

## Parameters

"-Instance" - specify IIS instance name to check. Default is _total.  
"-Timeout" - how long to run the script in seconds. Default infinitely.  

## Examples

Get a number of current IIS connections to all instances:

```powershell
.\Get-IISCurrentConnections.ps1
```

It will produce an output like:

```text
Current IIS Connections: 9
```

The same as above but with for specific instance and timeout 60 seconds:

```powershell
.\Get-IISCurrentConnections.ps1 -Instance INSTANCE_NAME -Timeout 60
```

If instance name is wrong, the script will show:

```text
IIS Instance not found. Please check the name
```

## Script Syntax

```PowerShell
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
if ($Connections -eq $null) {Write-Host "IIS Instance not found. Please check the name"; break}
else {Write-Host "Current IIS Connections: $Connections"}
Start-Sleep -Seconds 1
}
```