[cmdletbinding()]
Param (
[Parameter(Mandatory=$False)]
[switch]$IncludeSystemGroups,

[Parameter(Mandatory=$False)]
[switch]$SingleDomain
)

if ($IncludeSystemGroups) {$adgroups =  Get-ADGroup -Filter *}
else  {$adgroups =  Get-ADGroup -Filter * -Properties isCriticalSystemObject | Where-Object { !($_.IsCriticalSystemObject)}}

foreach ($adgroup in $adgroups) 
{
$adgroupmemberusers = @(); $adgroupmembergroups = @(); $membergroupscope = @(); $Message = @()
$adgroupmemberusers = Get-ADGroupMember $adgroup | Where-Object {$_.objectClass -eq "user"}
$adgroupmembergroups = Get-ADGroupMember $adgroup | Where-Object {$_.objectClass -eq "group"}
$adgroupmemberuserscount = ($adgroupmemberusers | measure).Count
$adgroupmembergroupscount = ($adgroupmembergroups | measure).Count

if ($adgroupmembergroupscount) 
{
foreach ($group in $adgroupmembergroups) 
    {
    $membergroupscope += (Get-ADGroup $group.name).GroupScope
    }
$membergroupscope = $membergroupscope | Group-Object
}

if (!$adgroupmemberuserscount -and !$adgroupmembergroupscount) {$Message = "Warning. Empty group. Please check"}
if ($adgroup.GroupScope -eq "Global" -and $adgroupmemberuserscount -or $adgroupmembergroupscount) {$Message = "All good"}
if (($adgroup.GroupScope -eq "DomainLocal" -or $adgroup.GroupScope -eq "Universal") -and $adgroupmemberuserscount) {$Message = "Warning. Users in DL/U group"}
if (!$SingleDomain -and $adgroup.GroupScope -eq "DomainLocal" -and ($membergroupscope | where {$_.Name -eq "Global"}) ) {$Message = "Warning. DL contains Global group"}

$Properties = [ordered]@{
"Group Name" = $adgroup.Name
"Group Scope" = $adgroup.GroupScope
"Member Users" = $adgroupmemberuserscount
"Member Groups" = $adgroupmembergroupscount
Mesage = $Message
    }
$Object = New-Object -TypeName PSObject -Property $Properties
$Object
}