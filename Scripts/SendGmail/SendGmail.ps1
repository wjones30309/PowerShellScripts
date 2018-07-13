$User = "USER NAME"
$Password = "USER PASSWORD"
$EmailFrom = "Your email address"
$EmailTo = "Recipient address" 
$Subject = "Your Subject"
$Body = "Your email body" 
$SMTPServer = "smtp.gmail.com"
$msg = new-object Net.Mail.MailMessage
$msg.From = $EmailFrom
$msg.to.Add($EmailTo)
$msg.Subject = $Subject
$msg.Body = $Body
$SMTPClient = New-Object Net.Mail.SmtpClient($SmtpServer, 587) 
$SMTPClient.EnableSsl = $true 
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential($User, $Password) 
$SMTPClient.Send($msg)
