 [CmdletBinding()]
Param(
 [Parameter(Mandatory=$True)]
 [ValidateSet('2010','2013-2016','O365')]
 [String]$Version,

 [Parameter(Mandatory=$False)]
 [ValidateNotNull()]
 [String]$File
 
 )
 
    if ($Version -like "2010") 
{
$Out = @()
$mbxs = Get-Mailbox
    foreach ($mbx in $mbxs) 
        {
$id = $mbx.alias
$id = $id+":\Calendar"
$perms = Get-MailboxFolderPermission -Identity $id | where {$_.User -notlike "Anonymous" -and $_.User -notlike "Default"}
    foreach ($perm in $perms)
    {
if (!$perm) {break}
$Properties = @{
"Mailbox"= $mbx.DisplayName;
"Email" = $mbx.windowsemailaddress;
"User" = $perm.User;
"AccessRights" = $perm.AccessRights -join ','
                }
$Obj = New-Object -TypeName PSObject -Property $Properties
        
    if (!$File)
    {
    Write-Output $Obj | select Mailbox,Email,User,AccessRights
    }
$Out += $Obj
    }

        }
    if ($File) 
    {
$Out | select Mailbox,Email,User,AccessRights | Export-Csv -NoTypeInformation $File
    }
}


    if ($Version -like "2013-2016") 
    {
        if (!$File)
        {
Get-Mailbox | foreach {Get-MailboxFolderPermission -Identity "$($_.alias):\Calendar" | where {$_.User -notlike "Anonymous" -and $_.User -notlike "Default"}} | select Identity,User,@{name='AccessRights';expression={$_.AccessRights -join ','}}
        }    
        if ($File)
        {
Get-Mailbox | foreach {Get-MailboxFolderPermission -Identity "$($_.alias):\Calendar" | where {$_.User -notlike "Anonymous" -and $_.User -notlike "Default"}} | select Identity,User,@{name='AccessRights';expression={$_.AccessRights -join ','}} | Export-Csv -NoTypeInformation $File
        }
    }

    if ($Version -like "O365")
    {
$UserCredential = Get-Credential
$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $UserCredential -Authentication Basic -AllowRedirection
Import-PSSession $Session

        if (!$File) 
        {
Get-Mailbox | foreach {Get-MailboxFolderPermission -Identity "$($_.alias):\Calendar" | where {$_.User -notlike "Anonymous" -and $_.User -notlike "Default"}} | select Identity,User,@{name='AccessRights';expression={$_.AccessRights -join ','}}
        }
        if ($file)
        {
Get-Mailbox | foreach {Get-MailboxFolderPermission -Identity "$($_.alias):\Calendar" | where {$_.User -notlike "Anonymous" -and $_.User -notlike "Default"}} | select Identity,User,@{name='AccessRights';expression={$_.AccessRights -join ','}} | Export-Csv -NoTypeInformation $File
        }
Remove-PSSession $Session
    }
