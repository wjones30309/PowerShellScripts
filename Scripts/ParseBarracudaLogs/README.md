# How to parse Barracuda logs using PowerShell

Simple way to get inbound and outbound message count for domains in Barracuda Spam Firewall.

## Requirements

Exported Messages Log from Virtual appliance in a `logs.csv` file.  
List of domains to parse in the following format saved in a `domains.csv` file:

```text
Domain
example.com
example2.com
example3.com
```

## Script output example

```text
Domain                    Messages
------                    --------
example.com                    121
example2.com                    70
example3.com                     0
```

## Script syntax

```powershell
$logs = Import-Csv .\logs.csv
$domains = Import-Csv .\domains.txt

foreach ($domain in $domains)
{
$Messages = @()
$Messages = $logs | where {$_.From -like "*$($domain.Domain)*" -or $_.To -like "*$($domain.Domain)*"} | measure

if ($Messages)
    {
    $Properties = @{
        "Domain"=$domain.Domain
        "Messages"=$Messages.Count}
    $Obj = New-Object -TypeName PSObject -Property $Properties
    Write-Output $Obj | select Domain, Messages
    }
}
```