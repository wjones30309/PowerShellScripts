# DNS MX Report using PowerShell

## Requirements

Fill in `domains.txt` file like below:

```text
Domain
microsoft.com
linux.com
example.com
```

## Output example

```text
Domain        MX                                        Preference
------        --                                        ----------
microsoft.com microsoft-com.mail.protection.outlook.com         10
linux.com     smtp1.linuxfoundation.org                         10
linux.com     smtp2.linuxfoundation.org                         10
example.com   No MX data                                No MX data
```

## Script syntax

```powershell
$domains = Import-Csv .\domains.txt | Select-Object -ExpandProperty Domain

foreach ($domain in $domains)
{
$resolve = @()
$resolve = Resolve-DnsName $domain -Type MX | Where-Object {$_.QueryType -eq "MX"}

    if ($resolve)
    {
        foreach ($name in $resolve)
        {
        $Properties = @{
        "Domain"=$domain
        "MX"=$name.NameExchange
        "Preference"=$name.Preference}
        $Obj = New-Object -TypeName PSObject -Property $Properties
        Write-Output $Obj | Select-Object Domain, MX, Preference
        }
    }
    else
    {
    $Properties = @{
    "Domain"=$domain
    "MX"="No MX data"
    "Preference"="No MX data"}
    $Obj = New-Object -TypeName PSObject -Property $Properties
    Write-Output $Obj | Select-Object Domain, MX, Preference
    }
}
```