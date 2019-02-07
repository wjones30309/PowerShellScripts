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