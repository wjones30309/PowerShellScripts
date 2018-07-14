# Query MS SQL Server script

This PowerShell script connects to SQL server, queries needed data, exports the results to the CSV file and then sends it via email.

```powershell
# SQL Server connection string details, integration authentication is used.
$SQLConnectionString = "Server=SQLSERVER\InstanceName;Database=DatabaseName;Integrated Security=SSPI"
# Path to the file for exported data.
$File = "C:\Script\file.csv"
# SQL Query syntax itself.
$SQLQuery = "
select * from DB_Table_Name
"

# Connecting and querying SQL server for data.
$SQLConnection = New-Object System.Data.SqlClient.SqlConnection
$SQLConnection.ConnectionString = $SQLConnectionString
$SQLCommand = $SQLConnection.CreateCommand()
$SQLCommand.CommandText = $SQLQuery
$DataAdapter = New-Object System.Data.SqlClient.SqlDataAdapter $SQLCommand
$Dataset = New-Object System.Data.Dataset
$DataAdapter.Fill($Dataset)
# Export queried data to CSV file.
$Dataset.Tables[0] | Export-Csv $File -NoTypeInformation
# Connecting to mail server and sending an email with exported CSV file attached.
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
# Removing CSV file.
Remove-Item -Force $File
```