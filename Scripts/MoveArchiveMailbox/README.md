# Exchange Server - Move Archive between mailboxes

```powershell
Get-Mailbox User1 | ft Name,ArchiveName
```

```text
Name              ArchiveName
----              -----------
User1             {In-Place Archive - User1}

Get-Mailbox User2 | ft Name,ArchiveName
Name              ArchiveName
----              -----------
User2             {}
```

```powershell
Disable-Mailbox User1 -Archive
```

```text
Disabling the archive for "User1" will remove the archive for this user and mark it in the database for removal.
[Y] Yes  [A] Yes to All  [N] No  [L] No to All  [?] Help (default is "Y"): Y


Get-Mailbox User1 | ft Name,ArchiveName
Name              ArchiveName
----              -----------
User1             {}
```

```powershell
Get-MailboxDatabase | Get-MailboxStatistics | where {$_.DisplayName -eq "In-Place Archive - User1"} | fl DisplayName,MailboxGuid,DatabaseName
```

```text
DisplayName  : In-Place Archive - User1
MailboxGuid  : 90f94fcf-761a-4a08-8feb-b17b02a16876
DatabaseName : DB1
```

**Note:** Clean msExchArchiveGUID attribute of User1 account. While User1 mailbox is active it reserves GUID of disabled archive. Otherwise new archive mailbox will be created with the same GUID.

```powershell
Enable-Mailbox -Identity User2 -ArchiveGuid "90f94fcf-761a-4a08-8feb-b17b02a16876" -ArchiveDatabase DB1 -Archive
```

```powershell
Get-Mailbox User2 | ft Name,ArchiveName
```

```text
Name              ArchiveName
----              -----------
User2             {In-Place Archive - User2}
```

Note: If Archive mailbox is not available run

```powershell
Disable-Mailbox User2 -Archive
Enable-Mailbox User2 -Archive
```

**Note:** Tested with Exchange 2013 SP1.