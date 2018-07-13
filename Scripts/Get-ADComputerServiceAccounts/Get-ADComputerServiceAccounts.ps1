[CmdletBinding()]
Param(
 [Parameter(Mandatory=$False)]
 [ValidateNotNull()]
 [String]$ComputerName,
 
 [Parameter(Mandatory=$False)]
 [ValidateNotNull()]
 [String]$OU,
 
 [Parameter(Mandatory=$False)]
 [ValidateNotNull()]
 [String]$File
 )
$ErrorLog = @()
$Report = @()
$ErrorsCount = @().Count
$SuccessCount = @().Count
$TotalServers = @().Count
if ($ComputerName) {$Computers = Get-ADComputer $ComputerName | where {$_.enabled} | select –expand Name}
if ($OU) {Write-Host "Getting list of computers in $OU Organizational Unit"; $Computers = Get-ADComputer -filter * -SearchBase $OU | where {$_.enabled} | select –expand Name}
elseif (!$ComputerName -and !$OU) {Write-Host "Getting all computers in AD domain"; $Computers = Get-ADComputer -filter * | where {$_.enabled} | select –expand Name}

foreach ($Computer in $Computers) {
    $TotalServers += +1
    $GetService = Get-WmiObject Win32_Service -comp $Computer -ErrorAction SilentlyContinue -ErrorVariable ERR |  where-object { $_.startname -ne "LocalSystem" -and $_.startname -notlike "NT AUTHORITY\*" -and $_.startname -notlike "NT Service\*"}
    $GetService = $GetService | select SystemName,Name,StartName,StartMode,State    
        if ($ERR) {Write-Host "Connecting to $Computer - Fail"; $ErrorLog += "Can't connect to $Computer"; $ErrorsCount += +1}
        else {Write-Host "Connecting to $Computer - Success"; $Report += $GetService; $SuccessCount += +1}
    
}
$Report | ft -Wrap
$SVCAccounts = $Report | group StartName | sort name | select -ExpandProperty name
Write-Host "
### Service Accounts List ###"
$SVCAccounts
if ($ErrorLog) {Write-Host "
### Script Errors  ###"
$ErrorLog
}
Write-Host "
### Script Summary ###
# Total Servers: $TotalServers
# Connection Errors: $ErrorsCount
# Success: $SuccessCount
"
if ($File) {$Report | Export-Csv $File -ErrorAction SilentlyContinue}
