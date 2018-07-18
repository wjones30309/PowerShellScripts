$Accounts = import-csv .\O365Users.csv -Encoding UTF8
foreach ($Account in $Accounts) {          
New-ADUser -Name ($Account.Firstname + " " + $Account.Lastname) -SamAccountName ($Account.Firstname + "." + $Account.Lastname) -GivenName $Account.FirstName -Surname $Account.LastName -City $Account.City -Department $Account.Department -DisplayName $Account.DisplayName -EmailAddress $Account.PrimarySmtpAddress -Fax $Account.Fax -MobilePhone $Account.MobilePhone -Office $Account.Office -OfficePhone $Account.PhoneNumber -PostalCode $Account.PostalCode -State $Account.State -StreetAddress $Account.StreetAddress -Title $Account.Title -UserPrincipalName $Account.UserPrincipalName -Enable $True -AccountPassword (ConvertTo-SecureString -string 'Password' -AsPlainText -force) -Path 'OU=OUNAME,DC=EXAMPLE,DC=COM'
$EmailAddress = @()
$EmailAddress = $Account.EmailAddress -split ','
Get-ADUser ($Account.Firstname + "." + $Account.Lastname) | Get-ADObject | Set-ADObject -add @{proxyAddresses=$EmailAddress}
}