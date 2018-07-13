[cmdletbinding()]
Param (
[parameter(ValueFromPipelineByPropertyName=$True,Mandatory=$False)]
[string[]]$UserPrincipalName,
     
[Parameter(Mandatory=$true)] 
[ValidateSet('TotalOnly','3Days','1Week','2Weeks','1Month','3Months','6Months','1Year','2Years')] 
[String]$MaxRange, 
    
[Parameter(Mandatory=$False)]
[switch]$IncludeItemsCount,

[Parameter(Mandatory=$False)]
[switch]$ExcludeArchiveItems
)

Process {
if ($ExcludeArchiveItems) {$Script:ExcludeArchiveItems = $ExcludeArchiveItems}
$Range = 0
if ($MaxRange -eq "TotalOnly") {$Range = 1}
if ($MaxRange -eq "3Days") {$Range = 2 }
if ($MaxRange -eq "1Week") {$Range = 3 }
if ($MaxRange -eq "2Weeks") {$Range = 4 }
if ($MaxRange -eq "1Month") {$Range = 5 }
if ($MaxRange -eq "3Months") {$Range = 6 }
if ($MaxRange -eq "6Months") {$Range = 7 }
if ($MaxRange -eq "1Year") {$Range = 8 }
if ($MaxRange -eq "2Years") {$Range = 9 }

foreach ($Mailbox in $UserPrincipalName) {

function SearchItems {

[cmdletbinding()]

Param (

[Parameter(ValueFromPipeline)]$Identity,
[Parameter(ValueFromPipeline)]$Start,
[Parameter(ValueFromPipeline)]$End

)

Process  {

if ($Start) 
{

if ($Script:ExcludeArchiveItems) {
$Query = Search-Mailbox -Identity $Identity -SearchQuery "Received:$($Start)..$($End)" -EstimateResultOnly -DoNotIncludeArchive -WarningAction SilentlyContinue 
$Query | select ResultItemsCount,@{name="Size (MB)"; expression={[math]::Round($_.ResultItemsSize.ToString().Split("(")[1].Split(" ")[0].Replace(",","")/1MB)}}
}
else {
$Query = Search-Mailbox -Identity $Identity -SearchQuery "Received:$($Start)..$($End)" -EstimateResultOnly -WarningAction SilentlyContinue 
$Query | select ResultItemsCount,@{name="Size (MB)"; expression={[math]::Round($_.ResultItemsSize.ToString().Split("(")[1].Split(" ")[0].Replace(",","")/1MB)}}
}

}

else 
{

if ($Script:ExcludeArchiveItems) {
$Query = Search-Mailbox -Identity $Identity -EstimateResultOnly -DoNotIncludeArchive -WarningAction SilentlyContinue 
$Query | select ResultItemsCount,@{name="Size (MB)"; expression={[math]::Round($_.ResultItemsSize.ToString().Split("(")[1].Split(" ")[0].Replace(",","")/1MB)}}
}

else {
$Query = Search-Mailbox -Identity $Identity -EstimateResultOnly -WarningAction SilentlyContinue 
$Query | select ResultItemsCount,@{name="Size (MB)"; expression={[math]::Round($_.ResultItemsSize.ToString().Split("(")[1].Split(" ")[0].Replace(",","")/1MB)}}
}

}

}

}

function Sort10000 {

[cmdletbinding()]

Param (

[Parameter(ValueFromPipeline)]$Identity,
[Parameter(ValueFromPipeline)]$Start,
[Parameter(ValueFromPipeline)]$End

)

Process  {

$Days = ((([datetime]$End - [datetime]$Start).days).tostring()).split(".")[0]

$i = 0

do {
if ($i -eq 0) {
$StartW = [datetime]$Start | Get-Date -Format M/d/yyyy;  
$EndW = ([datetime]$Start).AddDays(6) | Get-Date -Format M/d/yyyy; 
SearchItems $Identity $StartW $EndW; $i = $i + 7}


if (($Days - $i) -ge 7) {
$StartW = ([datetime]$Start).AddDays($i) | Get-Date -Format M/d/yyyy;  
$EndW = ([datetime]$Start).AddDays($i+6) | Get-Date -Format M/d/yyyy; 
SearchItems $Identity $StartW $EndW; $i = $i + 7}

if (($Days - $i) -lt 7) {
$StartW = ([datetime]$Start).AddDays($i) | Get-Date -Format M/d/yyyy;  
$EndW = ([datetime]$Start).AddDays($i+($Days - $i)) | Get-Date -Format M/d/yyyy; 
SearchItems $Identity $StartW $EndW; $i = $i + ($Days - $i)}

}
until ($i -eq $Days)

}

}

function CheckCreationDate {

[cmdletbinding()]

Param (

[Parameter(ValueFromPipeline)]$CheckCreationDate,
[Parameter(ValueFromPipeline)]$WhenMailboxCreated

)

Process  {

if ([datetime]$WhenMailboxCreated -gt [datetime]$CheckCreationDate) {
$CheckOut = [datetime]$WhenMailboxCreated | Get-Date -Format M/d/yyyy
$CheckOut
}
else {
$CheckCreationDate
}

}

}

$Mailbox = Get-Mailbox $Mailbox
$Date = Get-Date
$DateFormatted = $Date | Get-Date -Format M/d/yyyy
$MailboxCreationDate = $Mailbox.WhenMailboxCreated | Get-Date -Format M/d/yyyy
$TotalQuery = $3DaysQuery = $7DaysQuery = $TwoWeeksQuery = $OneMonthQuery = $ThreeMonthsQuery = $SixMonthsQuery = $OneYearQuery = $TwoYearsQuery = 0
$Date3DaysOld = $Date.AddDays(-3); $Date3DaysOldFormatted = $Date3DaysOld | Get-Date -Format M/d/yyyy
$Date7DaysOld = $Date.AddDays(-7); $Date7DaysOldFormatted = $Date7DaysOld | Get-Date -Format M/d/yyyy
$DateTwoWeeksOld = $Date.AddDays(-14); $DateTwoWeeksOldFormatted = $DateTwoWeeksOld | Get-Date -Format M/d/yyyy
$OneMonthOld = $Date.AddMonths(-1); $OneMonthOldFormatted = $OneMonthOld | Get-Date -Format M/d/yyyy
$ThreeMonthsOld = $Date.AddMonths(-3); $ThreeMonthsOldFormatted = $ThreeMonthsOld | Get-Date -Format M/d/yyyy
$SixMonthsOld = $Date.AddMonths(-6); $SixMonthsOldFormatted = $SixMonthsOld | Get-Date -Format M/d/yyyy
$OneYearOld = $Date.AddMonths(-12); $OneYearOldFormatted = $OneYearOld | Get-Date -Format M/d/yyyy
$TwoYearsOld = $Date.AddMonths(-24); $TwoYearsOldFormatted = $TwoYearsOld | Get-Date -Format M/d/yyyy

if ($Range) {
$TotalQuery = SearchItems $Mailbox.UserPrincipalName
}

if ($Range -ge 2) {
$3DaysQuery = $TotalQuery
if ($Mailbox.WhenMailboxCreated -le $Date.AddDays(-1)) { $3DaysQuery = SearchItems $Mailbox.UserPrincipalName $Date3DaysOldFormatted $DateFormatted }
}

if ($Range -ge 3) {
$7DaysQuery = $3DaysQuery
if ($Mailbox.WhenMailboxCreated -le $Date3DaysOld) { $7DaysQuery = SearchItems $Mailbox.UserPrincipalName $Date7DaysOldFormatted $DateFormatted }
}

if ($Range -ge 4) {
$TwoWeeksQuery = $7DaysQuery
if ($Mailbox.WhenMailboxCreated -le $Date7DaysOld) {
$TwoWeeksQuery = SearchItems $Mailbox.UserPrincipalName $DateTwoWeeksOldFormatted $DateFormatted
$TwoWeeksQueryItems = ($TwoWeeksQuery.ResultItemsCount | measure -sum).sum
$TwoWeeksQuerySize = ($TwoWeeksQuery."Size (MB)" | measure -sum).sum
if ($TwoWeeksQuery.ResultItemsCount -eq 10000) {
$DateTwoWeeksOldFormatted = CheckCreationDate $DateTwoWeeksOldFormatted $MailboxCreationDate
$TwoWeeksQuery = Sort10000 $Mailbox.UserPrincipalName $DateTwoWeeksOldFormatted $DateFormatted
$TwoWeeksQueryItems = ($TwoWeeksQuery.ResultItemsCount | measure -sum).sum
$TwoWeeksQuerySize = ($TwoWeeksQuery."Size (MB)" | measure -sum).sum
}}
}

if ($Range -ge 5) {
$OneMonthQuery = $TwoWeeksQuery
if ($Mailbox.WhenMailboxCreated -le $DateTwoWeeksOld) {
$OneMonthQuery = SearchItems $Mailbox.UserPrincipalName $OneMonthOldFormatted $DateFormatted
$OneMonthQueryItems = ($OneMonthQuery.ResultItemsCount | measure -sum).sum
$OneMonthQuerySize = ($OneMonthQuery."Size (MB)" | measure -sum).sum
if ($OneMonthQuery.ResultItemsCount -eq 10000) {
$OneMonthOldFormatted = CheckCreationDate $OneMonthOldFormatted $MailboxCreationDate
$OneMonthQuery = Sort10000 $Mailbox.UserPrincipalName $OneMonthOldFormatted $DateFormatted
$OneMonthQueryItems = ($OneMonthQuery.ResultItemsCount | measure -sum).sum
$OneMonthQuerySize = ($OneMonthQuery."Size (MB)" | measure -sum).sum
}}
}

if ($Range -ge 6) {
$ThreeMonthsQuery = $OneMonthQuery
$ThreeMonthsQueryItems = ($ThreeMonthsQuery.ResultItemsCount | measure -sum).sum
$ThreeMonthsQuerySize = ($ThreeMonthsQuery."Size (MB)" | measure -sum).sum
if ($Mailbox.WhenMailboxCreated -le $OneMonthOld) {
$ThreeMonthsQuery = SearchItems $Mailbox.UserPrincipalName $ThreeMonthsOldFormatted $DateFormatted
$ThreeMonthsQueryItems = ($ThreeMonthsQuery.ResultItemsCount | measure -sum).sum
$ThreeMonthsQuerySize = ($ThreeMonthsQuery."Size (MB)" | measure -sum).sum
if ($ThreeMonthsQuery.ResultItemsCount -eq 10000) {
$ThreeMonthsOldFormatted = CheckCreationDate $ThreeMonthsOldFormatted $MailboxCreationDate
$ThreeMonthsQuery = 0; $ThreeMonthsQuery = Sort10000 $Mailbox.UserPrincipalName $ThreeMonthsOldFormatted $DateFormatted
$ThreeMonthsQueryItems = ($ThreeMonthsQuery.ResultItemsCount | measure -sum).sum
$ThreeMonthsQuerySize = ($ThreeMonthsQuery."Size (MB)" | measure -sum).sum 
}}
}

if ($Range -ge 7) {
$SixMonthsQuery = $ThreeMonthsQuery
$SixMonthsQueryItems = ($SixMonthsQuery.ResultItemsCount | measure -sum).sum
$SixMonthsQuerySize = ($SixMonthsQuery."Size (MB)" | measure -sum).sum
if ($Mailbox.WhenMailboxCreated -le $ThreeMonthsOld) {
$SixMonthsQuery = SearchItems $Mailbox.UserPrincipalName $SixMonthsOldFormatted $DateFormatted
$SixMonthsQueryItems = ($SixMonthsQuery.ResultItemsCount | measure -sum).sum
$SixMonthsQuerySize = ($SixMonthsQuery."Size (MB)" | measure -sum).sum
if ($SixMonthsQuery.ResultItemsCount -eq 10000) {
$SixMonthsOldFormatted = CheckCreationDate $SixMonthsOldFormatted $MailboxCreationDate
$ThreeMonthsOldFormatted = ([datetime]$ThreeMonthsOldFormatted).AddDays(-1) | Get-Date -Format M/d/yyyy
$SixMonthsQuery = 0; $SixMonthsQuery = Sort10000 $Mailbox.UserPrincipalName $SixMonthsOldFormatted $ThreeMonthsOldFormatted
$SixMonthsQueryItems = (($SixMonthsQuery.ResultItemsCount | measure -sum).sum) + $ThreeMonthsQueryItems
$SixMonthsQuerySize = (($SixMonthsQuery."Size (MB)" | measure -sum).sum) + $ThreeMonthsQuerySize
}}
}

if ($Range -ge 8) {
$OneYearQuery = $SixMonthsQuery
$OneYearQueryItems = ($OneYearQuery.ResultItemsCount | measure -sum).sum
$OneYearQuerySize = ($OneYearQuery."Size (MB)" | measure -sum).sum
if ($Mailbox.WhenMailboxCreated -le $SixMonthsOld) {
$OneYearQuery = SearchItems $Mailbox.UserPrincipalName $OneYearOldFormatted $DateFormatted
$OneYearQueryItems = ($OneYearQuery.ResultItemsCount | measure -sum).sum
$OneYearQuerySize = ($OneYearQuery."Size (MB)" | measure -sum).sum
if ($OneYearQuery.ResultItemsCount -eq 10000) { 
$OneYearOldFormatted = CheckCreationDate $OneYearOldFormatted $MailboxCreationDate
$SixMonthsOldFormatted = ([datetime]$SixMonthsOldFormatted).AddDays(-1) | Get-Date -Format M/d/yyyy
$OneYearQuery = 0; $OneYearQuery = Sort10000 $Mailbox.UserPrincipalName $OneYearOldFormatted $SixMonthsOldFormatted
$OneYearQueryItems = (($OneYearQuery.ResultItemsCount | measure -sum).sum) + $SixMonthsQueryItems
$OneYearQuerySize = (($OneYearQuery."Size (MB)" | measure -sum).sum) + $SixMonthsQuerySize
}}
}

if ($Range -eq 9) {
$TwoYearsQuery = $OneYearQuery
$TwoYearsQueryItems = ($TwoYearsQuery.ResultItemsCount | measure -sum).sum
$TwoYearsQuerySize = ($TwoYearsQuery."Size (MB)" | measure -sum).sum
if ( ($Mailbox.WhenMailboxCreated -lt $OneYearOld) -and ($Mailbox.WhenMailboxCreated -ge $TwoYearsOld) ) {
$TwoYearsQuery = $TotalQuery
$TwoYearsQueryItems = ($TwoYearsQuery.ResultItemsCount | measure -sum).sum
$TwoYearsQuerySize = ($TwoYearsQuery."Size (MB)" | measure -sum).sum }
if ($Mailbox.WhenMailboxCreated -lt $TwoYearsOld) {
$TwoYearsQuery = SearchItems $Mailbox.UserPrincipalName $TwoYearsOldFormatted $DateFormatted
$TwoYearsQueryItems = ($TwoYearsQuery.ResultItemsCount | measure -sum).sum
$TwoYearsQuerySize = ($TwoYearsQuery."Size (MB)" | measure -sum).sum
if ($TwoYearsQuery.ResultItemsCount -eq 10000) {
$OneYearOldFormatted = ([datetime]$OneYearOldFormatted).AddDays(-1) | Get-Date -Format M/d/yyyy
$TwoYearsQuery = 0; $TwoYearsQuery = Sort10000 $Mailbox.UserPrincipalName $TwoYearsOldFormatted $OneYearOldFormatted
$TwoYearsQueryItems = (($TwoYearsQuery.ResultItemsCount | measure -sum).sum) + $OneYearQueryItems
$TwoYearsQuerySize = (($TwoYearsQuery."Size (MB)" | measure -sum).sum) + $OneYearQuerySize
}}
}
$ArchiveStatus = "Disabled"
if ($Mailbox.ArchiveStatus -eq "Active") {
$ArchiveSize = @()
$ArchiveSize = Get-MailboxStatistics $Mailbox.UserPrincipalName -Archive -WarningAction SilentlyContinue | select ItemCount,@{name="Archive Size (MB)"; expression={[math]::Round($_.TotalItemSize.ToString().Split("(")[1].Split(" ")[0].Replace(",","")/1MB)}}
$ArchiveStatus = "Enabled"
}

$Out = [Ordered]@{
"Name" = $Mailbox.Name
"UPN" = $Mailbox.UserPrincipalName
"Mailbox Created" = $MailboxCreationDate
"Archive Status" = $ArchiveStatus
"Total Size (MB)" = $TotalQuery."Size (MB)"
"Archive Size (MB)" = $ArchiveSize."Archive Size (MB)"
 }

$Object = New-Object -TypeName PSObject -Property $Out

if ($Range -ge 2) {$Object | Add-Member "Three Days (MB)" $3DaysQuery."Size (MB)"}
if ($Range -ge 3) {$Object | Add-Member "Seven Days (MB)" $7DaysQuery."Size (MB)"}
if ($Range -ge 4) {$Object | Add-Member "Two Weeks (MB)" $TwoWeeksQuerySize}
if ($Range -ge 5) {$Object | Add-Member "One Month (MB)" $OneMonthQuerySize}
if ($Range -ge 6) {$Object | Add-Member "Three Months (MB)" $ThreeMonthsQuerySize}
if ($Range -ge 7) {$Object | Add-Member "Six Months (MB)" $SixMonthsQuerySize}
if ($Range -ge 8) {$Object | Add-Member "One Year (MB)" $OneYearQuerySize}
if ($Range -ge 9) {$Object | Add-Member "Two Years (MB)" $TwoYearsQuerySize}

if ($IncludeItemsCount) {$Object | Add-Member "Total Items" $TotalQuery.ResultItemsCount; $Object | Add-Member "Archive Items" $ArchiveSize.ItemCount}
if ( ($Range -ge 2) -and ($IncludeItemsCount) ) {$Object | Add-Member "Three Days Items" $3DaysQuery.ResultItemsCount}
if ( ($Range -ge 3) -and ($IncludeItemsCount) ) {$Object | Add-Member "Seven Days Items" $7DaysQuery.ResultItemsCount}
if ( ($Range -ge 4) -and ($IncludeItemsCount) ) {$Object | Add-Member "Two Weeks Items" $TwoWeeksQueryItems}
if ( ($Range -ge 5) -and ($IncludeItemsCount) ) {$Object | Add-Member "One Month Items" $OneMonthQueryItems}
if ( ($Range -ge 6) -and ($IncludeItemsCount) ) {$Object | Add-Member "Three Months Items" $ThreeMonthsQueryItems}
if ( ($Range -ge 7) -and ($IncludeItemsCount) ) {$Object | Add-Member "Six Months Items" $SixMonthsQueryItems}
if ( ($Range -ge 8) -and ($IncludeItemsCount) ) {$Object | Add-Member "One Year Items" $OneYearQueryItems}
if ( ($Range -eq 9) -and ($IncludeItemsCount) ) {$Object | Add-Member "Two Years Items" $TwoYearsQueryItems}

$Object





        }
    }   

