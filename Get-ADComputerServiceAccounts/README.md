# Active Directory service accounts report

It searches Active Directory domain joined computers and servers, gets information about services and provides a report about service accounts. It shows services that are run by any active directory account or by any local account.

The report includes System Name, Name of Service, service account that runs the service, StartMode and actual service State.

At the end of script you will see Script Summary. Script results can be exported to CSV file by **-File** parameter.

## Examples

Check all AD servers

```powershell
.\Get-ADComputerServiceAccounts.ps1
```

Export results to CSV file

```powershell
.\Get-ADComputerServiceAccounts.ps1 -File Report.csv
```

Check specific OU

```powershell
.\Get-ADComputerServiceAccounts.ps1 -OU "OU=MyOUname,DC=contoso,DC=com"
```

Check specific OU and export data to Report.csv

```powershell
.\Get-ADComputerServiceAccounts.ps1 -OU "OU=MyOUname,DC=contoso,DC=com" -File Report.csv
```

Get service accounts for one server/workstation and export results to CSV file

```powershell
.\Get-ADServiceAccounts.ps1 -ComputerName Server1 -File Report.csv
```
