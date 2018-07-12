# Extend functionality of Get-MsolGroupMember cmdlet from Windows Azure Active Directory Module

It adds GroupDisplayName, GroupEmail and GroupType to output for every group member. It allows making a customized Office 365 group membership report and exporting the data to CSV file.

Included properties: GroupDisplayName, GroupEmail, GroupType, MemberDisplayName, MemberEmail, MemberType

## Examples

Display in table Office 365 Group membership report

```powershell
.\Get-MsolGroupMember.ps1 | ft -Wrap
```

Show groups where user@contoso.com email is a member of, export results to csv file

```powershell
.\Get-MsolGroupMember.ps1 | where {$_.MemberEmail -eq "user@contoso.com"} | export-csv file.csv
```

Show only security groups

```powershell
.\Get-MsolGroupMember.ps1 | where {$_.GroupType -eq "Security"} | ft -Wrap
```

## Requirements

Windows Azure Active Directory Module for PowerShell should be installed. Connection to Azure AD should be initialized before the script (Connect-MsolService).
