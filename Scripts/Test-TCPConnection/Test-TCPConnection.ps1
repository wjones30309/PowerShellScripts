[CmdletBinding()]
Param(
[Parameter(Mandatory=$True)] 
[ValidateNotNull()] 
[String]$RemoteHost,

[Parameter(Mandatory=$True)]
[ValidateNotNull()]
[Int]$Port)

$ErrorActionPreference = "SilentlyContinue"
$test = New-Object System.Net.Sockets.TcpClient($RemoteHost, $Port)

if ($test.Connected -eq "True") {Write-Host Success}
else {Write-Host Fail}