### RDS User Profile Disks (UPDs) report including account information from Active Directory.

The report contains the following attributes: <br />
**FullName** - full path to UPD file. <br />
**LastWriteTime** - time when UPD was last modified. <br />
**Size** - file size in MB. <br />
**SID** - Active Directory account security identifier. <br />
**AD_Account_Name** - Active Directory account name. <br />
**AD_Account_UPN** - Active Directory account user principal name. <br />
**AD_User_Enabled** - information if account is enabled or disabled. <br />
**AD_User_LastLogon** - Active Directory account last logon time. <br />

### Examples
Gets report where UPD files location is “\\Share\UPDs\”.
```powershell
.\Get-UPDReport.ps1 -UPDPath "\\Share\UPDs\"
```
The same as above but an output will be saved in Report.csv file.
```powershell
.\Get-UPDReport.ps1 -UPDPath "\\Share\UPDs\" | Export-Csv Report.csv
```
### Requirements
Access to UPD path and Active Directory PowerShell module.
