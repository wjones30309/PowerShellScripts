$Users = Get-MsolUser | where {$_.LastDirSyncTime -and $_.UserPrincipalName -notlike "Sync_*"} | select UserPrincipalName,ImmutableID,BlockCredential,LastPasswordChangeTimestamp,LastDirSyncTime
foreach ($User in $Users) 
{
$ADUser = @()
$ADUser = Get-AdUser ([GUID]([system.convert]::frombase64string($User.ImmutableID))) -Properties PasswordLastSet
if ($ADUser) 
    {
    $Properties = @{
        "MSOL_User"=$User.UserPrincipalName
        "MSOL_LastPasswordChangeTimestamp"=$User.LastPasswordChangeTimestamp
        "MSOL_BlockCredential"=$User.BlockCredential
        "MSOL_LastDirSyncTime"=$User.LastDirSyncTime
        "AD_User"=$ADUser.UserPrincipalName
        "AD_User_Enabled"=$ADUser.Enabled
        "AD_PasswordLastSet"=$ADUser.PasswordLastSet}
    $Obj = New-Object -TypeName PSObject -Property $Properties
    Write-Output $Obj | select MSOL_User,MSOL_LastPasswordChangeTimestamp,MSOL_BlockCredential,MSOL_LastDirSyncTime,AD_User,AD_User_Enabled,AD_PasswordLastSet
    }
else 
    {
    $Properties = @{
        "MSOL_User"=$User.UserPrincipalName
        "MSOL_LastPasswordChangeTimestamp"=$User.LastPasswordChangeTimestamp
        "MSOL_BlockCredential"=$User.BlockCredential
        "MSOL_LastDirSyncTime"=$User.LastDirSyncTime
        "AD_User"="No AD Account"
        "AD_User_Enabled"="No AD Account"
        "AD_PasswordLastSet"="No AD Account"}
    
    $Obj = New-Object -TypeName PSObject -Property $Properties
    Write-Output $Obj | select MSOL_User,MSOL_LastPasswordChangeTimestamp,MSOL_BlockCredential,MSOL_LastDirSyncTime,AD_User,AD_User_Enabled,AD_PasswordLastSet
    }
}