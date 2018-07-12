[cmdletbinding()]
Param (
[parameter(Mandatory=$false)]
$howmany
)

while ($guid -ne $howmany -or !($howmany)) {
$guid++
([guid]::NewGuid()).guid
if (!($howmany)) {break}
}
