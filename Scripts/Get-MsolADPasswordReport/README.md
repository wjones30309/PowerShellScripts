# Azure AD Connect password synchronization report

This PowerShell script connects to Azure Active directory, gets information about accounts. It converts account `ImmutableID` property to `GUID` and gathers the information about on premise AD account.

## Requirements

MSOnline and ActiveDirectory PowerShell modules.  
Permissions to retrieve data from AD and Azure.

## Output

The script returns the following information:

`MSOL_User` - Azure account UPN  
`MSOL_LastPasswordChangeTimestamp` - last password change timestamp  
`MSOL_LastDirSyncTime` - last sync time  
`AD_User` - on premise AD user UPN  
`AD_User_Enabled` - true/false account status  
`AD_PasswordLastSet` - when AD password was last set

## Output example

```text
MSOL_User                        : user1@example.com
MSOL_LastPasswordChangeTimestamp : 24/04/2018 07:16:04
MSOL_BlockCredential             : False
MSOL_LastDirSyncTime             : 26/09/2018 07:30:41
AD_User                          : user1@example.com
AD_User_Enabled                  : True
AD_PasswordLastSet               : 24/04/2018 08:16:04
```

## Usage example

Run the script and export the results to csv file.

```powershell
.\Get-MsolADPasswordReport.ps1 | Export-Csv -NoTypeInformation Report.csv
```