# Network configuration report of Active Directory domain joined servers and workstations

It contains the information about server name (DNSHostName), network interface description (Description), IP Address, MAC Address, default gateway and DNS servers configuration.

The script searches Active Directory computers (it skips disabled objects) and queries network configuration.

At the end of the script you will get Script Summary with success/errors counters.

## Examples

Searches all active directory servers/workstations and gets network information.

```powershell
.\Get-ADComputerNetConfig.ps1
```

Searches all servers and exports data to Report.csv file.

```powershell
.\Get-ADComputerNetConfig.ps1 -File "C:\Folder\Report.csv"
```

Searches all computer objects in specific Active Directory Organizational Unit (including sub-ou's).

```powershell
.\Get-ADComputerNetConfig.ps1 -OU "OU=Servers,DC=contoso,DC=com"
```

Export results to csv file.

```powershell
.\Get-ADComputerNetConfig.ps1 -OU "OU=Servers,DC=contoso,DC=com" -File "C:\Folder\Report.csv"
```

Get network configuration of single server.

```powershell
.\Get-ADComputerNetConfig.ps1 -ComputerName Server1
```

Single server network configuration to CSV file.

```powershell
.\Get-ADComputerNetConfig.ps1 -ComputerName Server1 -File "C:\Folder\Report.csv"
```