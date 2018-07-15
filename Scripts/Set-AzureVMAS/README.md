# Microsoft Azure - Add existing VM to Availability Set

Currently it is not possible to add an existing Azure Virtual Machine to Availability Set. VM needs to be re-created because Availability Set settings can be specified only during deployment stage.

Below is a script which automates this process. It is assumed that VM is managed by Resource Manager, OS disk is managed, no data disks are attached and VM has only one nic.

The script gathers current information about Virtual Machine and saves it to txt file (Set-AzureVMAS.txt). It includes such fields as VM Name, Extensions, VM Size and NIC, Operating System and Disk information.

Then script re-creates Virtual Machine and sets needed Availability Set. $VMName, $ResourceGroup and $AvailabilitySet variables in a header of the script need to be specified.

Script also works with VM’s which are already in another AS so can be used to move VM's between Availability Sets.

```powershell
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
```