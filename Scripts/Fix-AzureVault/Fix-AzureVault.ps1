[CmdletBinding()] 
Param( 
[Parameter(Mandatory=$False)]
[switch]$Report,

[Parameter(Mandatory=$False)]
[switch]$Update,

[Parameter(Mandatory=$False)]
[ValidateNotNull()]
[String]$VMName,

[Parameter(Mandatory=$False)]
[ValidateNotNull()]
[String]$RGName
)

if ($Report) {
$VMs = Get-AzureRmVM
foreach ($VM in $VMs) {
if ($VM.osprofile.secrets.sourcevault.id) {
$Properties = [Ordered]@{
"VMName"=$vm.name;
"RG"=$VM.ResourceGroupName
"KeyVault"=$VM.osprofile.secrets.sourcevault.id
}
$Obj = New-Object -TypeName PSObject -Property $Properties
Write-Output $Obj
}}}

if ($Update -and $VMName -and $RGName) {
$VM = Get-AzureRmVM -Name $VMName -ResourceGroupName $RGName
$VM.OSProfile.Secrets = New-Object -TypeName "System.Collections.Generic.List[Microsoft.Azure.Management.Compute.Models.VaultSecretGroup]"
Update-AzureRmVM -VM $VM -ResourceGroupName $RGName
}