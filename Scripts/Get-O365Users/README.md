# Get report of Office 365 Users and attributes

## Requirements

You need to have appropriate rights to connect to Office 365 and Exchange Online to be able to run `Connect-MsolService` and `Get-Mailbox` cmdlet's.

You have to fill in `$ToExports` variable with UPN's of Office 365 users you want to get a report, then start the script. Script will ask your Microsoft credentials.

```powershell
$ToExports = "
user1@example.com
user2@example.com
user3@example.com
"
```

```powershell
.\Get-O365Users.ps1
```

It will create `O365Users.csv` file in script executable folder containing the information about your Office 365 users, which you specified in `$ToExports` variable. It includes the following attributes: Name, City, Country, Department, DisplayName, Emailaddress, Fax, FirstName, LastName, MobilePhone, Office, PasswordNeverExpires, PhoneNumber, PostalCode,SignInName, State, StreetAddress, Title, UserPrincipalName, PrimarySmtpAddress.

Alternatively, you can use `Get-O365UsersMBX.ps1` script to get a report for all active Exchange Online mailboxes only. It is assumed you are already connected to Microsoft Online services (Connect-MsolSerive and imported Exchange Online PSSession).

```powershell
.\Get-O365UsersMBX.ps1
```

You will get a report file with the same attributes as above.