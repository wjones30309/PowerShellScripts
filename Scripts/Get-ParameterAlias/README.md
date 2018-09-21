# Get PowerShell cmdlet parameter alias

Get list of all parameters with aliases for all cmdlet's:

```
.\Get-ParameterAlias.ps1

Command                                 Parameter                               Alias
-------                                 ---------                               -----
Add-ProvisionedAppxPackage              LogLevel                                LL
Add-ProvisionedAppxPackage              LogPath                                 LP
Add-WindowsFeature                      ComputerName                            Cn
Add-WindowsFeature                      Confirm                                 cf
Add-WindowsFeature                      WhatIf                                  wi
Apply-WindowsUnattend                   LogLevel                                LL
Apply-WindowsUnattend                   LogPath                                 LP
Expand-IscsiVirtualDisk                 Path                                    DevicePath
...
Output omitted
...
```

Get list of parameters with aliases for `Get-Content` cmdlet:

```powershell
.\Get-ParameterAlias.ps1 -cmdlet Get-Content | ft -AutoSize

Command     Parameter      Alias
-------     ---------      -----
Get-Content LiteralPath    PSPath
Get-Content Tail           Last
Get-Content TotalCount     First, Head
Get-Content UseTransaction usetx
```

Same as above but only `Tail` parameter:

```powershell
.\Get-ParameterAlias.ps1 -cmdlet Get-Content -ParameterOrAlias Tail | ft -AutoSize

Command     Parameter Alias
-------     --------- -----
Get-Content Tail      Last
```

All parameters with `Session` parameter or alias:

```powershell
.\Get-ParameterAlias.ps1 Session

Command                                 Parameter                               Alias
-------                                 ---------                               -----
Flush-Volume                            CimSession                              Session
Initialize-Volume                       CimSession                              Session
Move-SmbClient                          CimSession                              Session
Write-FileSystemCache                   CimSession                              Session
Add-BCDataCacheExtension                CimSession                              Session
Add-DnsClientNrptRule                   CimSession                              Session
...
Output omitted
...
```

Wildcard is also accepted:

```powershell
.\Get-ParameterAlias.ps1 Administrative*

Command                                 Parameter                               Alias
-------                                 ---------                               -----
Add-NetLbfoTeamMember                   AdministrativeMode                      am
```