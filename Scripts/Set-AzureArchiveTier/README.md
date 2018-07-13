# Microsoft Azure - Set Archive blob tier

Simple PowerShell script to set Archive Access Tier for all Blobs older than 1 month in a specific storage account. Fill in variables and run the script

## Requirements

You need to specify Storage Account, Key and Container names.

## Example

```powershell
.\Set-AzureArchiveTier.ps1
```

## Note

Run **$Blobs.ICloudBlob.SetStandardBlobTier("Archive")** instead **Foreach** loop to set all blobs.