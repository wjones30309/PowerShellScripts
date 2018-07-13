Login-AzureRmAccount
$AllRGs = (Get-AzureRmResourceGroup).ResourceGroupName
$RGsWithResources = (Get-AzureRMResource | Group-Object ResourceGroupName).Name
$AllRGs | Where-Object {$_ -notin $RGsWithResources}