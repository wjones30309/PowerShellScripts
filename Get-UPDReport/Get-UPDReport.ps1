[CmdletBinding()]
Param(
 [Parameter(Mandatory=$True)]
 [ValidateNotNull()]
 [String]$UPDPath
 )
 
$3f = @()
$1f = Get-ChildItem $UPDPath -Recurse | where {!$_.PSIsContainer} | Select-Object FullName,LastWriteTime,@{Name="Size";Expression={$_.Length / 1MB}} | sort LastWriteTime -Descending

foreach ($2f in $1f) {
$SID = $2f.FullName -replace('.*UVHD-','') -replace('.vhdx','')
$p1 = @{"FullName"=$2f.FullName;
"LastWriteTime"=$2f.LastWriteTime;
"Size"=$2f.Size;
"SID"=$SID}

$3f += New-Object -TypeName PSObject -Property $p1
}

foreach ($4f in $3f) {
$a = @()
$e = @()
$ErrorActionPreference = 'SilentlyContinue'
$a = Get-ADUser $4f.SID -Properties Name,UserPrincipalName,Enabled,LastLogonDate -ErrorVariable e

if ($e) {
$p2 = @{"FullName"=$4f.FullName;
"LastWriteTime"=$4f.LastWriteTime;
"Size"=$4f.Size;
"SID"="No AD Account for this UPD";
"AD_Account_Name"="No AD Account for this UPD";
"AD_Account_UPN"="No AD Account for this UPD";
"AD_User_Enabled"="No AD Account for this UPD";
"AD_User_LastLogon"="No AD Account for this UPD"}
}
else {
$p2 = @{"FullName"=$4f.FullName;
"LastWriteTime"=$4f.LastWriteTime;
"Size"=$4f.Size;
"SID"=$4f.SID;
"AD_Account_Name"=$a.Name;
"AD_Account_UPN"=$a.UserPrincipalName;
"AD_User_Enabled"=$a.Enabled;
"AD_User_LastLogon"=$a.LastLogonDate}
}

$Obj = New-Object -TypeName PSObject -Property $p2
Write-Output $Obj | select FullName,LastWriteTime,Size,SID,AD_Account_Name,AD_Account_UPN,AD_User_Enabled,AD_User_LastLogon
}
