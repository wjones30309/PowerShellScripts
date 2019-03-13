# How to test TCP connection using PowerShell

I am not sure why a telnet client is not enabled feature by default in Windows Server but below can be very annoying sometimes.

```text
'telnet' is not recognized as an internal or external command,
operable program or batch file.
```

I used to install telnet client and do my admin job. However, PowerShell can be used instead:

```PowerShell
New-Object System.Net.Sockets.TcpClient("SERVER_NAME_OR_IP", PORT_NUMBER)
```

For example to test a remote SQL server named SQL01 run:

```PowerShell
New-Object System.Net.Sockets.TcpClient("SQL01", 1433)
```

## Working with custom PowerShell script

```PowerShell
.\Test-TCPConnection.ps1 -RemoteHost microsoft.com -Port 443
Success

.\Test-TCPConnection.ps1 -RemoteHost microsoft.com -Port 444
Fail
```

## Script Syntax

```PowerShell
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
```