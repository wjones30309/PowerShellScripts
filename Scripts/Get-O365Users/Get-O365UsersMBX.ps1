$ToExports = Get-Mailbox -ResultSize Unlimited | select -ExpandProperty PrimarySmtpAddress

$Results = @()
foreach ($ToExport in $ToExports) {
$MailboxUsers = get-mailbox $ToExport

foreach ($user in $MailboxUsers)
{
$UPN = $user.userprincipalname
$username = $user.name
$MOL = Get-MsolUser -userprincipalname $UPN | Select-Object isLicensed,City, Country, Department, DisplayName, Fax, FirstName, LastName, MobilePhone, Office, PasswordNeverExpires, PhoneNumber, PostalCode,SignInName, State, StreetAddress, Title
$EmailAddress = Get-Mailbox -ResultSize Unlimited -identity $UserName | Select-Object PrimarySmtpAddress,@{name='EmailAddresses';expression={$_.EmailAddresses -join ','}}
      
      $Properties = @{
      Name = $username
      isLicensed = $MOL.isLicensed
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
$Results | Select-Object Name, isLicensed, City, Country, Department, DisplayName, Emailaddress, Fax, FirstName, LastName, MobilePhone, Office, PasswordNeverExpires, PhoneNumber, PostalCode,SignInName, State, StreetAddress, Title, UserPrincipalName,PrimarySmtpAddress | Export-Csv O365Users.csv -Encoding UTF8 -NoTypeInformation