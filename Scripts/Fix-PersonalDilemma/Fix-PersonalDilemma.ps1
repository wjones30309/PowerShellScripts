clear
$list = "
Do this
Do that
Buy that
"
$voters = "
Person1
Person2
"

$list = $list -split '[\r\n]' | Where { $_ } | sort {Get-Random}
$voters = $voters -split '[\r\n]' | Where { $_ }
$list2sort = @()
$id = 1
$votes = 0

foreach ($item in $list) 
{
$Properties = [Ordered]@{
ID = $id
Item = $item
Votes = $votes}
$list2sort += New-Object -TypeName PSObject -Property $Properties
$id++
}

foreach ($voter in $voters) 
{
$start = $false

    while (!$start)  
    {
    echo "$($voter) is voting. Press Enter to start"
    $Key = [System.Console]::ReadKey($true)
    clear
        if ($Key.Key -eq "Enter") 
        {
        $list2sort2 = $list2sort
        $start = $true
        
            foreach ($item in $list2sort) 
            {
            $list2compare = $list2sort2 | where {$_.Item -ne $item.Item} | sort {Get-Random}

                foreach ($thing in $list2compare) 
                {
                echo "What do you choose? (Press 1 or 2)"
                echo "1: $($item.Item)"
                echo "2: $($thing.Item)"
                $KeyCheck = $false
                    while (!$KeyCheck)
                    {
                    $Key = [System.Console]::ReadKey($true) 
                    if ($Key.KeyChar -eq "1") 
                        {
                        ($list2sort | where {$_.Item -eq $item.Item}).Votes += 1; $list2sort2 = $list2sort2 | where {$_.Item -ne $item.Item}; $KeyCheck = $true
                        }
                    if ($Key.KeyChar -eq "2") 
                        {
                        ($list2sort | where {$_.Item -eq $thing.Item}).Votes += 1; $list2sort2 = $list2sort2 | where {$_.Item -ne $item.Item}; $KeyCheck = $true
                        }
                    }
                echo $Key.KeyChar
                clear
                }
            }
        }
    }
}
echo $($list2sort | sort Votes -Descending | ft Item,Votes -AutoSize)