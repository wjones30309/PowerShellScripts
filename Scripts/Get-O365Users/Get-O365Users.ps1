#Specify emails to Export
$ToExports = "
user1@example.com
user2@example.com
user3@example.com
"
$ToExports = $ToExports -split '\r\n' | Where { $_ }

# Connect to Microsoft Online
$UserCredential = Get-Credential
$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $UserCredential -Authentication Basic -AllowRedirection
Import-PSSession $Session
Connect-MsolService

$Results = @()
foreach ($ToExport in $ToExports) {
$MailboxUsers = get-mailbox $ToExport

foreach ($user in $MailboxUsers)
{
$UPN = $user.userprincipalname
$username = $user.name
$MOL = Get-MsolUser -userprincipalname $UPN | Select-Object City, Country, Department, DisplayName, Fax, FirstName, LastName, MobilePhone, Office, PasswordNeverExpires, PhoneNumber, PostalCode,SignInName, State, StreetAddress, Title
$EmailAddress = Get-Mailbox -ResultSize Unlimited -identity $UserName | Select-Object PrimarySmtpAddress,@{name='EmailAddresses';expression={$_.EmailAddresses -join ','}}
      
      $Properties = @{
      Name = $username
      City = $MOL.city
      Country = $MOL.Country
      Department = $MOL.Department
      Displayname = $mol.displayname
      EmailAddress = $Emailaddress.EmailAddresses
      PrimarySmtpAddress = $Emailaddress.PrimarySmtpAddress
      Fax = $MOL.Fax
      FirstName = $MOL.firstname
      LastName = $MOL.LastName
      MobilePhone = $MOL.MobilePhone
      Office = $MOL.Office
      PasswordNeverExpires = $MOL.Passwordneverexpires
      PhoneNumber = $MOL.Phonenumber
      PostalCode = $MOL.Postalcode
      SignInName = $MOL.SignInName
      State = $MOL.State
      StreetAddress = $MOL.StreetAddress
      Title = $MOL.Title
      UserPrincipalName = $UPN

      }

$Results += New-Object psobject -Property $properties
}
}
$Results | Select-Object Name, City, Country, Department, DisplayName, Emailaddress, Fax, FirstName, LastName, MobilePhone, Office, PasswordNeverExpires, PhoneNumber, PostalCode,SignInName, State, StreetAddress, Title, UserPrincipalName,PrimarySmtpAddress | Export-Csv O365Users.csv -Encoding UTF8 -NoTypeInformation