### Office 365 Report
This powershell script provides information about Exchange Online mailboxes. It includes following attributes: FirstName, LastName, DisplayName, Alias, UserPrincipalName, Office, Department, TotalItemSize, LastLogonTime, RecipientTypeDetails and basic licensing information.

#### Script logic
Script combines Get-MsolUser, Get-Mailbox and Get-MailboxStatistics cmdlets into single one. You must have appropriate permissions in your tenant to run these cmdlets.

Discovery Mailboxes are excluded from report. TotalItemSize values are converted to MB.

Windows Azure Active Directory Module for Windows PowerShell is required. Otherwise Get-MsolUser and whole script will fail.

#### Usage
Download O365Report.ps1, open PowerShell, navigate to folder where script was downloaded, run the script. You will get credentials popup to connect to your tenant (make sure that you use the same account to access Office 365 Admin Portal and Exchange Online). Results will be exported to CSV file.

#### Script amendments
8/20/2015 - User Title and Archive statistics have been added to report. <br />
9/11/2015 - For tenants with managed default domain "LastPasswordChangeTimestamp" and "PasswordExpirationIn (Days)" information has been added
