# Microsoft Azure - Cross-subscription move error

The Move resources request contains KeyVault resources which are referenced by one or more VMs in the request. This is not supported currently in Cross subscription Move. Please check the error details for the KeyVault resource Ids.

Known issue after migration from ASM to ARM. The script below will help to identify VM’s with KeyVault and clean up Vault property on VM.

## Example

Get list of VM’s with KeyVault attached. The report will include VMName, RG and KeyVault itself.

```powershell
.\Fix-AzureVault.ps1 -Report
```

Detach KeyVault from VM, where name of VM is TestVM1 and Resource Group name is TestRG1.

```powershell
.\Fix-AzureVault.ps1 -Update -VMName TestVM1 -RGName TestRG1
```