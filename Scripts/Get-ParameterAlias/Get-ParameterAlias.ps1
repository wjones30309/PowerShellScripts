[CmdletBinding()]
Param(
[parameter(Mandatory=$False)]
[string[]]$cmdlet,

[Parameter(Mandatory=$False,Position=1)]
[String]$ParameterOrAlias)

function GetOutput
{
$Properties = [Ordered]@{
Command = $Command.Name
Parameter = $Item.Name
Alias = $Item.Aliases}
$Out = New-Object -TypeName PSObject -Property $Properties
Write-Output $Out
}

if ($cmdlet) {$AllCommands = Get-Command $cmdlet}
else {$AllCommands = Get-Command}

foreach ($Command in $AllCommands)
{
if ($ParameterOrAlias)
    {
    $Alias = @()
    $Alias = Get-Help $Command.Name -Parameter * -ErrorAction SilentlyContinue | Where-Object {($_.Aliases -like $ParameterOrAlias -or $_.Name -like $ParameterOrAlias) -and $_.Aliases -notlike "None"}
    if ($Alias) {foreach ($Item in $Alias) {GetOutput}}
    }

else
    {
    $Alias = @()
    $Alias = Get-Help $Command.Name -Parameter * -ErrorAction SilentlyContinue | Where-Object {$_.Aliases -and $_.Aliases -notlike "None"}
    if ($Alias) {foreach ($Item in $Alias) {GetOutput}}
    }
}