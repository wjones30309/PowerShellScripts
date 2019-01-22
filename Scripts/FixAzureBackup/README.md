# Fix Azure Backup activation problems using PowerShell

This article contains the additional information about fixing Azure Backup problem, when you try to enable it on Virtual Machine using Azure Portal.

## Error message

The resource operation completed with terminal provisioning state 'Failed'. VM is in Failed Provisioning State.

## Vendor recommendation

Took from official Microsoft documentation, Troubleshoot Azure virtual machine backup:

Restart the VM and make sure the VM is running or shut down.

This error occurs when one of the extension failures puts the VM into failed provisioning state. Go to the extensions list, check if there's a failed extension, remove it, and try restarting the virtual machine. If all extensions are in running state, check if the VM Agent service is running. If not, restart the VM Agent service.

## Additional steps

* Update (clear) a VM status
* Stop VM using Azure Portal, make sure it is deallocated. Then start a VM.

### Clearing a VM status using **Update-AzureRmVM** cmdlet

Usually this step helps and there no need to power a VM down. The below PowerShell commands update/clear the VM status.

Login to your Microsoft Azure account:

```PowerShell
Login-AzureRmAccount
```

Get list of your subscriptions:

```PowerShell
Get-AzureRmSubscription
```

Select a subscription, where the VM resides:

```PowerShell
Get-AzureRmSubscription –SubscriptionID “Subscription_ID” | Select-AzureRmSubscription
```

Update the VM, it will not take any downtime:

```PowerShell
Get-AzureRmVM -Name "Your_VM_Name" -ResourceGroupName “Resource_Group_Name” | Update-AzureRmVM
```