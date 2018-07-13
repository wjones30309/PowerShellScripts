# Microsoft Azure - Find empty Resource Groups

How to identify empty Resource Groups in Microsoft Azure using PowerShell?

```powershell
Login-AzureRmAccount
$AllRGs = (Get-AzureRmResourceGroup).ResourceGroupName
$RGsWithResources = (Get-AzureRMResource | Group-Object ResourceGroupName).Name
$AllRGs | Where-Object {$_ -notin $RGsWithResources}
```