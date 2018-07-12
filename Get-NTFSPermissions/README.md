### NTFS Permissions report
Script output includes Path, Identity, Rights and Owner information. Also it has a note if permissions are inherited or not. The script contains some limitations (path over 260 in lengths and some special characters) but in most cases I found it very useful. Especially if you need some quick overview of permissions.

### Examples
Get NTFS permissions report for folder **C:\Test**
```powershell
.\Get-NTFSPermissions.ps1 -path C:\Test
```
Get the same report as above but only 2 folders in depth
```powershell
.\Get-NTFSPermissions.ps1 -path C:\test -Depth 2
```
