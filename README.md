# PowerShell scripts

## Office 365, Microsoft Exchange and Exchange Online

[Get-MailboxStatisticsDetails](Scripts/Get-MailboxStatisticsDetails) - Gets detailed mailbox statistic information of Exchange Online mailbox. Useful for capacity planning of Outlook cached mode.  
[O365Report](Scripts/O365Report) - Office 365 Report. Script combines Get-MsolUser, Get-Mailbox and Get-MailboxStatistics cmdlet's into single one. Also includes basic licensing information.  
[Get-CalendarPermissionsReport](Scripts/Get-CalendarPermissionsReport) - Calendar permissions report for Exchange 2010/2013/2016 and Exchange Online.  
[Get-MsolGroupMember](Scripts/Get-MsolGroupMember) - Extend functionality of Get-MsolGroupMember cmdlet from Windows Azure Active Directory Module. Just Office 365 groups membership report script.

## Windows Server

[Get-UPDReport](Scripts/Get-UPDReport) - RDS User Profile Disks (UPDs) report including account information from Active Directory.  
[Compare-GPOs](Scripts/Compare-GPOs) - Troubleshoot Group Policy issues.  
[Get-ADComputerServiceAccounts](Scripts/Get-ADComputerServiceAccounts) - Active Directory service accounts report.  
[Get-ADComputerNetConfig](Scripts/Get-ADComputerNetConfig) - Network configuration report of Active Directory domain joined servers and workstations.  
[CheckpointSize](Scripts/CheckpointSize) - Hyper-V checkpoint size report via VMM Command Shell.  
[SendGmail](Scripts/SendGmail) - Send Gmail via PowerShell.  
[Get-NTFSPermissions](Scripts/Get-NTFSPermissions) - NTFS Permissions report.  
[Generate-GUID](Scripts/Generate-GUID) - Generate guid using PowerShell.

## Networking

[TCPListen](Scripts/TCPListen) - Open TCP port and listen for connections. Useful for troubleshooting TCP/IP or Firewall issues.

## PowerShell games

[Start-SeaBattle](Scripts/Start-SeaBattle) - Create 5 submarines (single-funnel) and play against computer.

## HowTo's

[Find-AzureEmptyRG](Scripts/Find-AzureEmptyRG) - Microsoft Azure - Find empty Resource Groups.  
[Fix-AzureVault](Scripts/Fix-AzureVault) - Microsoft Azure - Cross-subscription move error due to KeyVault.