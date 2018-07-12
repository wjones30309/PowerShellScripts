### PowerShell script to get Exchange Calendar permissions report.
The script gets Calendar permissions report within your Exchange organization. It also can get a report from Office 365.

### Parameters
#### -Version [2010 | 2013-2016 | O365] ####
Mandatory parameter. Select between Exchange Versions. It can be 2010, 2013-2016 or O365.
#### -File ####
Optional parameter. Exports the results to file.

### Examples
Gets calendar permissions report for Exchange 2010 and exports the results to FileName.csv file.
```powershell
.\Get-CalendarPermissionsReport.ps1 -Version 2010 -File FileName.csv
```
Gets calendar permissions report for Exchange 2013 or 2016 and exports the results to FileName.csv file.
```powershell
.\Get-CalendarPermissionsReport.ps1 -Version 2013-2016 -File FileName.csv
```
Gets calendar permissions report for Exchange Online and exports the results to FileName.csv file. It will ask an Office 365 admin credentials.
```powershell
 .\Get-CalendarPermissionsReport.ps1 -Version O365 -File FileName.csv
 ```
Connects to Exchange Online and prints calendar permissions to console. 
```powershell
.\Get-CalendarPermissionsReport.ps1 -Version O365
```
