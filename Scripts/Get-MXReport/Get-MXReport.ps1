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