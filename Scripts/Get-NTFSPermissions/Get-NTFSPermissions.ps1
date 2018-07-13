[CmdletBinding()]
Param(
[Parameter(Mandatory=$True)]
[ValidateNotNull()]
[String]$path,
[Parameter(Mandatory=$False)]
[ValidateNotNull()]
[String]$Depth
)
if ($Depth) {
$start = 1
$fpath = @()
for ($i=$start; $i -le $Depth; $i++) {
$Levels = "\*" * $i
$fpath += $path+$Levels
}
$fpath = Get-ChildItem $fpath | where {$_.PSIsContainer -like "True"}
foreach ($folder in $fpath) {
$acl = Get-Acl $folder.fullname
foreach($accessRule in $acl.Access)
{
$Rights = $accessRule.FileSystemRights
$Properties = @{"Path"=$folder.fullname;
"Identity"=$accessRule.IdentityReference;
"Rights"=$Rights;
"Owner" = $acl.owner;
"Inherited"=$accessRule.IsInherited}
$Obj = New-Object -TypeName PSObject -Property $Properties
Write-Output $Obj | select Path,Identity,Rights,Owner,Inherited
}}}
else {$spath = Get-ChildItem $path -Recurse | where {$_.PSIsContainer -like "True"}
foreach ($folder in $spath) {
$acl = Get-Acl $folder.fullname
foreach($accessRule in $acl.Access)
{
$Rights = $accessRule.FileSystemRights
$Properties = @{"Path"=$folder.fullname;
"Identity"=$accessRule.IdentityReference;
"Rights"=$Rights;
"Owner" = $acl.owner;
"Inherited"=$accessRule.IsInherited}
$Obj = New-Object -TypeName PSObject -Property $Properties
Write-Output $Obj | select Path,Identity,Rights,Owner,Inherited
}}}
