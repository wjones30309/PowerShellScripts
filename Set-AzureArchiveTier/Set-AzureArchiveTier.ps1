Login-AzureRmAccount
$StorageAccount = "Your SA Name"
$StorageAccountKey = "SA Key"
$ContainerName ="Container Name"
$Context = New-AzureStorageContext -StorageAccountName $StorageAccount -StorageAccountKey $StorageAccountKey
$Blobs = Get-AzureStorageBlob -Container $ContainerName -Context $Context
Foreach ($Blob in $Blobs | where {$_.LastModified -lt (Get-Date).AddMonths(-1)})
{$Blob.ICloudBlob.SetStandardBlobTier("Archive")}