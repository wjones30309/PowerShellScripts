# PowerShell - Send email on behalf

```powershell
$EmailFrom = "User One <user.one@example.com>"
$EmailTo = "Vyacheslav Fedenko <vyacheslav.fedenko@example.com>"
$Subject = "Email Subject"
$body = "Email Body"
$SmtpServer = "YOUR SMTP SERVER IP ADDRESS"
$Smtp = new-object Net.Mail.SmtpClient($SmtpServer)
$MailMessage = new-object Net.Mail.MailMessage($EmailFrom, $EmailTo, $Subject, $body)
$MailMessage.Sender = "User.Two@example.com"
$Smtp.Send($MailMessage)
```

![onbehalf](onbehalf.png)