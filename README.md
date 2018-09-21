# PowerShell scripts

## Office 365, Microsoft Exchange and Exchange Online

[Get-MailboxStatisticsDetails](Scripts/Get-MailboxStatisticsDetails) - Gets detailed mailbox statistic information of Exchange Online mailbox. Useful for capacity planning of Outlook cached mode.  
[O365Report](Scripts/O365Report) - Office 365 Report. Script combines Get-MsolUser, Get-Mailbox and Get-MailboxStatistics cmdlet's into single one. Also includes basic licensing information.  
[Get-CalendarPermissionsReport](Scripts/Get-CalendarPermissionsReport) - Calendar permissions report for Exchange 2010/2013/2016 and Exchange Online.  
[Get-MsolGroupMember](Scripts/Get-MsolGroupMember) - Extend functionality of Get-MsolGroupMember cmdlet from Windows Azure Active Directory Module. Just Office 365 groups membership report script.  
[Get-O365Users](Scripts/Get-O365Users) - Get report of Office 365 Users and attributes.  
[Import-O365Users](Scripts/Import-O365Users) - Import Office 365 Users to Active Directory.

## Windows Server

[Get-UPDReport](Scripts/Get-UPDReport) - RDS User Profile Disks (UPDs) report including account information from Active Directory.  
[Compare-GPOs](Scripts/Compare-GPOs) - Troubleshoot Group Policy issues.  
[Get-ADComputerServiceAccounts](Scripts/Get-ADComputerServiceAccounts) - Active Directory service accounts report.  
[Get-ADComputerNetConfig](Scripts/Get-ADComputerNetConfig) - Network configuration report of Active Directory domain joined servers and workstations.  
[CheckpointSize](Scripts/CheckpointSize) - Hyper-V checkpoint size report via VMM Command Shell.  
[SendGmail](Scripts/SendGmail) - Send Gmail via PowerShell.  
[Get-NTFSPermissions](Scripts/Get-NTFSPermissions) - NTFS Permissions report.  
[Generate-GUID](Scripts/Generate-GUID) - Generate guid using PowerShell.  
[Query-mssql](Scripts/Query-mssql) - Query MS SQL Server and send the results via email.  
[MonitorWindowsService](Scripts/MonitorWindowsService) - Monitor Windows Service.  
[Get-ADPCReport](Scripts/Get-ADPCReport) - Active Directory domain joined workstations report.  
[Get-ADUsersReport](Scripts/Get-ADUsersReport) - Active Directory user accounts report.  
[Get-ADPasswordExpirationReport](Scripts/Get-ADPasswordExpirationReport) - Active Directory Users Password Expiration report.

## HowTo's

[Find-AzureEmptyRG](Scripts/Find-AzureEmptyRG) - Microsoft Azure - Find empty Resource Groups.  
[Fix-AzureVault](Scripts/Fix-AzureVault) - Microsoft Azure - Cross-subscription move error due to KeyVault.  
[Check-ADAcl](Scripts/Check-ADAcl) - Active Directory - Password Reset Delegation Audit.  
[AzureUPNChange](Scripts/AzureUPNChange) - Microsoft Azure AD Connect and UPN change.  
[MoveArchiveMailbox](Scripts/MoveArchiveMailbox) - Exchange Server - Move Archive between mailboxes.  
[Set-AzureVMAS](Scripts/Set-AzureVMAS) - Microsoft Azure - Add existing VM to Availability Set.  
[WorkingWithProcesses](Scripts/WorkingWithProcesses) - Working with Windows processes, get/kill.  
[WorkingWithProgressBar](Scripts/WorkingWithProgressBar) - Working with Progress Bar.  
[PSObjectPropertyOrder](Scripts/PSObjectPropertyOrder) - PSObject property order (ordered hash tables).  
[SessionRecording](Scripts/SessionRecording) - How to store all typed commands and their output to a file?  
[SendEmailOnBehalf](Scripts/SendEmailOnBehalf) - Send email on behalf.  
[WorkingWithArchives](Scripts/WorkingWithArchives) - Working with Archives.  
[WorkingWithCredentials](Scripts/WorkingWithCredentials) - Storing credentials in a file.  
[Azure2ADSync](Scripts/Azure2ADSync) - Synchronize Office 365 users back to Active Directory.  
[PowerShellLogRead](Scripts/PowerShellLogRead) - How to read logs using PowerShell.  
[Get-ParameterAlias](Scripts/Get-ParameterAlias) - Get PowerShell cmdlet parameter alias.

## Networking

[TCPListen](Scripts/TCPListen) - Open TCP port and listen for connections. Useful for troubleshooting TCP/IP or Firewall issues.

## Games

[Start-SeaBattle](Scripts/Start-SeaBattle) - Create 5 submarines (single-funnel) and play against computer.

## Fun

[Fix-PersonalDilemma](Scripts/Fix-PersonalDilemma) - Simple PowerShell script to solve a small dilemma