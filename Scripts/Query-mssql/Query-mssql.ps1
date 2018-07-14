$SQLConnectionString = "Server=SQLSERVER\InstanceName;Database=DatabaseName;Integrated Security=SSPI"
$File = "C:\Script\file.csv"
$SQLQuery = "
select * from DB_Table_Name
"
$SQLConnection = New-Object System.Data.SqlClient.SqlConnection
$SQLConnection.ConnectionString = $SQLConnectionString
$SQLCommand = $SQLConnection.CreateCommand()
$SQLCommand.CommandText = $SQLQuery
$DataAdapter = New-Object System.Data.SqlClient.SqlDataAdapter $SQLCommand
$Dataset = New-Object System.Data.Dataset
$DataAdapter.Fill($Dataset)
$Dataset.Tables[0] | Export-Csv $File -NoTypeInformation
$SMTPuser = "mailfrom@example.com"
$SMTPPassword = "mail_password"
$SMTPClient = New-Object system.net.mail.smtpClient($SmtpServer, 25)
$SMTPClient.host = "mail_server"
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential($SMTPuser, $SMTPPassword)
$MailMessage = New-Object system.net.mail.mailmessage
$MailMessage.from = "mailfrom@example.com"
$MailMessage.To.add("mailto@example.com")
$MailMessage.Subject = "Subject of Email"
$MailMessage.Attachments.Add($file)
$MailMessage.Body = "Email body here ..."
$SMTPClient.Send($MailMessage)
$MailMessage.dispose()
Remove-Item -Force $File