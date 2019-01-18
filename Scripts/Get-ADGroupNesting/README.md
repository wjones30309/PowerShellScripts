# Check Active Directory groups nesting using PowerShell

## Best practice

Active Directory best practice group nesting strategy (AGUDLP):

Accounts -> Global -> Universal -> Domain Local -> Permissions

It means that accounts should be placed into Global groups, Global into Universal, Universal to Domain Local. Then Domain Local groups are assigned to resources.

Universal groups are used in multi-domain Active Directory forest environment. In single domain scenario it can be AGDLP strategy.

## Script overview

The script checks all Active Directory groups and their members.  It shows a warning message if it find an empty group.  
It checks that Domain Local and Universal groups have no user accounts per best practice.  
It checks Domain Local groups. It throws a warning message if it contains any Global group. There is "-SingleDomain" parameter, which skips AGUDLP and uses AGDLP check instead.

## Warning Examples

"Warning. Empty group. Please check" - Group doesn't contain any members.  
"Warning. Users in DL/U group" - This message appears when Domain Local or Universal group contains users.  
"Warning. DL contains Global group" - It shows that Domain Local group contains Global group. Can be skipped by "-SingleDomain" parameter.

## Examples

Check all AD groups but systems:

```PowerShell
 .\Get-ADGroupNesting.ps1
```

Include system groups (Domain Admins, Domain Users etc.):

```PowerShell
 .\Get-ADGroupNesting.ps1 -IncludeSystemGroups
```

Include system groups and ignore AGUDLP and use AGDLP instead:

```PowerShell
 .\Get-ADGroupNesting.ps1 -IncludeSystemGroups -SingleDomain
```

You can format an output as you desire. Below is example of format table:

```PowerShell
 .\Get-ADGroupNesting.ps1 | ft
```

Or export the result to csv file:

```PowerShell
 .\Get-ADGroupNesting.ps1 | Export-Csv filename.csv
```

## Output Example

```text
PS C:\> .\Get-ADGroupNesting.ps1 | ft -AutoSize

Group Name                                   Group Scope Member Users Member Groups Mesage
----------                                   ----------- ------------ ------------- ------
<Some output is omitted>
testgroup1                                   DomainLocal            0             1 All good
testgroup2                                        Global            0             0 Warning. Empty group. Please check
testgroup3                                     Universal            1             0 Warning. Users in DL/U group

```

## Script syntax

```PowerShell
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
```