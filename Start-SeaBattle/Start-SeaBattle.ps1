 [CmdletBinding()] 
Param( 
 [Parameter(Mandatory=$False)]
 [switch]$EnableCheats
 )
# May get non critical errors during execution of some functions. Simply specify ErrorActionPreference to turn them off.
$ErrorActionPreference = "SilentlyContinue"

# Define your table
$Your_a = "[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]"
$Your_b = "[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]"
$Your_c = "[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]"
$Your_d = "[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]"
$Your_e = "[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]"
$Your_f = "[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]"
$Your_g = "[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]"
$Your_h = "[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]"
$Your_i = "[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]"
$Your_j = "[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]"

# Define computer table
$Computer_a = "[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]"
$Computer_b = "[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]"
$Computer_c = "[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]"
$Computer_d = "[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]"
$Computer_e = "[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]"
$Computer_f = "[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]"
$Computer_g = "[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]"
$Computer_h = "[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]"
$Computer_i = "[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]"
$Computer_j = "[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]"

# Define hidden computer table, where computer hides its ships
$HiddenComputer_a = "[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]"
$HiddenComputer_b = "[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]"
$HiddenComputer_c = "[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]"
$HiddenComputer_d = "[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]"
$HiddenComputer_e = "[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]"
$HiddenComputer_f = "[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]"
$HiddenComputer_g = "[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]"
$HiddenComputer_h = "[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]"
$HiddenComputer_i = "[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]"
$HiddenComputer_j = "[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]","[ ]"

# Function to show your table
function ShowYourTable {
clear
Write-Output "============ Your table ==========="
Write-Output "    a  b  c  d  e  f  g  h  i  j"
Write-Output " 1 $($Your_a[0])$($Your_b[0])$($Your_c[0])$($Your_d[0])$($Your_e[0])$($Your_f[0])$($Your_g[0])$($Your_h[0])$($Your_i[0])$($Your_j[0]) 1"
Write-Output " 2 $($Your_a[1])$($Your_b[1])$($Your_c[1])$($Your_d[1])$($Your_e[1])$($Your_f[1])$($Your_g[1])$($Your_h[1])$($Your_i[1])$($Your_j[1]) 2"
Write-Output " 3 $($Your_a[2])$($Your_b[2])$($Your_c[2])$($Your_d[2])$($Your_e[2])$($Your_f[2])$($Your_g[2])$($Your_h[2])$($Your_i[2])$($Your_j[2]) 3"
Write-Output " 4 $($Your_a[3])$($Your_b[3])$($Your_c[3])$($Your_d[3])$($Your_e[3])$($Your_f[3])$($Your_g[3])$($Your_h[3])$($Your_i[3])$($Your_j[3]) 4"
Write-Output " 5 $($Your_a[4])$($Your_b[4])$($Your_c[4])$($Your_d[4])$($Your_e[4])$($Your_f[4])$($Your_g[4])$($Your_h[4])$($Your_i[4])$($Your_j[4]) 5"
Write-Output " 6 $($Your_a[5])$($Your_b[5])$($Your_c[5])$($Your_d[5])$($Your_e[5])$($Your_f[5])$($Your_g[5])$($Your_h[5])$($Your_i[5])$($Your_j[5]) 6"
Write-Output " 7 $($Your_a[6])$($Your_b[6])$($Your_c[6])$($Your_d[6])$($Your_e[6])$($Your_f[6])$($Your_g[6])$($Your_h[6])$($Your_i[6])$($Your_j[6]) 7"
Write-Output " 8 $($Your_a[7])$($Your_b[7])$($Your_c[7])$($Your_d[7])$($Your_e[7])$($Your_f[7])$($Your_g[7])$($Your_h[7])$($Your_i[7])$($Your_j[7]) 8"
Write-Output " 9 $($Your_a[8])$($Your_b[8])$($Your_c[8])$($Your_d[8])$($Your_e[8])$($Your_f[8])$($Your_g[8])$($Your_h[8])$($Your_i[8])$($Your_j[8]) 9"
Write-Output "10 $($Your_a[9])$($Your_b[9])$($Your_c[9])$($Your_d[9])$($Your_e[9])$($Your_f[9])$($Your_g[9])$($Your_h[9])$($Your_i[9])$($Your_j[9]) 10"
Write-Output "    a  b  c  d  e  f  g  h  i  j"
}

# Function to show computer table
function ShowComputerTable {
Write-Output "`n========= Computer table =========="
Write-Output "    a  b  c  d  e  f  g  h  i  j"
Write-Output " 1 $($Computer_a[0])$($Computer_b[0])$($Computer_c[0])$($Computer_d[0])$($Computer_e[0])$($Computer_f[0])$($Computer_g[0])$($Computer_h[0])$($Computer_i[0])$($Computer_j[0]) 1"
Write-Output " 2 $($Computer_a[1])$($Computer_b[1])$($Computer_c[1])$($Computer_d[1])$($Computer_e[1])$($Computer_f[1])$($Computer_g[1])$($Computer_h[1])$($Computer_i[1])$($Computer_j[1]) 2"
Write-Output " 3 $($Computer_a[2])$($Computer_b[2])$($Computer_c[2])$($Computer_d[2])$($Computer_e[2])$($Computer_f[2])$($Computer_g[2])$($Computer_h[2])$($Computer_i[2])$($Computer_j[2]) 3"
Write-Output " 4 $($Computer_a[3])$($Computer_b[3])$($Computer_c[3])$($Computer_d[3])$($Computer_e[3])$($Computer_f[3])$($Computer_g[3])$($Computer_h[3])$($Computer_i[3])$($Computer_j[3]) 4"
Write-Output " 5 $($Computer_a[4])$($Computer_b[4])$($Computer_c[4])$($Computer_d[4])$($Computer_e[4])$($Computer_f[4])$($Computer_g[4])$($Computer_h[4])$($Computer_i[4])$($Computer_j[4]) 5"
Write-Output " 6 $($Computer_a[5])$($Computer_b[5])$($Computer_c[5])$($Computer_d[5])$($Computer_e[5])$($Computer_f[5])$($Computer_g[5])$($Computer_h[5])$($Computer_i[5])$($Computer_j[5]) 6"
Write-Output " 7 $($Computer_a[6])$($Computer_b[6])$($Computer_c[6])$($Computer_d[6])$($Computer_e[6])$($Computer_f[6])$($Computer_g[6])$($Computer_h[6])$($Computer_i[6])$($Computer_j[6]) 7"
Write-Output " 8 $($Computer_a[7])$($Computer_b[7])$($Computer_c[7])$($Computer_d[7])$($Computer_e[7])$($Computer_f[7])$($Computer_g[7])$($Computer_h[7])$($Computer_i[7])$($Computer_j[7]) 8"
Write-Output " 9 $($Computer_a[8])$($Computer_b[8])$($Computer_c[8])$($Computer_d[8])$($Computer_e[8])$($Computer_f[8])$($Computer_g[8])$($Computer_h[8])$($Computer_i[8])$($Computer_j[8]) 9"
Write-Output "10 $($Computer_a[9])$($Computer_b[9])$($Computer_c[9])$($Computer_d[9])$($Computer_e[9])$($Computer_f[9])$($Computer_g[9])$($Computer_h[9])$($Computer_i[9])$($Computer_j[9]) 10"
Write-Output "    a  b  c  d  e  f  g  h  i  j"
}

# Function to show hidden computer table (used in EnableCheats parameter)
function ShowHiddenComputerTable {
Write-Output "`n====== Hidden Computer table ======"
Write-Output "    a  b  c  d  e  f  g  h  i  j"
Write-Output " 1 $($HiddenComputer_a[0])$($HiddenComputer_b[0])$($HiddenComputer_c[0])$($HiddenComputer_d[0])$($HiddenComputer_e[0])$($HiddenComputer_f[0])$($HiddenComputer_g[0])$($HiddenComputer_h[0])$($HiddenComputer_i[0])$($HiddenComputer_j[0]) 1"
Write-Output " 2 $($HiddenComputer_a[1])$($HiddenComputer_b[1])$($HiddenComputer_c[1])$($HiddenComputer_d[1])$($HiddenComputer_e[1])$($HiddenComputer_f[1])$($HiddenComputer_g[1])$($HiddenComputer_h[1])$($HiddenComputer_i[1])$($HiddenComputer_j[1]) 2"
Write-Output " 3 $($HiddenComputer_a[2])$($HiddenComputer_b[2])$($HiddenComputer_c[2])$($HiddenComputer_d[2])$($HiddenComputer_e[2])$($HiddenComputer_f[2])$($HiddenComputer_g[2])$($HiddenComputer_h[2])$($HiddenComputer_i[2])$($HiddenComputer_j[2]) 3"
Write-Output " 4 $($HiddenComputer_a[3])$($HiddenComputer_b[3])$($HiddenComputer_c[3])$($HiddenComputer_d[3])$($HiddenComputer_e[3])$($HiddenComputer_f[3])$($HiddenComputer_g[3])$($HiddenComputer_h[3])$($HiddenComputer_i[3])$($HiddenComputer_j[3]) 4"
Write-Output " 5 $($HiddenComputer_a[4])$($HiddenComputer_b[4])$($HiddenComputer_c[4])$($HiddenComputer_d[4])$($HiddenComputer_e[4])$($HiddenComputer_f[4])$($HiddenComputer_g[4])$($HiddenComputer_h[4])$($HiddenComputer_i[4])$($HiddenComputer_j[4]) 5"
Write-Output " 6 $($HiddenComputer_a[5])$($HiddenComputer_b[5])$($HiddenComputer_c[5])$($HiddenComputer_d[5])$($HiddenComputer_e[5])$($HiddenComputer_f[5])$($HiddenComputer_g[5])$($HiddenComputer_h[5])$($HiddenComputer_i[5])$($HiddenComputer_j[5]) 6"
Write-Output " 7 $($HiddenComputer_a[6])$($HiddenComputer_b[6])$($HiddenComputer_c[6])$($HiddenComputer_d[6])$($HiddenComputer_e[6])$($HiddenComputer_f[6])$($HiddenComputer_g[6])$($HiddenComputer_h[6])$($HiddenComputer_i[6])$($HiddenComputer_j[6]) 7"
Write-Output " 8 $($HiddenComputer_a[7])$($HiddenComputer_b[7])$($HiddenComputer_c[7])$($HiddenComputer_d[7])$($HiddenComputer_e[7])$($HiddenComputer_f[7])$($HiddenComputer_g[7])$($HiddenComputer_h[7])$($HiddenComputer_i[7])$($HiddenComputer_j[7]) 8"
Write-Output " 9 $($HiddenComputer_a[8])$($HiddenComputer_b[8])$($HiddenComputer_c[8])$($HiddenComputer_d[8])$($HiddenComputer_e[8])$($HiddenComputer_f[8])$($HiddenComputer_g[8])$($HiddenComputer_h[8])$($HiddenComputer_i[8])$($HiddenComputer_j[8]) 9"
Write-Output "10 $($HiddenComputer_a[9])$($HiddenComputer_b[9])$($HiddenComputer_c[9])$($HiddenComputer_d[9])$($HiddenComputer_e[9])$($HiddenComputer_f[9])$($HiddenComputer_g[9])$($HiddenComputer_h[9])$($HiddenComputer_i[9])$($HiddenComputer_j[9]) 10"
Write-Output "    a  b  c  d  e  f  g  h  i  j"
}

# Function to show legend
function ShowLegend {
Write-Output "`nLegend: `n   [S] - Your ships `n   [ ] - Empty field `n   [*] - Shot (ship perimeter) `n   [X] - destroyed ship`n"
}

# Function to create your ships
function CreateShips {
$ShipsCreated = 0
do {
$PutYourShips = Read-Host -Prompt "Put your ship. Ships created $(0+$Script:ShipsCreated) of 5"
if ($PutYourShips[0] -eq "a" -and (($Your_a.Item("$($PutYourShips.Substring(1))"-1)) -ne "[*]")) {
$Your_a.Item("$($PutYourShips.Substring(1))"-1)="[S]";ShipPerimeter}
if ($PutYourShips[0] -eq "b" -and (($Your_b.Item("$($PutYourShips.Substring(1))"-1)) -ne "[*]")) {
$Your_b.Item("$($PutYourShips.Substring(1))"-1)="[S]";ShipPerimeter}
if ($PutYourShips[0] -eq "c" -and (($Your_c.Item("$($PutYourShips.Substring(1))"-1)) -ne "[*]")) {
$Your_c.Item("$($PutYourShips.Substring(1))"-1)="[S]";ShipPerimeter}
if ($PutYourShips[0] -eq "d" -and (($Your_d.Item("$($PutYourShips.Substring(1))"-1)) -ne "[*]")) {
$Your_d.Item("$($PutYourShips.Substring(1))"-1)="[S]";ShipPerimeter}
if ($PutYourShips[0] -eq "e" -and (($Your_e.Item("$($PutYourShips.Substring(1))"-1)) -ne "[*]")) {
$Your_e.Item("$($PutYourShips.Substring(1))"-1)="[S]";ShipPerimeter}
if ($PutYourShips[0] -eq "f" -and (($Your_f.Item("$($PutYourShips.Substring(1))"-1)) -ne "[*]")) {
$Your_f.Item("$($PutYourShips.Substring(1))"-1)="[S]";ShipPerimeter}
if ($PutYourShips[0] -eq "g" -and (($Your_g.Item("$($PutYourShips.Substring(1))"-1)) -ne "[*]")) {
$Your_g.Item("$($PutYourShips.Substring(1))"-1)="[S]";ShipPerimeter}
if ($PutYourShips[0] -eq "h" -and (($Your_h.Item("$($PutYourShips.Substring(1))"-1)) -ne "[*]")) {
$Your_h.Item("$($PutYourShips.Substring(1))"-1)="[S]";ShipPerimeter}
if ($PutYourShips[0] -eq "i" -and (($Your_i.Item("$($PutYourShips.Substring(1))"-1)) -ne "[*]")) {
$Your_i.Item("$($PutYourShips.Substring(1))"-1)="[S]";ShipPerimeter}
if ($PutYourShips[0] -eq "j" -and (($Your_j.Item("$($PutYourShips.Substring(1))"-1)) -ne "[*]")) {
$Your_j.Item("$($PutYourShips.Substring(1))"-1)="[S]";ShipPerimeter}
ShowYourTable
ShowComputerTable
ShowLegend
CheckShips
} until ($Script:ShipsCreationDone -eq "True") 
}

# Function to check how many ships are created. Will stop after 5.
function CheckShips {
$Your_checkTotalShips +=  ($Your_a | where {$_ -eq "[S]"} | measure).Count
$Your_checkTotalShips +=  ($Your_b | where {$_ -eq "[S]"} | measure).Count
$Your_checkTotalShips +=  ($Your_c | where {$_ -eq "[S]"} | measure).Count
$Your_checkTotalShips +=  ($Your_d | where {$_ -eq "[S]"} | measure).Count
$Your_checkTotalShips +=  ($Your_e | where {$_ -eq "[S]"} | measure).Count
$Your_checkTotalShips +=  ($Your_f | where {$_ -eq "[S]"} | measure).Count
$Your_checkTotalShips +=  ($Your_g | where {$_ -eq "[S]"} | measure).Count
$Your_checkTotalShips +=  ($Your_h | where {$_ -eq "[S]"} | measure).Count
$Your_checkTotalShips +=  ($Your_i | where {$_ -eq "[S]"} | measure).Count
$Your_checkTotalShips +=  ($Your_j | where {$_ -eq "[S]"} | measure).Count
if ($Your_checkTotalShips -lt 5) {$Script:ShipsCreationDone = "False";$Script:ShipsCreated = $Your_checkTotalShips}
else {$Script:ShipsCreationDone = "True"}
}

# The same as above but checks computer ships
function CheckComputerShips {
$Computer_checkTotalShips +=  ($HiddenComputer_a | where {$_ -eq "[S]"} | measure).Count
$Computer_checkTotalShips +=  ($HiddenComputer_b | where {$_ -eq "[S]"} | measure).Count
$Computer_checkTotalShips +=  ($HiddenComputer_c | where {$_ -eq "[S]"} | measure).Count
$Computer_checkTotalShips +=  ($HiddenComputer_d | where {$_ -eq "[S]"} | measure).Count
$Computer_checkTotalShips +=  ($HiddenComputer_e | where {$_ -eq "[S]"} | measure).Count
$Computer_checkTotalShips +=  ($HiddenComputer_f | where {$_ -eq "[S]"} | measure).Count
$Computer_checkTotalShips +=  ($HiddenComputer_g | where {$_ -eq "[S]"} | measure).Count
$Computer_checkTotalShips +=  ($HiddenComputer_h | where {$_ -eq "[S]"} | measure).Count
$Computer_checkTotalShips +=  ($HiddenComputer_i | where {$_ -eq "[S]"} | measure).Count
$Computer_checkTotalShips +=  ($HiddenComputer_j | where {$_ -eq "[S]"} | measure).Count
if ($Computer_checkTotalShips -lt 5) {$Script:ComputerShipsCreationDone = "False"}
else {$Script:ComputerShipsCreationDone = "True"}
}

# Function which generates ships for computer
function GenerateComputerShips {
do {
$GetRandomLetter = Get-Random "a","b","c","d","e","f","g","h","i","j"
$GetRandomNumber = Get-Random "1","2","3","4","5","6","7","8","9","10"
$GetRandomGeneratedComputerShip = $GetRandomLetter+$GetRandomNumber
if ($GetRandomGeneratedComputerShip[0] -eq "a" -and (($HiddenComputer_a.Item("$($GetRandomGeneratedComputerShip.Substring(1))"-1)) -ne "[*]")) {
$HiddenComputer_a.Item("$($GetRandomGeneratedComputerShip.Substring(1))"-1)="[S]";ComputerShipPerimeter}
if ($GetRandomGeneratedComputerShip[0] -eq "b" -and (($HiddenComputer_b.Item("$($GetRandomGeneratedComputerShip.Substring(1))"-1)) -ne "[*]")) {
$HiddenComputer_b.Item("$($GetRandomGeneratedComputerShip.Substring(1))"-1)="[S]";ComputerShipPerimeter}
if ($GetRandomGeneratedComputerShip[0] -eq "c" -and (($HiddenComputer_c.Item("$($GetRandomGeneratedComputerShip.Substring(1))"-1)) -ne "[*]")) {
$HiddenComputer_c.Item("$($GetRandomGeneratedComputerShip.Substring(1))"-1)="[S]";ComputerShipPerimeter}
if ($GetRandomGeneratedComputerShip[0] -eq "d" -and (($HiddenComputer_d.Item("$($GetRandomGeneratedComputerShip.Substring(1))"-1)) -ne "[*]")) {
$HiddenComputer_d.Item("$($GetRandomGeneratedComputerShip.Substring(1))"-1)="[S]";ComputerShipPerimeter}
if ($GetRandomGeneratedComputerShip[0] -eq "e" -and (($HiddenComputer_e.Item("$($GetRandomGeneratedComputerShip.Substring(1))"-1)) -ne "[*]")) {
$HiddenComputer_e.Item("$($GetRandomGeneratedComputerShip.Substring(1))"-1)="[S]";ComputerShipPerimeter}
if ($GetRandomGeneratedComputerShip[0] -eq "f" -and (($HiddenComputer_f.Item("$($GetRandomGeneratedComputerShip.Substring(1))"-1)) -ne "[*]")) {
$HiddenComputer_f.Item("$($GetRandomGeneratedComputerShip.Substring(1))"-1)="[S]";ComputerShipPerimeter}
if ($GetRandomGeneratedComputerShip[0] -eq "g" -and (($HiddenComputer_g.Item("$($GetRandomGeneratedComputerShip.Substring(1))"-1)) -ne "[*]")) {
$HiddenComputer_g.Item("$($GetRandomGeneratedComputerShip.Substring(1))"-1)="[S]";ComputerShipPerimeter}
if ($GetRandomGeneratedComputerShip[0] -eq "h" -and (($HiddenComputer_h.Item("$($GetRandomGeneratedComputerShip.Substring(1))"-1)) -ne "[*]")) {
$HiddenComputer_h.Item("$($GetRandomGeneratedComputerShip.Substring(1))"-1)="[S]";ComputerShipPerimeter}
if ($GetRandomGeneratedComputerShip[0] -eq "i" -and (($HiddenComputer_i.Item("$($GetRandomGeneratedComputerShip.Substring(1))"-1)) -ne "[*]")) {
$HiddenComputer_i.Item("$($GetRandomGeneratedComputerShip.Substring(1))"-1)="[S]";ComputerShipPerimeter}
if ($GetRandomGeneratedComputerShip[0] -eq "j" -and (($HiddenComputer_j.Item("$($GetRandomGeneratedComputerShip.Substring(1))"-1)) -ne "[*]")) {
$HiddenComputer_j.Item("$($GetRandomGeneratedComputerShip.Substring(1))"-1)="[S]";ComputerShipPerimeter}
CheckComputerShips
} until ($Script:ComputerShipsCreationDone -eq "True")
}

# Function to generate computer moves. 100 in total.
function GenerateComputerMoves {
$GetRandomGeneratedComputerMoves = @()
do {
$GetRandomLetter = Get-Random "a","b","c","d","e","f","g","h","i","j"
$GetRandomNumber = Get-Random "1","2","3","4","5","6","7","8","9","10"
$GetRandomGeneratedComputerMoves += $GetRandomLetter+$GetRandomNumber
} until (($GetRandomGeneratedComputerMoves | select -Unique | measure).Count -eq 100)
$Script:ComputerMoves = $GetRandomGeneratedComputerMoves
}

# Function which is used when you move.
function MyMove {
if ($MyTurn[0] -eq "a" -and ($HiddenComputer_a.Item("$($MyTurn.Substring(1))"-1) -eq "[ ]" -or $HiddenComputer_a.Item("$($MyTurn.Substring(1))"-1) -eq "[*]")) {
$HiddenComputer_a.Item("$($MyTurn.Substring(1))"-1)="[*]";$Computer_a.Item("$($MyTurn.Substring(1))"-1)="[*]"}
if ($MyTurn[0] -eq "a" -and $HiddenComputer_a.Item("$($MyTurn.Substring(1))"-1) -eq "[S]") {
$HiddenComputer_a.Item("$($MyTurn.Substring(1))"-1)="[X]";$Computer_a.Item("$($MyTurn.Substring(1))"-1)="[X]";$Script:MyScore++}
if ($MyTurn[0] -eq "b" -and ($HiddenComputer_b.Item("$($MyTurn.Substring(1))"-1) -eq "[ ]" -or $HiddenComputer_b.Item("$($MyTurn.Substring(1))"-1) -eq "[*]")) {
$HiddenComputer_b.Item("$($MyTurn.Substring(1))"-1)="[*]";$Computer_b.Item("$($MyTurn.Substring(1))"-1)="[*]"}
if ($MyTurn[0] -eq "b" -and $HiddenComputer_b.Item("$($MyTurn.Substring(1))"-1) -eq "[S]") {
$HiddenComputer_b.Item("$($MyTurn.Substring(1))"-1)="[X]";$Computer_b.Item("$($MyTurn.Substring(1))"-1)="[X]";$Script:MyScore++}
if ($MyTurn[0] -eq "c" -and ($HiddenComputer_c.Item("$($MyTurn.Substring(1))"-1) -eq "[ ]" -or $HiddenComputer_c.Item("$($MyTurn.Substring(1))"-1) -eq "[*]")) {
$HiddenComputer_c.Item("$($MyTurn.Substring(1))"-1)="[*]";$Computer_c.Item("$($MyTurn.Substring(1))"-1)="[*]"}
if ($MyTurn[0] -eq "c" -and $HiddenComputer_c.Item("$($MyTurn.Substring(1))"-1) -eq "[S]") {
$HiddenComputer_c.Item("$($MyTurn.Substring(1))"-1)="[X]";$Computer_c.Item("$($MyTurn.Substring(1))"-1)="[X]";$Script:MyScore++}
if ($MyTurn[0] -eq "d" -and ($HiddenComputer_d.Item("$($MyTurn.Substring(1))"-1) -eq "[ ]" -or $HiddenComputer_d.Item("$($MyTurn.Substring(1))"-1) -eq "[*]")) {
$HiddenComputer_d.Item("$($MyTurn.Substring(1))"-1)="[*]";$Computer_d.Item("$($MyTurn.Substring(1))"-1)="[*]"}
if ($MyTurn[0] -eq "d" -and $HiddenComputer_d.Item("$($MyTurn.Substring(1))"-1) -eq "[S]") {
$HiddenComputer_d.Item("$($MyTurn.Substring(1))"-1)="[X]";$Computer_d.Item("$($MyTurn.Substring(1))"-1)="[X]";$Script:MyScore++}
if ($MyTurn[0] -eq "e" -and ($HiddenComputer_e.Item("$($MyTurn.Substring(1))"-1) -eq "[ ]" -or $HiddenComputer_e.Item("$($MyTurn.Substring(1))"-1) -eq "[*]")) {
$HiddenComputer_e.Item("$($MyTurn.Substring(1))"-1)="[*]";$Computer_e.Item("$($MyTurn.Substring(1))"-1)="[*]"}
if ($MyTurn[0] -eq "e" -and $HiddenComputer_e.Item("$($MyTurn.Substring(1))"-1) -eq "[S]") {
$HiddenComputer_e.Item("$($MyTurn.Substring(1))"-1)="[X]";$Computer_e.Item("$($MyTurn.Substring(1))"-1)="[X]";$Script:MyScore++}
if ($MyTurn[0] -eq "f" -and ($HiddenComputer_f.Item("$($MyTurn.Substring(1))"-1) -eq "[ ]" -or $HiddenComputer_f.Item("$($MyTurn.Substring(1))"-1) -eq "[*]")) {
$HiddenComputer_f.Item("$($MyTurn.Substring(1))"-1)="[*]";$Computer_f.Item("$($MyTurn.Substring(1))"-1)="[*]"}
if ($MyTurn[0] -eq "f" -and $HiddenComputer_f.Item("$($MyTurn.Substring(1))"-1) -eq "[S]") {
$HiddenComputer_f.Item("$($MyTurn.Substring(1))"-1)="[X]";$Computer_f.Item("$($MyTurn.Substring(1))"-1)="[X]";$Script:MyScore++}
if ($MyTurn[0] -eq "g" -and ($HiddenComputer_g.Item("$($MyTurn.Substring(1))"-1) -eq "[ ]" -or $HiddenComputer_g.Item("$($MyTurn.Substring(1))"-1) -eq "[*]")) {
$HiddenComputer_g.Item("$($MyTurn.Substring(1))"-1)="[*]";$Computer_g.Item("$($MyTurn.Substring(1))"-1)="[*]"}
if ($MyTurn[0] -eq "g" -and $HiddenComputer_g.Item("$($MyTurn.Substring(1))"-1) -eq "[S]") {
$HiddenComputer_g.Item("$($MyTurn.Substring(1))"-1)="[X]";$Computer_g.Item("$($MyTurn.Substring(1))"-1)="[X]";$Script:MyScore++}
if ($MyTurn[0] -eq "h" -and ($HiddenComputer_h.Item("$($MyTurn.Substring(1))"-1) -eq "[ ]" -or $HiddenComputer_h.Item("$($MyTurn.Substring(1))"-1) -eq "[*]")) {
$HiddenComputer_h.Item("$($MyTurn.Substring(1))"-1)="[*]";$Computer_h.Item("$($MyTurn.Substring(1))"-1)="[*]"}
if ($MyTurn[0] -eq "h" -and $HiddenComputer_h.Item("$($MyTurn.Substring(1))"-1) -eq "[S]") {
$HiddenComputer_h.Item("$($MyTurn.Substring(1))"-1)="[X]";$Computer_h.Item("$($MyTurn.Substring(1))"-1)="[X]";$Script:MyScore++}
if ($MyTurn[0] -eq "i" -and ($HiddenComputer_i.Item("$($MyTurn.Substring(1))"-1) -eq "[ ]" -or $HiddenComputer_i.Item("$($MyTurn.Substring(1))"-1) -eq "[*]")) {
$HiddenComputer_i.Item("$($MyTurn.Substring(1))"-1)="[*]";$Computer_i.Item("$($MyTurn.Substring(1))"-1)="[*]"}
if ($MyTurn[0] -eq "i" -and $HiddenComputer_i.Item("$($MyTurn.Substring(1))"-1) -eq "[S]") {
$HiddenComputer_i.Item("$($MyTurn.Substring(1))"-1)="[X]";$Computer_i.Item("$($MyTurn.Substring(1))"-1)="[X]";$Script:MyScore++}
if ($MyTurn[0] -eq "j" -and ($HiddenComputer_j.Item("$($MyTurn.Substring(1))"-1) -eq "[ ]" -or $HiddenComputer_j.Item("$($MyTurn.Substring(1))"-1) -eq "[*]")) {
$HiddenComputer_j.Item("$($MyTurn.Substring(1))"-1)="[*]";$Computer_j.Item("$($MyTurn.Substring(1))"-1)="[*]"}
if ($MyTurn[0] -eq "j" -and $HiddenComputer_j.Item("$($MyTurn.Substring(1))"-1) -eq "[S]") {
$HiddenComputer_j.Item("$($MyTurn.Substring(1))"-1)="[X]";$Computer_j.Item("$($MyTurn.Substring(1))"-1)="[X]";$Script:MyScore++}
}

# The same as above but for computer.
function ComputerMove {
if ($ComputerTurn[0] -eq "a" -and $Your_a.Item("$($ComputerTurn.Substring(1))"-1) -eq "[ ]") {$Your_a.Item("$($ComputerTurn.Substring(1))"-1)="[*]";$Your_a.Item("$($ComputerTurn.Substring(1))"-1)="[*]"}
if ($ComputerTurn[0] -eq "a" -and $Your_a.Item("$($ComputerTurn.Substring(1))"-1) -eq "[S]") {$Your_a.Item("$($ComputerTurn.Substring(1))"-1)="[X]";$Your_a.Item("$($ComputerTurn.Substring(1))"-1)="[X]";$Script:ComputerScore++}
if ($ComputerTurn[0] -eq "b" -and $Your_b.Item("$($ComputerTurn.Substring(1))"-1) -eq "[ ]") {$Your_b.Item("$($ComputerTurn.Substring(1))"-1)="[*]";$Your_b.Item("$($ComputerTurn.Substring(1))"-1)="[*]"}
if ($ComputerTurn[0] -eq "b" -and $Your_b.Item("$($ComputerTurn.Substring(1))"-1) -eq "[S]") {$Your_b.Item("$($ComputerTurn.Substring(1))"-1)="[X]";$Your_b.Item("$($ComputerTurn.Substring(1))"-1)="[X]";$Script:ComputerScore++}
if ($ComputerTurn[0] -eq "c" -and $Your_c.Item("$($ComputerTurn.Substring(1))"-1) -eq "[ ]") {$Your_c.Item("$($ComputerTurn.Substring(1))"-1)="[*]";$Your_c.Item("$($ComputerTurn.Substring(1))"-1)="[*]"}
if ($ComputerTurn[0] -eq "c" -and $Your_c.Item("$($ComputerTurn.Substring(1))"-1) -eq "[S]") {$Your_c.Item("$($ComputerTurn.Substring(1))"-1)="[X]";$Your_c.Item("$($ComputerTurn.Substring(1))"-1)="[X]";$Script:ComputerScore++}
if ($ComputerTurn[0] -eq "d" -and $Your_d.Item("$($ComputerTurn.Substring(1))"-1) -eq "[ ]") {$Your_d.Item("$($ComputerTurn.Substring(1))"-1)="[*]";$Your_d.Item("$($ComputerTurn.Substring(1))"-1)="[*]"}
if ($ComputerTurn[0] -eq "d" -and $Your_d.Item("$($ComputerTurn.Substring(1))"-1) -eq "[S]") {$Your_d.Item("$($ComputerTurn.Substring(1))"-1)="[X]";$Your_d.Item("$($ComputerTurn.Substring(1))"-1)="[X]";$Script:ComputerScore++}
if ($ComputerTurn[0] -eq "e" -and $Your_e.Item("$($ComputerTurn.Substring(1))"-1) -eq "[ ]") {$Your_e.Item("$($ComputerTurn.Substring(1))"-1)="[*]";$Your_e.Item("$($ComputerTurn.Substring(1))"-1)="[*]"}
if ($ComputerTurn[0] -eq "e" -and $Your_e.Item("$($ComputerTurn.Substring(1))"-1) -eq "[S]") {$Your_e.Item("$($ComputerTurn.Substring(1))"-1)="[X]";$Your_e.Item("$($ComputerTurn.Substring(1))"-1)="[X]";$Script:ComputerScore++}
if ($ComputerTurn[0] -eq "f" -and $Your_f.Item("$($ComputerTurn.Substring(1))"-1) -eq "[ ]") {$Your_f.Item("$($ComputerTurn.Substring(1))"-1)="[*]";$Your_f.Item("$($ComputerTurn.Substring(1))"-1)="[*]"}
if ($ComputerTurn[0] -eq "f" -and $Your_f.Item("$($ComputerTurn.Substring(1))"-1) -eq "[S]") {$Your_f.Item("$($ComputerTurn.Substring(1))"-1)="[X]";$Your_f.Item("$($ComputerTurn.Substring(1))"-1)="[X]";$Script:ComputerScore++}
if ($ComputerTurn[0] -eq "g" -and $Your_g.Item("$($ComputerTurn.Substring(1))"-1) -eq "[ ]") {$Your_g.Item("$($ComputerTurn.Substring(1))"-1)="[*]";$Your_g.Item("$($ComputerTurn.Substring(1))"-1)="[*]"}
if ($ComputerTurn[0] -eq "g" -and $Your_g.Item("$($ComputerTurn.Substring(1))"-1) -eq "[S]") {$Your_g.Item("$($ComputerTurn.Substring(1))"-1)="[X]";$Your_g.Item("$($ComputerTurn.Substring(1))"-1)="[X]";$Script:ComputerScore++}
if ($ComputerTurn[0] -eq "h" -and $Your_h.Item("$($ComputerTurn.Substring(1))"-1) -eq "[ ]") {$Your_h.Item("$($ComputerTurn.Substring(1))"-1)="[*]";$Your_h.Item("$($ComputerTurn.Substring(1))"-1)="[*]"}
if ($ComputerTurn[0] -eq "h" -and $Your_h.Item("$($ComputerTurn.Substring(1))"-1) -eq "[S]") {$Your_h.Item("$($ComputerTurn.Substring(1))"-1)="[X]";$Your_h.Item("$($ComputerTurn.Substring(1))"-1)="[X]";$Script:ComputerScore++}
if ($ComputerTurn[0] -eq "i" -and $Your_i.Item("$($ComputerTurn.Substring(1))"-1) -eq "[ ]") {$Your_i.Item("$($ComputerTurn.Substring(1))"-1)="[*]";$Your_i.Item("$($ComputerTurn.Substring(1))"-1)="[*]"}
if ($ComputerTurn[0] -eq "i" -and $Your_i.Item("$($ComputerTurn.Substring(1))"-1) -eq "[S]") {$Your_i.Item("$($ComputerTurn.Substring(1))"-1)="[X]";$Your_i.Item("$($ComputerTurn.Substring(1))"-1)="[X]";$Script:ComputerScore++}
if ($ComputerTurn[0] -eq "j" -and $Your_j.Item("$($ComputerTurn.Substring(1))"-1) -eq "[ ]") {$Your_j.Item("$($ComputerTurn.Substring(1))"-1)="[*]";$Your_j.Item("$($ComputerTurn.Substring(1))"-1)="[*]"}
if ($ComputerTurn[0] -eq "j" -and $Your_j.Item("$($ComputerTurn.Substring(1))"-1) -eq "[S]") {$Your_j.Item("$($ComputerTurn.Substring(1))"-1)="[X]";$Your_j.Item("$($ComputerTurn.Substring(1))"-1)="[X]";$Script:ComputerScore++}
MakeComputerSmart
}

# This function generates a ship perimeter. 1 - up, 2 - down, 3 - left (up/down), 4 -right (up/down).  
function ShipPerimeter {
$VerticalTempVar = "0123456789"
$GorizontalTempVar = "abcdefghij"

if ($PutYourShips.Length -eq 3) {
$1stDot = $PutYourShips[0] + 9
$3rdDot = ($GorizontalTempVar.Split("$($PutYourShips[0])")[0])[-1] + 9
$4thDot = ($GorizontalTempVar.Split("$($PutYourShips[0])")[1])[0] + 9 
}
Else {
$1stDot = $PutYourShips[0] + ($VerticalTempVar.Split("$($PutYourShips[1])")[0])[-1]
$2ndDot = $PutYourShips[0] + ($VerticalTempVar.Split("$($PutYourShips[1])")[1])[0]
$3rdDot = ($GorizontalTempVar.Split("$($PutYourShips[0])")[0])[-1] + $PutYourShips[1]
$4thDot = ($GorizontalTempVar.Split("$($PutYourShips[0])")[1])[0] + $PutYourShips[1]
}

if ($PutYourShips.Length -eq 3 -and $PutYourShips[0] -eq "a") {
$Your_a.Item("$($1stDot.Substring(1))"-1)="[*]"}
if ($1stDot[0] -eq "a" -and $PutYourShips.Length -ne 3) {
if ($PutYourShips -eq "a9") {$Your_a.Item(7)="[*]";$Your_a.Item(9)="[*]"}
else {
$Your_a.Item("$($1stDot.Substring(1))"-1)="[*]"
$Your_a.Item("$($2ndDot.Substring(1))"-1)="[*]"
}
}
if ($PutYourShips.Length -eq 3 -and $PutYourShips[0] -eq "b") {
$Your_b.Item("$($1stDot.Substring(1))"-1)="[*]"}
if ($1stDot[0] -eq "b" -and $PutYourShips.Length -ne 3) {
if ($PutYourShips -eq "b9") {$Your_b.Item(7)="[*]";$Your_b.Item(9)="[*]"}
else {
$Your_b.Item("$($1stDot.Substring(1))"-1)="[*]"
$Your_b.Item("$($2ndDot.Substring(1))"-1)="[*]"
}
}
if ($PutYourShips.Length -eq 3 -and $PutYourShips[0] -eq "c") {
$Your_c.Item("$($1stDot.Substring(1))"-1)="[*]"}
if ($1stDot[0] -eq "c" -and $PutYourShips.Length -ne 3) {
if ($PutYourShips -eq "c9") {$Your_c.Item(7)="[*]";$Your_c.Item(9)="[*]"}
else {
$Your_c.Item("$($1stDot.Substring(1))"-1)="[*]"
$Your_c.Item("$($2ndDot.Substring(1))"-1)="[*]"
}
}
if ($PutYourShips.Length -eq 3 -and $PutYourShips[0] -eq "d") {
$Your_d.Item("$($1stDot.Substring(1))"-1)="[*]"}
if ($1stDot[0] -eq "d" -and $PutYourShips.Length -ne 3) {
if ($PutYourShips -eq "d9") {$Your_d.Item(7)="[*]";$Your_d.Item(9)="[*]"}
else {
$Your_d.Item("$($1stDot.Substring(1))"-1)="[*]"
$Your_d.Item("$($2ndDot.Substring(1))"-1)="[*]"
}
}
if ($PutYourShips.Length -eq 3 -and $PutYourShips[0] -eq "e") {
$Your_e.Item("$($1stDot.Substring(1))"-1)="[*]"}
if ($1stDot[0] -eq "e" -and $PutYourShips.Length -ne 3) {
if ($PutYourShips -eq "e9") {$Your_e.Item(7)="[*]";$Your_e.Item(9)="[*]"}
else {
$Your_e.Item("$($1stDot.Substring(1))"-1)="[*]"
$Your_e.Item("$($2ndDot.Substring(1))"-1)="[*]"
}
}
if ($PutYourShips.Length -eq 3 -and $PutYourShips[0] -eq "f") {
$Your_f.Item("$($1stDot.Substring(1))"-1)="[*]"}
if ($1stDot[0] -eq "f" -and $PutYourShips.Length -ne 3) {
if ($PutYourShips -eq "f") {$Your_f.Item(7)="[*]";$Your_f.Item(9)="[*]"}
else {
$Your_f.Item("$($1stDot.Substring(1))"-1)="[*]"
$Your_f.Item("$($2ndDot.Substring(1))"-1)="[*]"
}
}
if ($PutYourShips.Length -eq 3 -and $PutYourShips[0] -eq "g") {
$Your_g.Item("$($1stDot.Substring(1))"-1)="[*]"}
if ($1stDot[0] -eq "g" -and $PutYourShips.Length -ne 3) {
if ($PutYourShips -eq "g9") {$Your_g.Item(7)="[*]";$Your_g.Item(9)="[*]"}
else {
$Your_g.Item("$($1stDot.Substring(1))"-1)="[*]"
$Your_g.Item("$($2ndDot.Substring(1))"-1)="[*]"
}
}
if ($PutYourShips.Length -eq 3 -and $PutYourShips[0] -eq "h") {
$Your_h.Item("$($1stDot.Substring(1))"-1)="[*]"}
if ($1stDot[0] -eq "h" -and $PutYourShips.Length -ne 3) {
if ($PutYourShips -eq "h9") {$Your_h.Item(7)="[*]";$Your_h.Item(9)="[*]"}
else {
$Your_h.Item("$($1stDot.Substring(1))"-1)="[*]"
$Your_h.Item("$($2ndDot.Substring(1))"-1)="[*]"
}
}
if ($PutYourShips.Length -eq 3 -and $PutYourShips[0] -eq "i") {
$Your_i.Item("$($1stDot.Substring(1))"-1)="[*]"}
if ($1stDot[0] -eq "i" -and $PutYourShips.Length -ne 3) {
if ($PutYourShips -eq "i9") {$Your_i.Item(7)="[*]";$Your_i.Item(9)="[*]"}
else {
$Your_i.Item("$($1stDot.Substring(1))"-1)="[*]"
$Your_i.Item("$($2ndDot.Substring(1))"-1)="[*]"
}
}
if ($PutYourShips.Length -eq 3 -and $PutYourShips[0] -eq "j") {
$Your_j.Item("$($1stDot.Substring(1))"-1)="[*]"}
if ($1stDot[0] -eq "j" -and $PutYourShips.Length -ne 3) {
if ($PutYourShips -eq "j9") {$Your_j.Item(7)="[*]";$Your_j.Item(9)="[*]"}
else {
$Your_j.Item("$($1stDot.Substring(1))"-1)="[*]"
$Your_j.Item("$($2ndDot.Substring(1))"-1)="[*]"
}
}

if ($3rdDot[0] -eq "a" -and $PutYourShips.Length -ne 3) {
$Your_a.Item("$($3rdDot.Substring(1))"-1)="[*]";$Your_a.Item("$($3rdDot.Substring(1))"-2)="[*]";$Your_a.Item("$($3rdDot.Substring(1))")="[*]"}
if ($4thDot[0] -eq "a" -and $PutYourShips.Length -ne 3) {
$Your_a.Item("$($4thDot.Substring(1))"-1)="[*]";$Your_a.Item("$($4thDot.Substring(1))"-2)="[*]";$Your_a.Item("$($4thDot.Substring(1))")="[*]"}
if ($3rdDot[0] -eq "b" -and $PutYourShips.Length -ne 3) {
$Your_b.Item("$($3rdDot.Substring(1))"-1)="[*]";$Your_b.Item("$($3rdDot.Substring(1))"-2)="[*]";$Your_b.Item("$($3rdDot.Substring(1))")="[*]"}
if ($4thDot[0] -eq "b" -and $PutYourShips.Length -ne 3) {
$Your_b.Item("$($4thDot.Substring(1))"-1)="[*]";$Your_b.Item("$($4thDot.Substring(1))"-2)="[*]";$Your_b.Item("$($4thDot.Substring(1))")="[*]"}
if ($3rdDot[0] -eq "c" -and $PutYourShips.Length -ne 3) {
$Your_c.Item("$($3rdDot.Substring(1))"-1)="[*]";$Your_c.Item("$($3rdDot.Substring(1))"-2)="[*]";$Your_c.Item("$($3rdDot.Substring(1))")="[*]"}
if ($4thDot[0] -eq "c" -and $PutYourShips.Length -ne 3) {
$Your_c.Item("$($4thDot.Substring(1))"-1)="[*]";$Your_c.Item("$($4thDot.Substring(1))"-2)="[*]";$Your_c.Item("$($4thDot.Substring(1))")="[*]"}
if ($3rdDot[0] -eq "d" -and $PutYourShips.Length -ne 3) {
$Your_d.Item("$($3rdDot.Substring(1))"-1)="[*]";$Your_d.Item("$($3rdDot.Substring(1))"-2)="[*]";$Your_d.Item("$($3rdDot.Substring(1))")="[*]"}
if ($4thDot[0] -eq "d" -and $PutYourShips.Length -ne 3) {
$Your_d.Item("$($4thDot.Substring(1))"-1)="[*]";$Your_d.Item("$($4thDot.Substring(1))"-2)="[*]";$Your_d.Item("$($4thDot.Substring(1))")="[*]"}
if ($3rdDot[0] -eq "e" -and $PutYourShips.Length -ne 3) {
$Your_e.Item("$($3rdDot.Substring(1))"-1)="[*]";$Your_e.Item("$($3rdDot.Substring(1))"-2)="[*]";$Your_e.Item("$($3rdDot.Substring(1))")="[*]"}
if ($4thDot[0] -eq "e" -and $PutYourShips.Length -ne 3) {
$Your_e.Item("$($4thDot.Substring(1))"-1)="[*]";$Your_e.Item("$($4thDot.Substring(1))"-2)="[*]";$Your_e.Item("$($4thDot.Substring(1))")="[*]"}
if ($3rdDot[0] -eq "f" -and $PutYourShips.Length -ne 3) {
$Your_f.Item("$($3rdDot.Substring(1))"-1)="[*]";$Your_f.Item("$($3rdDot.Substring(1))"-2)="[*]";$Your_f.Item("$($3rdDot.Substring(1))")="[*]"}
if ($4thDot[0] -eq "f" -and $PutYourShips.Length -ne 3) {
$Your_f.Item("$($4thDot.Substring(1))"-1)="[*]";$Your_f.Item("$($4thDot.Substring(1))"-2)="[*]";$Your_f.Item("$($4thDot.Substring(1))")="[*]"}
if ($3rdDot[0] -eq "g" -and $PutYourShips.Length -ne 3) {
$Your_g.Item("$($3rdDot.Substring(1))"-1)="[*]";$Your_g.Item("$($3rdDot.Substring(1))"-2)="[*]";$Your_g.Item("$($3rdDot.Substring(1))")="[*]"}
if ($4thDot[0] -eq "g" -and $PutYourShips.Length -ne 3) {
$Your_g.Item("$($4thDot.Substring(1))"-1)="[*]";$Your_g.Item("$($4thDot.Substring(1))"-2)="[*]";$Your_g.Item("$($4thDot.Substring(1))")="[*]"}
if ($3rdDot[0] -eq "h" -and $PutYourShips.Length -ne 3) {
$Your_h.Item("$($3rdDot.Substring(1))"-1)="[*]";$Your_h.Item("$($3rdDot.Substring(1))"-2)="[*]";$Your_h.Item("$($3rdDot.Substring(1))")="[*]"}
if ($4thDot[0] -eq "h" -and $PutYourShips.Length -ne 3) {
$Your_h.Item("$($4thDot.Substring(1))"-1)="[*]";$Your_h.Item("$($4thDot.Substring(1))"-2)="[*]";$Your_h.Item("$($4thDot.Substring(1))")="[*]"}
if ($3rdDot[0] -eq "i" -and $PutYourShips.Length -ne 3) {
$Your_i.Item("$($3rdDot.Substring(1))"-1)="[*]";$Your_i.Item("$($3rdDot.Substring(1))"-2)="[*]";$Your_i.Item("$($3rdDot.Substring(1))")="[*]"}
if ($4thDot[0] -eq "i" -and $PutYourShips.Length -ne 3) {
$Your_i.Item("$($4thDot.Substring(1))"-1)="[*]";$Your_i.Item("$($4thDot.Substring(1))"-2)="[*]";$Your_i.Item("$($4thDot.Substring(1))")="[*]"}
if ($3rdDot[0] -eq "j" -and $PutYourShips.Length -ne 3) {
$Your_j.Item("$($3rdDot.Substring(1))"-1)="[*]";$Your_j.Item("$($3rdDot.Substring(1))"-2)="[*]";$Your_j.Item("$($3rdDot.Substring(1))")="[*]"}
if ($4thDot[0] -eq "j" -and $PutYourShips.Length -ne 3) {
$Your_j.Item("$($4thDot.Substring(1))"-1)="[*]";$Your_j.Item("$($4thDot.Substring(1))"-2)="[*]";$Your_j.Item("$($4thDot.Substring(1))")="[*]"}

if ($PutYourShips.Length -eq 3 -and ($3rdDot -or $4thDot) -and $PutYourShips[0] -eq "a") {
$Your_b.Item(8)="[*]"
$Your_b.Item(9)="[*]"
}
if ($PutYourShips.Length -eq 3 -and ($3rdDot -or $4thDot) -and $PutYourShips[0] -eq "b") {
$Your_a.Item(8)="[*]"
$Your_c.Item(8)="[*]"
$Your_a.Item(9)="[*]"
$Your_c.Item(9)="[*]"
}
if ($PutYourShips.Length -eq 3 -and ($3rdDot -or $4thDot) -and $PutYourShips[0] -eq "c") {
$Your_b.Item(8)="[*]"
$Your_d.Item(8)="[*]"
$Your_b.Item(9)="[*]"
$Your_d.Item(9)="[*]"
}
if ($PutYourShips.Length -eq 3 -and ($3rdDot -or $4thDot) -and $PutYourShips[0] -eq "d") {
$Your_c.Item(8)="[*]"
$Your_e.Item(8)="[*]"
$Your_c.Item(9)="[*]"
$Your_e.Item(9)="[*]"
}
if ($PutYourShips.Length -eq 3 -and ($3rdDot -or $4thDot) -and $PutYourShips[0] -eq "e") {
$Your_d.Item(8)="[*]"
$Your_f.Item(8)="[*]"
$Your_d.Item(9)="[*]"
$Your_f.Item(9)="[*]"
}
if ($PutYourShips.Length -eq 3 -and ($3rdDot -or $4thDot) -and $PutYourShips[0] -eq "f") {
$Your_e.Item(8)="[*]"
$Your_g.Item(8)="[*]"
$Your_e.Item(9)="[*]"
$Your_g.Item(9)="[*]"
}
if ($PutYourShips.Length -eq 3 -and ($3rdDot -or $4thDot) -and $PutYourShips[0] -eq "g") {
$Your_f.Item(8)="[*]"
$Your_h.Item(8)="[*]"
$Your_f.Item(9)="[*]"
$Your_h.Item(9)="[*]"
}
if ($PutYourShips.Length -eq 3 -and ($3rdDot -or $4thDot) -and $PutYourShips[0] -eq "h") {
$Your_g.Item(8)="[*]"
$Your_i.Item(8)="[*]"
$Your_g.Item(9)="[*]"
$Your_i.Item(9)="[*]"
}
if ($PutYourShips.Length -eq 3 -and ($3rdDot -or $4thDot) -and $PutYourShips[0] -eq "i") {
$Your_h.Item(8)="[*]"
$Your_j.Item(8)="[*]"
$Your_h.Item(9)="[*]"
$Your_j.Item(9)="[*]"
}
if ($PutYourShips.Length -eq 3 -and ($3rdDot -or $4thDot) -and $PutYourShips[0] -eq "j") {
$Your_i.Item(8)="[*]"
$Your_i.Item(9)="[*]"
}
}

# This function generates a ship perimeter for computer. 1 - up, 2 - down, 3 - left (up/down), 4 -right (up/down). 
function ComputerShipPerimeter {
$VerticalTempVar = "0123456789"
$GorizontalTempVar = "abcdefghij"

if ($GetRandomGeneratedComputerShip.Length -eq 3) {
$1stDot = $GetRandomGeneratedComputerShip[0] + 9
$3rdDot = ($GorizontalTempVar.Split("$($GetRandomGeneratedComputerShip[0])")[0])[-1] + 9
$4thDot = ($GorizontalTempVar.Split("$($GetRandomGeneratedComputerShip[0])")[1])[0] + 9 
}
Else {
$1stDot = $GetRandomGeneratedComputerShip[0] + ($VerticalTempVar.Split("$($GetRandomGeneratedComputerShip[1])")[0])[-1]
$2ndDot = $GetRandomGeneratedComputerShip[0] + ($VerticalTempVar.Split("$($GetRandomGeneratedComputerShip[1])")[1])[0]
$3rdDot = ($GorizontalTempVar.Split("$($GetRandomGeneratedComputerShip[0])")[0])[-1] + $GetRandomGeneratedComputerShip[1]
$4thDot = ($GorizontalTempVar.Split("$($GetRandomGeneratedComputerShip[0])")[1])[0] + $GetRandomGeneratedComputerShip[1]
}

if ($GetRandomGeneratedComputerShip.Length -eq 3 -and $GetRandomGeneratedComputerShip[0] -eq "a") {
$HiddenComputer_a.Item("$($1stDot.Substring(1))"-1)="[*]"}
if ($1stDot[0] -eq "a" -and $GetRandomGeneratedComputerShip.Length -ne 3) {
if ($GetRandomGeneratedComputerShip -eq "a9") {$HiddenComputer_a.Item(7)="[*]";$HiddenComputer_a.Item(9)="[*]"}
else {
$HiddenComputer_a.Item("$($1stDot.Substring(1))"-1)="[*]"
$HiddenComputer_a.Item("$($2ndDot.Substring(1))"-1)="[*]"
}
}
if ($GetRandomGeneratedComputerShip.Length -eq 3 -and $GetRandomGeneratedComputerShip[0] -eq "b") {
$HiddenComputer_b.Item("$($1stDot.Substring(1))"-1)="[*]"}
if ($1stDot[0] -eq "b" -and $GetRandomGeneratedComputerShip.Length -ne 3) {
if ($GetRandomGeneratedComputerShip -eq "b9") {$HiddenComputer_b.Item(7)="[*]";$HiddenComputer_b.Item(9)="[*]"}
else {
$HiddenComputer_b.Item("$($1stDot.Substring(1))"-1)="[*]"
$HiddenComputer_b.Item("$($2ndDot.Substring(1))"-1)="[*]"
}
}
if ($GetRandomGeneratedComputerShip.Length -eq 3 -and $GetRandomGeneratedComputerShip[0] -eq "c") {
$HiddenComputer_c.Item("$($1stDot.Substring(1))"-1)="[*]"}
if ($1stDot[0] -eq "c" -and $GetRandomGeneratedComputerShip.Length -ne 3) {
if ($GetRandomGeneratedComputerShip -eq "c9") {$HiddenComputer_c.Item(7)="[*]";$HiddenComputer_c.Item(9)="[*]"}
else {
$HiddenComputer_c.Item("$($1stDot.Substring(1))"-1)="[*]"
$HiddenComputer_c.Item("$($2ndDot.Substring(1))"-1)="[*]"
}
}
if ($GetRandomGeneratedComputerShip.Length -eq 3 -and $GetRandomGeneratedComputerShip[0] -eq "d") {
$HiddenComputer_d.Item("$($1stDot.Substring(1))"-1)="[*]"}
if ($1stDot[0] -eq "d" -and $GetRandomGeneratedComputerShip.Length -ne 3) {
if ($GetRandomGeneratedComputerShip -eq "d9") {$HiddenComputer_d.Item(7)="[*]";$HiddenComputer_d.Item(9)="[*]"}
else {
$HiddenComputer_d.Item("$($1stDot.Substring(1))"-1)="[*]"
$HiddenComputer_d.Item("$($2ndDot.Substring(1))"-1)="[*]"
}
}
if ($GetRandomGeneratedComputerShip.Length -eq 3 -and $GetRandomGeneratedComputerShip[0] -eq "e") {
$HiddenComputer_e.Item("$($1stDot.Substring(1))"-1)="[*]"}
if ($1stDot[0] -eq "e" -and $GetRandomGeneratedComputerShip.Length -ne 3) {
if ($GetRandomGeneratedComputerShip -eq "e9") {$HiddenComputer_e.Item(7)="[*]";$HiddenComputer_e.Item(9)="[*]"}
else {
$HiddenComputer_e.Item("$($1stDot.Substring(1))"-1)="[*]"
$HiddenComputer_e.Item("$($2ndDot.Substring(1))"-1)="[*]"
}
}
if ($GetRandomGeneratedComputerShip.Length -eq 3 -and $GetRandomGeneratedComputerShip[0] -eq "f") {
$HiddenComputer_f.Item("$($1stDot.Substring(1))"-1)="[*]"}
if ($1stDot[0] -eq "f" -and $GetRandomGeneratedComputerShip.Length -ne 3) {
if ($GetRandomGeneratedComputerShip -eq "f") {$HiddenComputer_f.Item(7)="[*]";$HiddenComputer_f.Item(9)="[*]"}
else {
$HiddenComputer_f.Item("$($1stDot.Substring(1))"-1)="[*]"
$HiddenComputer_f.Item("$($2ndDot.Substring(1))"-1)="[*]"
}
}
if ($GetRandomGeneratedComputerShip.Length -eq 3 -and $GetRandomGeneratedComputerShip[0] -eq "g") {
$HiddenComputer_g.Item("$($1stDot.Substring(1))"-1)="[*]"}
if ($1stDot[0] -eq "g" -and $GetRandomGeneratedComputerShip.Length -ne 3) {
if ($GetRandomGeneratedComputerShip -eq "g9") {$HiddenComputer_g.Item(7)="[*]";$HiddenComputer_g.Item(9)="[*]"}
else {
$HiddenComputer_g.Item("$($1stDot.Substring(1))"-1)="[*]"
$HiddenComputer_g.Item("$($2ndDot.Substring(1))"-1)="[*]"
}
}
if ($GetRandomGeneratedComputerShip.Length -eq 3 -and $GetRandomGeneratedComputerShip[0] -eq "h") {
$HiddenComputer_h.Item("$($1stDot.Substring(1))"-1)="[*]"}
if ($1stDot[0] -eq "h" -and $GetRandomGeneratedComputerShip.Length -ne 3) {
if ($GetRandomGeneratedComputerShip -eq "h9") {$HiddenComputer_h.Item(7)="[*]";$HiddenComputer_h.Item(9)="[*]"}
else {
$HiddenComputer_h.Item("$($1stDot.Substring(1))"-1)="[*]"
$HiddenComputer_h.Item("$($2ndDot.Substring(1))"-1)="[*]"
}
}
if ($GetRandomGeneratedComputerShip.Length -eq 3 -and $GetRandomGeneratedComputerShip[0] -eq "i") {
$HiddenComputer_i.Item("$($1stDot.Substring(1))"-1)="[*]"}
if ($1stDot[0] -eq "i" -and $GetRandomGeneratedComputerShip.Length -ne 3) {
if ($GetRandomGeneratedComputerShip -eq "i9") {$HiddenComputer_i.Item(7)="[*]";$HiddenComputer_i.Item(9)="[*]"}
else {
$HiddenComputer_i.Item("$($1stDot.Substring(1))"-1)="[*]"
$HiddenComputer_i.Item("$($2ndDot.Substring(1))"-1)="[*]"
}
}
if ($GetRandomGeneratedComputerShip.Length -eq 3 -and $GetRandomGeneratedComputerShip[0] -eq "j") {
$HiddenComputer_j.Item("$($1stDot.Substring(1))"-1)="[*]"}
if ($1stDot[0] -eq "j" -and $GetRandomGeneratedComputerShip.Length -ne 3) {
if ($GetRandomGeneratedComputerShip -eq "j9") {$HiddenComputer_j.Item(7)="[*]";$HiddenComputer_j.Item(9)="[*]"}
else {
$HiddenComputer_j.Item("$($1stDot.Substring(1))"-1)="[*]"
$HiddenComputer_j.Item("$($2ndDot.Substring(1))"-1)="[*]"
}
}

if ($3rdDot[0] -eq "a" -and $GetRandomGeneratedComputerShip.Length -ne 3) {
$HiddenComputer_a.Item("$($3rdDot.Substring(1))"-1)="[*]";$HiddenComputer_a.Item("$($3rdDot.Substring(1))"-2)="[*]";$HiddenComputer_a.Item("$($3rdDot.Substring(1))")="[*]"}
if ($4thDot[0] -eq "a" -and $GetRandomGeneratedComputerShip.Length -ne 3) {
$HiddenComputer_a.Item("$($4thDot.Substring(1))"-1)="[*]";$HiddenComputer_a.Item("$($4thDot.Substring(1))"-2)="[*]";$HiddenComputer_a.Item("$($4thDot.Substring(1))")="[*]"}
if ($3rdDot[0] -eq "b" -and $GetRandomGeneratedComputerShip.Length -ne 3) {
$HiddenComputer_b.Item("$($3rdDot.Substring(1))"-1)="[*]";$HiddenComputer_b.Item("$($3rdDot.Substring(1))"-2)="[*]";$HiddenComputer_b.Item("$($3rdDot.Substring(1))")="[*]"}
if ($4thDot[0] -eq "b" -and $GetRandomGeneratedComputerShip.Length -ne 3) {
$HiddenComputer_b.Item("$($4thDot.Substring(1))"-1)="[*]";$HiddenComputer_b.Item("$($4thDot.Substring(1))"-2)="[*]";$HiddenComputer_b.Item("$($4thDot.Substring(1))")="[*]"}
if ($3rdDot[0] -eq "c" -and $GetRandomGeneratedComputerShip.Length -ne 3) {
$HiddenComputer_c.Item("$($3rdDot.Substring(1))"-1)="[*]";$HiddenComputer_c.Item("$($3rdDot.Substring(1))"-2)="[*]";$HiddenComputer_c.Item("$($3rdDot.Substring(1))")="[*]"}
if ($4thDot[0] -eq "c" -and $GetRandomGeneratedComputerShip.Length -ne 3) {
$HiddenComputer_c.Item("$($4thDot.Substring(1))"-1)="[*]";$HiddenComputer_c.Item("$($4thDot.Substring(1))"-2)="[*]";$HiddenComputer_c.Item("$($4thDot.Substring(1))")="[*]"}
if ($3rdDot[0] -eq "d" -and $GetRandomGeneratedComputerShip.Length -ne 3) {
$HiddenComputer_d.Item("$($3rdDot.Substring(1))"-1)="[*]";$HiddenComputer_d.Item("$($3rdDot.Substring(1))"-2)="[*]";$HiddenComputer_d.Item("$($3rdDot.Substring(1))")="[*]"}
if ($4thDot[0] -eq "d" -and $GetRandomGeneratedComputerShip.Length -ne 3) {
$HiddenComputer_d.Item("$($4thDot.Substring(1))"-1)="[*]";$HiddenComputer_d.Item("$($4thDot.Substring(1))"-2)="[*]";$HiddenComputer_d.Item("$($4thDot.Substring(1))")="[*]"}
if ($3rdDot[0] -eq "e" -and $GetRandomGeneratedComputerShip.Length -ne 3) {
$HiddenComputer_e.Item("$($3rdDot.Substring(1))"-1)="[*]";$HiddenComputer_e.Item("$($3rdDot.Substring(1))"-2)="[*]";$HiddenComputer_e.Item("$($3rdDot.Substring(1))")="[*]"}
if ($4thDot[0] -eq "e" -and $GetRandomGeneratedComputerShip.Length -ne 3) {
$HiddenComputer_e.Item("$($4thDot.Substring(1))"-1)="[*]";$HiddenComputer_e.Item("$($4thDot.Substring(1))"-2)="[*]";$HiddenComputer_e.Item("$($4thDot.Substring(1))")="[*]"}
if ($3rdDot[0] -eq "f" -and $GetRandomGeneratedComputerShip.Length -ne 3) {
$HiddenComputer_f.Item("$($3rdDot.Substring(1))"-1)="[*]";$HiddenComputer_f.Item("$($3rdDot.Substring(1))"-2)="[*]";$HiddenComputer_f.Item("$($3rdDot.Substring(1))")="[*]"}
if ($4thDot[0] -eq "f" -and $GetRandomGeneratedComputerShip.Length -ne 3) {
$HiddenComputer_f.Item("$($4thDot.Substring(1))"-1)="[*]";$HiddenComputer_f.Item("$($4thDot.Substring(1))"-2)="[*]";$HiddenComputer_f.Item("$($4thDot.Substring(1))")="[*]"}
if ($3rdDot[0] -eq "g" -and $GetRandomGeneratedComputerShip.Length -ne 3) {
$HiddenComputer_g.Item("$($3rdDot.Substring(1))"-1)="[*]";$HiddenComputer_g.Item("$($3rdDot.Substring(1))"-2)="[*]";$HiddenComputer_g.Item("$($3rdDot.Substring(1))")="[*]"}
if ($4thDot[0] -eq "g" -and $GetRandomGeneratedComputerShip.Length -ne 3) {
$HiddenComputer_g.Item("$($4thDot.Substring(1))"-1)="[*]";$HiddenComputer_g.Item("$($4thDot.Substring(1))"-2)="[*]";$HiddenComputer_g.Item("$($4thDot.Substring(1))")="[*]"}
if ($3rdDot[0] -eq "h" -and $GetRandomGeneratedComputerShip.Length -ne 3) {
$HiddenComputer_h.Item("$($3rdDot.Substring(1))"-1)="[*]";$HiddenComputer_h.Item("$($3rdDot.Substring(1))"-2)="[*]";$HiddenComputer_h.Item("$($3rdDot.Substring(1))")="[*]"}
if ($4thDot[0] -eq "h" -and $GetRandomGeneratedComputerShip.Length -ne 3) {
$HiddenComputer_h.Item("$($4thDot.Substring(1))"-1)="[*]";$HiddenComputer_h.Item("$($4thDot.Substring(1))"-2)="[*]";$HiddenComputer_h.Item("$($4thDot.Substring(1))")="[*]"}
if ($3rdDot[0] -eq "i" -and $GetRandomGeneratedComputerShip.Length -ne 3) {
$HiddenComputer_i.Item("$($3rdDot.Substring(1))"-1)="[*]";$HiddenComputer_i.Item("$($3rdDot.Substring(1))"-2)="[*]";$HiddenComputer_i.Item("$($3rdDot.Substring(1))")="[*]"}
if ($4thDot[0] -eq "i" -and $GetRandomGeneratedComputerShip.Length -ne 3) {
$HiddenComputer_i.Item("$($4thDot.Substring(1))"-1)="[*]";$HiddenComputer_i.Item("$($4thDot.Substring(1))"-2)="[*]";$HiddenComputer_i.Item("$($4thDot.Substring(1))")="[*]"}
if ($3rdDot[0] -eq "j" -and $GetRandomGeneratedComputerShip.Length -ne 3) {
$HiddenComputer_j.Item("$($3rdDot.Substring(1))"-1)="[*]";$HiddenComputer_j.Item("$($3rdDot.Substring(1))"-2)="[*]";$HiddenComputer_j.Item("$($3rdDot.Substring(1))")="[*]"}
if ($4thDot[0] -eq "j" -and $GetRandomGeneratedComputerShip.Length -ne 3) {
$HiddenComputer_j.Item("$($4thDot.Substring(1))"-1)="[*]";$HiddenComputer_j.Item("$($4thDot.Substring(1))"-2)="[*]";$HiddenComputer_j.Item("$($4thDot.Substring(1))")="[*]"}

if ($GetRandomGeneratedComputerShip.Length -eq 3 -and ($3rdDot -or $4thDot) -and $GetRandomGeneratedComputerShip[0] -eq "a") {
$HiddenComputer_b.Item(8)="[*]"
$HiddenComputer_b.Item(9)="[*]"
}
if ($GetRandomGeneratedComputerShip.Length -eq 3 -and ($3rdDot -or $4thDot) -and $GetRandomGeneratedComputerShip[0] -eq "b") {
$HiddenComputer_a.Item(8)="[*]"
$HiddenComputer_c.Item(8)="[*]"
$HiddenComputer_a.Item(9)="[*]"
$HiddenComputer_c.Item(9)="[*]"
}
if ($GetRandomGeneratedComputerShip.Length -eq 3 -and ($3rdDot -or $4thDot) -and $GetRandomGeneratedComputerShip[0] -eq "c") {
$HiddenComputer_b.Item(8)="[*]"
$HiddenComputer_d.Item(8)="[*]"
$HiddenComputer_b.Item(9)="[*]"
$HiddenComputer_d.Item(9)="[*]"
}
if ($GetRandomGeneratedComputerShip.Length -eq 3 -and ($3rdDot -or $4thDot) -and $GetRandomGeneratedComputerShip[0] -eq "d") {
$HiddenComputer_c.Item(8)="[*]"
$HiddenComputer_e.Item(8)="[*]"
$HiddenComputer_c.Item(9)="[*]"
$HiddenComputer_e.Item(9)="[*]"
}
if ($GetRandomGeneratedComputerShip.Length -eq 3 -and ($3rdDot -or $4thDot) -and $GetRandomGeneratedComputerShip[0] -eq "e") {
$HiddenComputer_d.Item(8)="[*]"
$HiddenComputer_f.Item(8)="[*]"
$HiddenComputer_d.Item(9)="[*]"
$HiddenComputer_f.Item(9)="[*]"
}
if ($GetRandomGeneratedComputerShip.Length -eq 3 -and ($3rdDot -or $4thDot) -and $GetRandomGeneratedComputerShip[0] -eq "f") {
$HiddenComputer_e.Item(8)="[*]"
$HiddenComputer_g.Item(8)="[*]"
$HiddenComputer_e.Item(9)="[*]"
$HiddenComputer_g.Item(9)="[*]"
}
if ($GetRandomGeneratedComputerShip.Length -eq 3 -and ($3rdDot -or $4thDot) -and $GetRandomGeneratedComputerShip[0] -eq "g") {
$HiddenComputer_f.Item(8)="[*]"
$HiddenComputer_h.Item(8)="[*]"
$HiddenComputer_f.Item(9)="[*]"
$HiddenComputer_h.Item(9)="[*]"
}
if ($GetRandomGeneratedComputerShip.Length -eq 3 -and ($3rdDot -or $4thDot) -and $GetRandomGeneratedComputerShip[0] -eq "h") {
$HiddenComputer_g.Item(8)="[*]"
$HiddenComputer_i.Item(8)="[*]"
$HiddenComputer_g.Item(9)="[*]"
$HiddenComputer_i.Item(9)="[*]"
}
if ($GetRandomGeneratedComputerShip.Length -eq 3 -and ($3rdDot -or $4thDot) -and $GetRandomGeneratedComputerShip[0] -eq "i") {
$HiddenComputer_h.Item(8)="[*]"
$HiddenComputer_j.Item(8)="[*]"
$HiddenComputer_h.Item(9)="[*]"
$HiddenComputer_j.Item(9)="[*]"
}
if ($GetRandomGeneratedComputerShip.Length -eq 3 -and ($3rdDot -or $4thDot) -and $GetRandomGeneratedComputerShip[0] -eq "j") {
$HiddenComputer_i.Item(8)="[*]"
$HiddenComputer_i.Item(9)="[*]"
}
}

# This function allows computer to move again if it hit perimeter near destroyed ship. Used at the end of ComputerMove function.
function MakeComputerSmart {
$Script:IamSmart = @()
$VerticalTempVar = "0123456789"
$GorizontalTempVar = "abcdefghij"

if ($ComputerTurn.Length -eq 3) {
$1stDot = $ComputerTurn[0] + 9
$3rdDot = ($GorizontalTempVar.Split("$($ComputerTurn[0])")[0])[-1] + 9
$4thDot = ($GorizontalTempVar.Split("$($ComputerTurn[0])")[1])[0] + 9 
}
Else {
$1stDot = $ComputerTurn[0] + ($VerticalTempVar.Split("$($ComputerTurn[1])")[0])[-1]
$2ndDot = $ComputerTurn[0] + ($VerticalTempVar.Split("$($ComputerTurn[1])")[1])[0]
$3rdDot = ($GorizontalTempVar.Split("$($ComputerTurn[0])")[0])[-1] + $ComputerTurn[1]
$4thDot = ($GorizontalTempVar.Split("$($ComputerTurn[0])")[1])[0] + $ComputerTurn[1]
}

if ($ComputerTurn.Length -eq 3 -and $ComputerTurn[0] -eq "a") {
if ($Your_a.Item("$($1stDot.Substring(1))"-1) -eq "[X]") {$Script:IamSmart = "True"}}
if ($1stDot[0] -eq "a" -and $ComputerTurn.Length -ne 3) {
if ($ComputerTurn -eq "a9") {if ($Your_a.Item(7) -eq "[X]") {$Script:IamSmart = "True"};if ($Your_a.Item(9) -eq "[X]") {$Script:IamSmart = "True"}}
else {
if ($Your_a.Item("$($1stDot.Substring(1))"-1) -eq "[X]") {$Script:IamSmart = "True"}
if ($Your_a.Item("$($2ndDot.Substring(1))"-1) -eq "[X]") {$Script:IamSmart = "True"}
}
}
if ($ComputerTurn.Length -eq 3 -and $ComputerTurn[0] -eq "b") {
if ($Your_b.Item("$($1stDot.Substring(1))"-1) -eq "[X]") {$Script:IamSmart = "True"}}
if ($1stDot[0] -eq "b" -and $ComputerTurn.Length -ne 3) {
if ($ComputerTurn -eq "b9") {if ($Your_b.Item(7) -eq "[X]") {$Script:IamSmart = "True"};if ($Your_b.Item(9) -eq "[X]") {$Script:IamSmart = "True"}}
else {
if ($Your_b.Item("$($1stDot.Substring(1))"-1) -eq "[X]") {$Script:IamSmart = "True"}
if ($Your_b.Item("$($2ndDot.Substring(1))"-1) -eq "[X]") {$Script:IamSmart = "True"}
}
}
if ($ComputerTurn.Length -eq 3 -and $ComputerTurn[0] -eq "c") {
if ($Your_c.Item("$($1stDot.Substring(1))"-1) -eq "[X]") {$Script:IamSmart = "True"}}
if ($1stDot[0] -eq "c" -and $ComputerTurn.Length -ne 3) {
if ($ComputerTurn -eq "c9") {if ($Your_c.Item(7) -eq "[X]") {$Script:IamSmart = "True"};if ($Your_c.Item(9) -eq "[X]") {$Script:IamSmart = "True"}}
else {
if ($Your_c.Item("$($1stDot.Substring(1))"-1) -eq "[X]") {$Script:IamSmart = "True"}
if ($Your_c.Item("$($2ndDot.Substring(1))"-1) -eq "[X]") {$Script:IamSmart = "True"}
}
}
if ($ComputerTurn.Length -eq 3 -and $ComputerTurn[0] -eq "d") {
if ($Your_d.Item("$($1stDot.Substring(1))"-1) -eq "[X]") {$Script:IamSmart = "True"}}
if ($1stDot[0] -eq "d" -and $ComputerTurn.Length -ne 3) {
if ($ComputerTurn -eq "d9") {if ($Your_d.Item(7) -eq "[X]") {$Script:IamSmart = "True"};if ($Your_d.Item(9) -eq "[X]") {$Script:IamSmart = "True"}}
else {
if ($Your_d.Item("$($1stDot.Substring(1))"-1) -eq "[X]") {$Script:IamSmart = "True"}
if ($Your_d.Item("$($2ndDot.Substring(1))"-1) -eq "[X]") {$Script:IamSmart = "True"}
}
}
if ($ComputerTurn.Length -eq 3 -and $ComputerTurn[0] -eq "e") {
if ($Your_e.Item("$($1stDot.Substring(1))"-1) -eq "[X]") {$Script:IamSmart = "True"}}
if ($1stDot[0] -eq "e" -and $ComputerTurn.Length -ne 3) {
if ($ComputerTurn -eq "e9") {if ($Your_e.Item(7) -eq "[X]") {$Script:IamSmart = "True"};if ($Your_e.Item(9) -eq "[X]") {$Script:IamSmart = "True"}}
else {
if ($Your_e.Item("$($1stDot.Substring(1))"-1) -eq "[X]") {$Script:IamSmart = "True"}
if ($Your_e.Item("$($2ndDot.Substring(1))"-1) -eq "[X]") {$Script:IamSmart = "True"}
}
}
if ($ComputerTurn.Length -eq 3 -and $ComputerTurn[0] -eq "f") {
if ($Your_f.Item("$($1stDot.Substring(1))"-1) -eq "[X]") {$Script:IamSmart = "True"}}
if ($1stDot[0] -eq "f" -and $ComputerTurn.Length -ne 3) {
if ($ComputerTurn -eq "f") {if ($Your_f.Item(7) -eq "[X]") {$Script:IamSmart = "True"};if ($Your_f.Item(9) -eq "[X]") {$Script:IamSmart = "True"}}
else {
if ($Your_f.Item("$($1stDot.Substring(1))"-1) -eq "[X]") {$Script:IamSmart = "True"}
if ($Your_f.Item("$($2ndDot.Substring(1))"-1) -eq "[X]") {$Script:IamSmart = "True"}
}
}
if ($ComputerTurn.Length -eq 3 -and $ComputerTurn[0] -eq "g") {
if ($Your_g.Item("$($1stDot.Substring(1))"-1) -eq "[X]") {$Script:IamSmart = "True"}}
if ($1stDot[0] -eq "g" -and $ComputerTurn.Length -ne 3) {
if ($ComputerTurn -eq "g9") {if ($Your_g.Item(7) -eq "[X]") {$Script:IamSmart = "True"};if ($Your_g.Item(9) -eq "[X]") {$Script:IamSmart = "True"}}
else {
if ($Your_g.Item("$($1stDot.Substring(1))"-1) -eq "[X]") {$Script:IamSmart = "True"}
if ($Your_g.Item("$($2ndDot.Substring(1))"-1) -eq "[X]") {$Script:IamSmart = "True"}
}
}
if ($ComputerTurn.Length -eq 3 -and $ComputerTurn[0] -eq "h") {
if ($Your_h.Item("$($1stDot.Substring(1))"-1) -eq "[X]") {$Script:IamSmart = "True"}}
if ($1stDot[0] -eq "h" -and $ComputerTurn.Length -ne 3) {
if ($ComputerTurn -eq "h9") {if ($Your_h.Item(7) -eq "[X]") {$Script:IamSmart = "True"};if ($Your_h.Item(9) -eq "[X]") {$Script:IamSmart = "True"}}
else {
if ($Your_h.Item("$($1stDot.Substring(1))"-1) -eq "[X]") {$Script:IamSmart = "True"}
if ($Your_h.Item("$($2ndDot.Substring(1))"-1) -eq "[X]") {$Script:IamSmart = "True"}
}
}
if ($ComputerTurn.Length -eq 3 -and $ComputerTurn[0] -eq "i") {
if ($Your_i.Item("$($1stDot.Substring(1))"-1) -eq "[X]") {$Script:IamSmart = "True"}}
if ($1stDot[0] -eq "i" -and $ComputerTurn.Length -ne 3) {
if ($ComputerTurn -eq "i9") {if ($Your_i.Item(7) -eq "[X]") {$Script:IamSmart = "True"};if ($Your_i.Item(9) -eq "[X]") {$Script:IamSmart = "True"}}
else {
if ($Your_i.Item("$($1stDot.Substring(1))"-1) -eq "[X]") {$Script:IamSmart = "True"}
if ($Your_i.Item("$($2ndDot.Substring(1))"-1) -eq "[X]") {$Script:IamSmart = "True"}
}
}
if ($ComputerTurn.Length -eq 3 -and $ComputerTurn[0] -eq "j") {
if ($Your_j.Item("$($1stDot.Substring(1))"-1) -eq "[X]") {$Script:IamSmart = "True"}}
if ($1stDot[0] -eq "j" -and $ComputerTurn.Length -ne 3) {
if ($ComputerTurn -eq "j9") {if ($Your_j.Item(7) -eq "[X]") {$Script:IamSmart = "True"};if ($Your_j.Item(9) -eq "[X]") {$Script:IamSmart = "True"}}
else {
if ($Your_j.Item("$($1stDot.Substring(1))"-1) -eq "[X]") {$Script:IamSmart = "True"}
if ($Your_j.Item("$($2ndDot.Substring(1))"-1) -eq "[X]") {$Script:IamSmart = "True"}
}
}

if ($3rdDot[0] -eq "a" -and $ComputerTurn.Length -ne 3) {
if ($Your_a.Item("$($3rdDot.Substring(1))"-1) -eq "[X]") {$Script:IamSmart = "True"};if ($Your_a.Item("$($3rdDot.Substring(1))"-2) -eq "[X]") {$Script:IamSmart = "True"};if ($Your_a.Item("$($3rdDot.Substring(1))") -eq "[X]") {$Script:IamSmart = "True"}}
if ($4thDot[0] -eq "a" -and $ComputerTurn.Length -ne 3) {
if ($Your_a.Item("$($4thDot.Substring(1))"-1) -eq "[X]") {$Script:IamSmart = "True"};if ($Your_a.Item("$($4thDot.Substring(1))"-2) -eq "[X]") {$Script:IamSmart = "True"};if ($Your_a.Item("$($4thDot.Substring(1))") -eq "[X]") {$Script:IamSmart = "True"}}
if ($3rdDot[0] -eq "b" -and $ComputerTurn.Length -ne 3) {
if ($Your_b.Item("$($3rdDot.Substring(1))"-1) -eq "[X]") {$Script:IamSmart = "True"};if ($Your_b.Item("$($3rdDot.Substring(1))"-2) -eq "[X]") {$Script:IamSmart = "True"};if ($Your_b.Item("$($3rdDot.Substring(1))") -eq "[X]") {$Script:IamSmart = "True"}}
if ($4thDot[0] -eq "b" -and $ComputerTurn.Length -ne 3) {
if ($Your_b.Item("$($4thDot.Substring(1))"-1) -eq "[X]") {$Script:IamSmart = "True"};if ($Your_b.Item("$($4thDot.Substring(1))"-2) -eq "[X]") {$Script:IamSmart = "True"};if ($Your_b.Item("$($4thDot.Substring(1))") -eq "[X]") {$Script:IamSmart = "True"}}
if ($3rdDot[0] -eq "c" -and $ComputerTurn.Length -ne 3) {
if ($Your_c.Item("$($3rdDot.Substring(1))"-1) -eq "[X]") {$Script:IamSmart = "True"};if ($Your_c.Item("$($3rdDot.Substring(1))"-2) -eq "[X]") {$Script:IamSmart = "True"};if ($Your_c.Item("$($3rdDot.Substring(1))") -eq "[X]") {$Script:IamSmart = "True"}}
if ($4thDot[0] -eq "c" -and $ComputerTurn.Length -ne 3) {
if ($Your_c.Item("$($4thDot.Substring(1))"-1) -eq "[X]") {$Script:IamSmart = "True"};if ($Your_c.Item("$($4thDot.Substring(1))"-2) -eq "[X]") {$Script:IamSmart = "True"};if ($Your_c.Item("$($4thDot.Substring(1))") -eq "[X]") {$Script:IamSmart = "True"}}
if ($3rdDot[0] -eq "d" -and $ComputerTurn.Length -ne 3) {
if ($Your_d.Item("$($3rdDot.Substring(1))"-1) -eq "[X]") {$Script:IamSmart = "True"};if ($Your_d.Item("$($3rdDot.Substring(1))"-2) -eq "[X]") {$Script:IamSmart = "True"};if ($Your_d.Item("$($3rdDot.Substring(1))") -eq "[X]") {$Script:IamSmart = "True"}}
if ($4thDot[0] -eq "d" -and $ComputerTurn.Length -ne 3) {
if ($Your_d.Item("$($4thDot.Substring(1))"-1) -eq "[X]") {$Script:IamSmart = "True"};if ($Your_d.Item("$($4thDot.Substring(1))"-2) -eq "[X]") {$Script:IamSmart = "True"};if ($Your_d.Item("$($4thDot.Substring(1))") -eq "[X]") {$Script:IamSmart = "True"}}
if ($3rdDot[0] -eq "e" -and $ComputerTurn.Length -ne 3) {
if ($Your_e.Item("$($3rdDot.Substring(1))"-1) -eq "[X]") {$Script:IamSmart = "True"};if ($Your_e.Item("$($3rdDot.Substring(1))"-2) -eq "[X]") {$Script:IamSmart = "True"};if ($Your_e.Item("$($3rdDot.Substring(1))") -eq "[X]") {$Script:IamSmart = "True"}}
if ($4thDot[0] -eq "e" -and $ComputerTurn.Length -ne 3) {
if ($Your_e.Item("$($4thDot.Substring(1))"-1) -eq "[X]") {$Script:IamSmart = "True"};if ($Your_e.Item("$($4thDot.Substring(1))"-2) -eq "[X]") {$Script:IamSmart = "True"};if ($Your_e.Item("$($4thDot.Substring(1))") -eq "[X]") {$Script:IamSmart = "True"}}
if ($3rdDot[0] -eq "f" -and $ComputerTurn.Length -ne 3) {
if ($Your_f.Item("$($3rdDot.Substring(1))"-1) -eq "[X]") {$Script:IamSmart = "True"};if ($Your_f.Item("$($3rdDot.Substring(1))"-2) -eq "[X]") {$Script:IamSmart = "True"};if ($Your_f.Item("$($3rdDot.Substring(1))") -eq "[X]") {$Script:IamSmart = "True"}}
if ($4thDot[0] -eq "f" -and $ComputerTurn.Length -ne 3) {
if ($Your_f.Item("$($4thDot.Substring(1))"-1) -eq "[X]") {$Script:IamSmart = "True"};if ($Your_f.Item("$($4thDot.Substring(1))"-2) -eq "[X]") {$Script:IamSmart = "True"};if ($Your_f.Item("$($4thDot.Substring(1))") -eq "[X]") {$Script:IamSmart = "True"}}
if ($3rdDot[0] -eq "g" -and $ComputerTurn.Length -ne 3) {
if ($Your_g.Item("$($3rdDot.Substring(1))"-1) -eq "[X]") {$Script:IamSmart = "True"};if ($Your_g.Item("$($3rdDot.Substring(1))"-2) -eq "[X]") {$Script:IamSmart = "True"};if ($Your_g.Item("$($3rdDot.Substring(1))") -eq "[X]") {$Script:IamSmart = "True"}}
if ($4thDot[0] -eq "g" -and $ComputerTurn.Length -ne 3) {
if ($Your_g.Item("$($4thDot.Substring(1))"-1) -eq "[X]") {$Script:IamSmart = "True"};if ($Your_g.Item("$($4thDot.Substring(1))"-2) -eq "[X]") {$Script:IamSmart = "True"};if ($Your_g.Item("$($4thDot.Substring(1))") -eq "[X]") {$Script:IamSmart = "True"}}
if ($3rdDot[0] -eq "h" -and $ComputerTurn.Length -ne 3) {
if ($Your_h.Item("$($3rdDot.Substring(1))"-1) -eq "[X]") {$Script:IamSmart = "True"};if ($Your_h.Item("$($3rdDot.Substring(1))"-2) -eq "[X]") {$Script:IamSmart = "True"};if ($Your_h.Item("$($3rdDot.Substring(1))") -eq "[X]") {$Script:IamSmart = "True"}}
if ($4thDot[0] -eq "h" -and $ComputerTurn.Length -ne 3) {
if ($Your_h.Item("$($4thDot.Substring(1))"-1) -eq "[X]") {$Script:IamSmart = "True"};if ($Your_h.Item("$($4thDot.Substring(1))"-2) -eq "[X]") {$Script:IamSmart = "True"};if ($Your_h.Item("$($4thDot.Substring(1))") -eq "[X]") {$Script:IamSmart = "True"}}
if ($3rdDot[0] -eq "i" -and $ComputerTurn.Length -ne 3) {
if ($Your_i.Item("$($3rdDot.Substring(1))"-1) -eq "[X]") {$Script:IamSmart = "True"};if ($Your_i.Item("$($3rdDot.Substring(1))"-2) -eq "[X]") {$Script:IamSmart = "True"};if ($Your_i.Item("$($3rdDot.Substring(1))") -eq "[X]") {$Script:IamSmart = "True"}}
if ($4thDot[0] -eq "i" -and $ComputerTurn.Length -ne 3) {
if ($Your_i.Item("$($4thDot.Substring(1))"-1) -eq "[X]") {$Script:IamSmart = "True"};if ($Your_i.Item("$($4thDot.Substring(1))"-2) -eq "[X]") {$Script:IamSmart = "True"};if ($Your_i.Item("$($4thDot.Substring(1))") -eq "[X]") {$Script:IamSmart = "True"}}
if ($3rdDot[0] -eq "j" -and $ComputerTurn.Length -ne 3) {
if ($Your_j.Item("$($3rdDot.Substring(1))"-1) -eq "[X]") {$Script:IamSmart = "True"};if ($Your_j.Item("$($3rdDot.Substring(1))"-2) -eq "[X]") {$Script:IamSmart = "True"};if ($Your_j.Item("$($3rdDot.Substring(1))") -eq "[X]") {$Script:IamSmart = "True"}}
if ($4thDot[0] -eq "j" -and $ComputerTurn.Length -ne 3) {
if ($Your_j.Item("$($4thDot.Substring(1))"-1) -eq "[X]") {$Script:IamSmart = "True"};if ($Your_j.Item("$($4thDot.Substring(1))"-2) -eq "[X]") {$Script:IamSmart = "True"};if ($Your_j.Item("$($4thDot.Substring(1))") -eq "[X]") {$Script:IamSmart = "True"}}

if ($ComputerTurn.Length -eq 3 -and ($3rdDot -or $4thDot) -and $ComputerTurn[0] -eq "a") {
if ($Your_b.Item(8) -eq "[X]") {$Script:IamSmart = "True"}
if ($Your_b.Item(9) -eq "[X]") {$Script:IamSmart = "True"}
}
if ($ComputerTurn.Length -eq 3 -and ($3rdDot -or $4thDot) -and $ComputerTurn[0] -eq "b") {
if ($Your_a.Item(8) -eq "[X]") {$Script:IamSmart = "True"}
if ($Your_c.Item(8) -eq "[X]") {$Script:IamSmart = "True"}
if ($Your_a.Item(9) -eq "[X]") {$Script:IamSmart = "True"}
if ($Your_c.Item(9) -eq "[X]") {$Script:IamSmart = "True"}
}
if ($ComputerTurn.Length -eq 3 -and ($3rdDot -or $4thDot) -and $ComputerTurn[0] -eq "c") {
if ($Your_b.Item(8) -eq "[X]") {$Script:IamSmart = "True"}
if ($Your_d.Item(8) -eq "[X]") {$Script:IamSmart = "True"}
if ($Your_b.Item(9) -eq "[X]") {$Script:IamSmart = "True"}
if ($Your_d.Item(9) -eq "[X]") {$Script:IamSmart = "True"}
}
if ($ComputerTurn.Length -eq 3 -and ($3rdDot -or $4thDot) -and $ComputerTurn[0] -eq "d") {
if ($Your_c.Item(8) -eq "[X]") {$Script:IamSmart = "True"}
if ($Your_e.Item(8) -eq "[X]") {$Script:IamSmart = "True"}
if ($Your_c.Item(9) -eq "[X]") {$Script:IamSmart = "True"}
if ($Your_e.Item(9) -eq "[X]") {$Script:IamSmart = "True"}
}
if ($ComputerTurn.Length -eq 3 -and ($3rdDot -or $4thDot) -and $ComputerTurn[0] -eq "e") {
if ($Your_d.Item(8) -eq "[X]") {$Script:IamSmart = "True"}
if ($Your_f.Item(8) -eq "[X]") {$Script:IamSmart = "True"}
if ($Your_d.Item(9) -eq "[X]") {$Script:IamSmart = "True"}
if ($Your_f.Item(9) -eq "[X]") {$Script:IamSmart = "True"}
}
if ($ComputerTurn.Length -eq 3 -and ($3rdDot -or $4thDot) -and $ComputerTurn[0] -eq "f") {
if ($Your_e.Item(8) -eq "[X]") {$Script:IamSmart = "True"}
if ($Your_g.Item(8) -eq "[X]") {$Script:IamSmart = "True"}
if ($Your_e.Item(9) -eq "[X]") {$Script:IamSmart = "True"}
if ($Your_g.Item(9) -eq "[X]") {$Script:IamSmart = "True"}
}
if ($ComputerTurn.Length -eq 3 -and ($3rdDot -or $4thDot) -and $ComputerTurn[0] -eq "g") {
if ($Your_f.Item(8) -eq "[X]") {$Script:IamSmart = "True"}
if ($Your_h.Item(8) -eq "[X]") {$Script:IamSmart = "True"}
if ($Your_f.Item(9) -eq "[X]") {$Script:IamSmart = "True"}
if ($Your_h.Item(9) -eq "[X]") {$Script:IamSmart = "True"}
}
if ($ComputerTurn.Length -eq 3 -and ($3rdDot -or $4thDot) -and $ComputerTurn[0] -eq "h") {
if ($Your_g.Item(8) -eq "[X]") {$Script:IamSmart = "True"}
if ($Your_i.Item(8) -eq "[X]") {$Script:IamSmart = "True"}
if ($Your_g.Item(9) -eq "[X]") {$Script:IamSmart = "True"}
if ($Your_i.Item(9) -eq "[X]") {$Script:IamSmart = "True"}
}
if ($ComputerTurn.Length -eq 3 -and ($3rdDot -or $4thDot) -and $ComputerTurn[0] -eq "i") {
if ($Your_h.Item(8) -eq "[X]") {$Script:IamSmart = "True"}
if ($Your_j.Item(8) -eq "[X]") {$Script:IamSmart = "True"}
if ($Your_h.Item(9) -eq "[X]") {$Script:IamSmart = "True"}
if ($Your_j.Item(9) -eq "[X]") {$Script:IamSmart = "True"}
}
if ($ComputerTurn.Length -eq 3 -and ($3rdDot -or $4thDot) -and $ComputerTurn[0] -eq "j") {
if ($Your_i.Item(8) -eq "[X]") {$Script:IamSmart = "True"}
if ($Your_i.Item(9) -eq "[X]") {$Script:IamSmart = "True"}
}
}

# Simple function to show score.
function ShowScore {
Write-Host "`nScore: You [$Script:MyScore] - Computer [$Script:ComputerScore]"
}

# Main function to start the game.
function StartGame {
# Variable below is used to check if my move is unique.
$AllMyTurns = @()
$MyTurnsCount = 0
$ComputerTurnsCount = 1
$Script:MyScore = 0
$Script:ComputerScore = 0
do {
if ($MyTurnsCount -lt $ComputerTurnsCount) {
$MyTurn = Read-Host "`nYour turn"
# Conditional statement below checks if my move is met the rules (unique, not repeatable, matches the table).
if ( ( ($MyTurn -match "[abcdefghij][123456789]" -and $MyTurn.Length -eq 2 ) -or ($MyTurn -match "[abcdefghij]10" -and $MyTurn.Length -eq 3) ) -and !($AllMyTurns | where {$_ -eq $MyTurn}) ) {
$AllTurns += "ME:"+$MyTurn+" "
$AllMyTurns += $MyTurn
MyMove
$MyTurnsCount++
}
}
if ($ComputerTurnsCount -eq $MyTurnsCount) {
$ComputerTurn = $Script:ComputerMoves | select -First 1
$AllTurns += "PC:"+$ComputerTurn+" "
$Script:ComputerMoves = $Script:ComputerMoves | where {$_ -ne $ComputerTurn}
ComputerMove
# Statement below checks MakeComputerSmart function.
if ($Script:IamSmart -eq "True") {ComputerMove}
else {$ComputerTurnsCount++}
}
ShowYourTable
ShowComputerTable
# Enabling cheat mode.
if ($EnableCheats) {ShowHiddenComputerTable}
ShowLegend
ShowScore
Write-Host "`nAll turns: $AllTurns "
} until (($Script:MyScore -eq 5) -or ($Script:ComputerScore -eq 5))
if ($Script:MyScore -eq 5) {Write-Host "`nYou won! :)`n"}
if ($Script:ComputerScore -eq 5) {Write-Host "`nComputer won! :(`n"}
}

# Actual start of the game.
# Shows empty tables and legend
ShowYourTable
ShowComputerTable
ShowLegend
# Creates ships
CreateShips
GenerateComputerShips
GenerateComputerMoves
# Starts the game
if ($EnableCheats) {ShowHiddenComputerTable}
StartGame
