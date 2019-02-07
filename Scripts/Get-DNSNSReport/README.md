# DNS Name Servers report

This script generates a DNS Name Servers report for specific domains.

## Usage

Create a txt or csv file with domains you want to check (domains.txt). For example:

```txt
microsoft.com
technet.com
```

Then run the script in the same folder or amend $Domains variable in the script:

```PowerShell
.\Get-DNSNSReport.ps1

Name          NameServer
----          ----------
microsoft.com ns1.msft.net
microsoft.com ns2.msft.net
microsoft.com ns3.msft.net
microsoft.com ns4.msft.net
technet.com   ns1.msft.net
technet.com   ns2.msft.net
technet.com   ns3.msft.net
technet.com   ns4.msft.net
```

Also you can change "-Server 8.8.8.8" parameter to specify own DNS server to query against.

## Script Syntax

```PowerShell
$Domains = Import-Csv .\domains.txt -Header Domain

foreach ($Domain in $Domains) 
{
$Resolve = @()
$Resolve = Resolve-DnsName -Name $Domain.Domain -Type NS -Server 8.8.8.8 -ErrorAction SilentlyContinue | where {$_.Section -eq "Answer"}
if (!$Resolve) 
    {
$Properties = [ordered]@{Name = $Domain.Domain; NameServer = "Can't check the DNS name"}
New-Object -TypeName PSObject -Property $Properties
    }
else 
    {
foreach ($Item in $Resolve)
        {  
$Properties = [ordered]@{Name = $Domain.Domain; NameServer = $Item.NameHost}
New-Object -TypeName PSObject -Property $Properties
        }
    }
}
```