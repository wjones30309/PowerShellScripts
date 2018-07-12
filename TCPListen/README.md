### PowerShell Script to open TCP port and listen for connections ###
#### Use cases ####
This script can be used to test firewall rules for Windows Servers located in different subnets, DMZ etc.
#### Parameters ####
-IP **[IPv4 Address]**<br />
-PORT **[TCP Port number]**<br />
-ListenTimeOut **[Seconds]**<br />
-KeepAlive **[Seconds]**<br />

#### Usage examples ####
Example below opens 443 TCP port on loopback interface and starts listening it for 1 minute. Once client is connected the session will be kept for 5 second before drop. <br />
```powershell 
.\TCPListen.ps1 -IP 127.0.0.1 -PORT 443 -ListenTimeOut 60 -KeepAlive 5
```
Another example with output. <br />
```powershell
.\TCPListen.ps1 -IP 192.168.1.1 -PORT 443 -ListenTimeOut 20 -KeepAlive 2
```
```
07/24/2017 20:21:25 - 192.168.1.1 will listen 20 seconds on port 443 with 2 seconds keepalive, ctrl+c to cancel

Status                        Date                          Address                         Port 
------                        ----                          -------                         ---- 
Connected                     7/24/2017 8:21:33 PM          192.168.1.2                     51068 
Disconnected                  7/24/2017 8:21:35 PM          192.168.1.2                     51068 
Connected                     7/24/2017 8:21:38 PM          192.168.1.3                     51073 
Disconnected                  7/24/2017 8:21:40 PM          192.168.1.3                     51073 

07/24/2017 20:21:45 - Listen stopped
```
This example listens for connections on 443 port for 20 seconds. It uses 192.168.1.1 local IP address and keeps client connection for 2 seconds. Output shows Status event (Connected or Disconnected), Date, Client IP address and client port. Also it shows when script was started and ended.
#### Script Syntax ####
```powershell
 [CmdletBinding()]
Param(
 [Parameter(Mandatory=$True)]
 [ValidateNotNull()]
 [String]$IP,

 [Parameter(Mandatory=$True)]
 [ValidateNotNull()]
 [Int]$PORT,

 [Parameter(Mandatory=$True)]
 [ValidateNotNull()]
 [Int]$ListenTimeOut,

 [Parameter(Mandatory=$True)]
 [ValidateNotNull()]
 [Int]$KeepAlive
)

if (Test-NetConnection -ComputerName $IP -Port $PORT -InformationLevel Quiet) {Write-Host "Socket $IP`:$PORT is busy, please try another IP/PORT"; Exit}
$ListenTimeOutt = New-TimeSpan -Seconds $ListenTimeOut; $LT = $ListenTimeOutt.Seconds
$TIME = [diagnostics.stopwatch]::StartNew()
$EP = new-object System.Net.IPEndPoint ([system.net.IPAddress]::Parse($IP), $PORT)    
$LSTN = new-object System.Net.Sockets.TcpListener $EP
$LSTN.server.ReceiveTimeout = 300
$LSTN.start()    

try 
{
$start = get-date
Write-Host 
"
$start - $IP will listen $LT seconds on port $PORT with $KeepAlive seconds keepalive, ctrl+c to cancel
"
    While ($TIME.elapsed -lt $ListenTimeOutt)
    {
    if (!$LSTN.Pending()) {Start-Sleep -Seconds 1;continue;}
$CONNECT = $LSTN.AcceptTcpClient()
$CONNECT.client.RemoteEndPoint | Add-Member -NotePropertyName Date -NotePropertyValue (get-date) -PassThru | Add-Member -NotePropertyName Status -NotePropertyValue Connected -PassThru | select Status,Date,Address,Port
Start-Sleep -Seconds $KeepAlive;
$CONNECT.client.RemoteEndPoint | Add-Member -NotePropertyName Date -NotePropertyValue (get-date) -PassThru -Force | Add-Member -NotePropertyName Status -NotePropertyValue Disconnected -PassThru -Force | select Status,Date,Address,Port
$CONNECT.close()
    }
}

catch {Write-Error $_}
finally {$LSTN.stop(); $end = get-date; Write-host "`n$end - Listen stopped"} 
```
