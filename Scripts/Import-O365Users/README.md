# Import Office 365 Users to Active Directory

Script imports users from report that you get by `Get-O365Users.ps1` script.

## Requirements

You need to have permissions to create user accounts in Active Directory

You have to replace `-string 'Password'` with your own password (accounts will be created with this password), and replace `OU=OUNAME,DC=EXAMPLE,DC=COM` with DN of destination OU.

## Script Syntax

```powershell
$Accounts = import-csv .\O365Users.csv -Encoding UTF8
foreach ($Account in $Accounts) {          
New-ADUser -Name ($Account.Firstname + " " + $Account.Lastname) -SamAccountName ($Account.Firstname + "." + $Account.Lastname) -GivenName $Account.FirstName -Surname $Account.LastName -City $Account.City -Department $Account.Department -DisplayName $Account.DisplayName -EmailAddress $Account.PrimarySmtpAddress -Fax $Account.Fax -MobilePhone $Account.MobilePhone -Office $Account.Office -OfficePhone $Account.PhoneNumber -PostalCode $Account.PostalCode -State $Account.State -StreetAddress $Account.StreetAddress -Title $Account.Title -UserPrincipalName $Account.UserPrincipalName -Enable $True -AccountPassword (ConvertTo-SecureString -string 'Password' -AsPlainText -force) -Path 'OU=OUNAME,DC=EXAMPLE,DC=COM'
$EmailAddress = @()
$EmailAddress = $Account.EmailAddress -split ','
Get-ADUser ($Account.Firstname + "." + $Account.Lastname) | Get-ADObject | Set-ADObject -add @{proxyAddresses=$EmailAddress}
}
```