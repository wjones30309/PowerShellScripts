[CmdletBinding()] 
Param(
[Parameter(Mandatory=$False)]
[ValidateNotNull()]
[String]$Identity,

[Parameter(Mandatory=$False)]
[ValidateNotNull()]
[String]$OU
)

$currentlocation = Get-Location
Set-Location ad:

$Users = Get-ADUser -SearchBase $OU -Filter *

foreach ($User in $Users) {

$Acls = (Get-Acl $User.DistinguishedName).Access | where {$_.IdentityReference -like $Identity -and $_.ActiveDirectoryRights -eq "ExtendedRight" -and $_.IdentityReference -notlike "NT AUTHORITY\SELF"}

foreach ($Acl in $Acls) {

if ($Acl.ObjectType) {

$Properties = @{
"User"=$User.Name
"Identity"=$Acl.IdentityReference
"Type"=$Acl.AccessControlType
"Rights"= (Get-ADObject -SearchBase (Get-ADRootDSE).ConfigurationNamingContext -Filter {(objectclass -eq "controlAccessRight") -and (rightsguid -eq $Acl.ObjectType)} -Properties RightsGuid,DisplayName).DisplayName
}
$Obj = New-Object -TypeName PSObject -Property $Properties
Write-Output $Obj 
}
}

if (!$Acls) {
$Properties = @{
"User"=$User.Name
"Identity"= "No Data"
"Type"= "No Data"
"Rights"= "No Data"
}
$Obj = New-Object -TypeName PSObject -Property $Properties
Write-Output $Obj 
}

}

Set-Location $currentlocation