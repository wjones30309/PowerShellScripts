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
