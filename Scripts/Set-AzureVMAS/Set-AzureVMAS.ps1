$VMName = "NAME_OF_VM"
$ResourceGroup = "VM_RESOURCE_GROUP"
$AvailabilitySet = "DESTINATION_AVAILABILITY_SET"
$PreChangeVMFile = "Set-AzureVMAS.txt"
$OldVM = Get-AzureRmVM -Name $VMName -ResourceGroupName $ResourceGroup
$PreChange += "VM name: $($OldVM.Name)"
$PreChange += "`r`nExtensions: $($OldVM.Extensions)"
$PreChange += "`r`nVMSize: $($OldVM.HardwareProfile.VmSize)"
$PreChange += "`r`nNIC: $($OldVM.NetworkProfile.NetworkInterfaces[0].Id)"
$PreChange += "`r`nOS: $($OldVM.StorageProfile.OsDisk.OsType)"
$PreChange += "`r`nDisk: $($OldVM.StorageProfile.OsDisk.Name)"
$PreChange | Out-File $PreChangeVMFile
$OSDisk = Get-AzureRmDisk | Where-Object {$_.name -eq $OldVM.StorageProfile.OsDisk.Name}
Remove-AzureRmVM -ResourceGroupName $ResourceGroup -Name $VMName
$AS = Get-AzureRmAvailabilitySet -ResourceGroupName $ResourceGroup -Name $AvailabilitySet
$NewVM = New-AzureRmVMConfig -VMName $OldVM.Name -VMSize $OldVM.HardwareProfile.VmSize -AvailabilitySetId $AS.Id
Set-AzureRmVMOSDisk -VM $NewVM -ManagedDiskId $OSDisk.Id -Name $OSDisk.Name -CreateOption Attach -Windows
foreach ($Net in $OldVM.NetworkProfile.NetworkInterfaces) {Add-AzureRmVMNetworkInterface -VM $NewVM -Id $Net.Id}
New-AzureRmVM -ResourceGroupName $ResourceGroup -Location $OldVM.Location -VM $NewVM -DisableBginfoExtension