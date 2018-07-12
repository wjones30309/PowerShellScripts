# Gets detailed mailbox statistic information in Exchange Online

When you configure cache settings in outlook you need to choose how much data you want to store locally.
This script helps to identify the size of mailbox for specific time range: 3 days, 1 week, 2 weeks 1 month etc. up to 2 years.
It includes information about archive size and items count. The script accepts pipeline and the result can be exported to csv file.

## Parameters

### -UserPrincipalName

UPN of queried mailbox. Mandatory parameter.

### -MaxRange [TotalOnly | 3Days | 1Week | 2 Weeks | 1Month ... | ... ]

Specifies maximum range for the query. Available options:

TotalOnly - shows only total mailbox statistics. Mailbox Size in MB.

3Days - Shows Total information including the statistics for the last 3 days.

1Week - Shows Total, 3 days and 1 week.

2Weeks - same as above including 2 weeks.

1Month, 3Months, 6Months, 1Year, 2Years - same logic as above.

### -IncludeItemsCount

Not mandatory parameter. The output will include mailbox items count information.

### -ExcludeArchiveItems

Not mandatory parameter. By specifying this parameter the output will not include archive items.

## Examples

The output will include information about mailbox name, UPN, when mailbox was created, status of archive (enabled or disabled), Total Mailbox Size in MB and Archive Size.

```powershell
.\Get-MailboxStatisticsDetails.ps1 -UserPrincipalName mailbox@example.com -MaxRange TotalOnly
```

The same as above including mailbox Total and Archive Items count.

```powershell
.\Get-MailboxStatisticsDetails.ps1 -UserPrincipalName mailbox@example.com -MaxRange TotalOnly -IncludeItemsCount
```

The same as above but Total Size and Total Items will not include archive items.

```powershell
.\Get-MailboxStatisticsDetails.ps1 -UserPrincipalName mailbox@example.com -MaxRange TotalOnly -IncludeItemsCount -ExcludeArchiveItems
```

Exactly the same result as previous example including statistics information for last 3 days, 1 week, 2 weeks, 1 month and 3 months.

```powershell
.\Get-MailboxStatisticsDetails.ps1 -UserPrincipalName mailbox@example.com -MaxRange 3Months -IncludeItemsCount -ExcludeArchiveItems
```

Exports above example to csv file.

```powershell
.\Get-MailboxStatisticsDetails.ps1 -UserPrincipalName mailbox@example.com -MaxRange 3Months -IncludeItemsCount -ExcludeArchiveItems | Export-Csv filename.csv
```

Script accepts pipeline. Example below.

```powershell
Get-Mailbox mailbox@example.com | .\Get-MailboxStatisticsDetails.ps1 -MaxRange TotalOnly
```

Report for all users mailboxes, sorted by Name, include items count and exclude archive items, then export the result to csv file.

```powershell
Get-Mailbox -RecipientTypeDetails UserMailbox | .\Get-MailboxStatisticsDetails.ps1 -MaxRange TotalOnly -IncludeItemsCount -ExcludeArchiveItems | Export-Csv filename.csv
```

## Requirements

You need to be connected to Exchange Online PowerShell prior running this script.

Account should have appropriate rights to run "Get-Mailbox", "Search-Mailbox" and "Get-MailboxStatistics" cmdlet's.

The script may not work (not accurate results for log time queries) with "Microsoft Exchange Online PowerShell Module" (MFA case) due to session timeout.

It is assumed that queried mailboxes have less than 10K items weekly load (which is common for regular mailbox use). Otherwise the results can be inaccurate.
