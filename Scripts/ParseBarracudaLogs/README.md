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
$Messages = $logs | Where-Object {$_.From -like "*$($domain.Domain)*" -or $_.To -like "*$($domain.Domain)*"} | Measure-Object

if ($Messages)
    {
    $Properties = @{
        "Domain"=$domain.Domain
        "Messages"=$Messages.Count}
    $Obj = New-Object -TypeName PSObject -Property $Properties
    Write-Output $Obj | Select-Object Domain, Messages
    }
}
```

If you want to get a list of all active domains and message counts of your VA, you can export inbound (Accepted) Message Log to `logs.csv` file and use the script below:

```powershell
$logs = Import-Csv .\logs.csv
$emails = $logs | Group-Object To | Select-Object Name
$domains = @()

foreach ($email in $emails){$domains+=$email.Name.split("@")[-1]}
$domains = $domains | Sort-Object -Unique | Sort-Object Name

foreach ($domain in $domains)
{
$Messages = @()
$Messages = $logs | Where-Object {$_.To -like "*$($domain)*"} | Measure-Object

if ($Messages)
    {
    $Properties = @{
        "Domain"=$domain
        "Messages"=$Messages.Count}
    $Obj = New-Object -TypeName PSObject -Property $Properties
    Write-Output $Obj | Select-Object Domain, Messages
    }
}
```