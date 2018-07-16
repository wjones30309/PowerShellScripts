# PowerShell - Storing credentials in a file

## Examples

### Usage example (cmd)

```cmd
whoami
DOMAIN\user
```

```cmd
PowerShell -Command "C:\Script\SecureCredentials.ps1 -Procedure SetCredentials -User Admin -File C:\Script\AdminCredentials.txt"
Enter password: ************
```

```cmd
PowerShell -Command "C:\Script\SecureCredentials.ps1 -Procedure UseCredentials -User Admin -File C:\Script\AdminCredentials.txt; Invoke-Command -Credential $Credentials -ComputerName Localhost -ScriptBlock {whoami}"
DOMAIN\admin
```

### Usage example (PS)

```cmd
whoami
DOMAIN\user
```

```powershell
.\SecureCredentials.ps1 -Procedure SetCredentials -User Admin -File C:\Script\AdminCredentials.txt
Enter password: ************
```

```powershell
.\SecureCredentials.ps1 -Procedure UseCredentials -User Admin -File C:\Script\AdminCredentials.txt
```

```powershell
$Credentials.GetNetworkCredential() | fl UserName,Password

UserName : Admin
Password : MyPassword
```

## Script Syntax

```powershell
 [CmdletBinding()]
Param(
 [Parameter(Mandatory=$True)]
 [ValidateSet('SetCredentials','UseCredentials')]
 [String]$Procedure,

 [Parameter(Mandatory=$True)]
 [ValidateNotNull()]
 [String]$User,

 [Parameter(Mandatory=$True)]
 [ValidateNotNull()]
 [String]$File
 )

    if ($Procedure -like "SetCredentials") {
$Password = Read-Host -Prompt "Enter password" -AsSecureString
$Credentials = New-Object System.Management.Automation.PSCredential -ArgumentList ($User,$Password)
$Credentials.Password | ConvertFrom-SecureString | Set-Content $File
}

    if ($Procedure -like "UseCredentials") {
$Password = Get-Content $File | ConvertTo-SecureString
$Global:Credentials = New-Object System.Management.Automation.PSCredential -ArgumentList ($User,$Password)
}
```