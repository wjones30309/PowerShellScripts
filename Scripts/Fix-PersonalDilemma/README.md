# Simple PowerShell script to solve a small dilemma

My family has a list of things that we need to do or purchase. One day I noticed it is more than 10 in a list. Some kind of priority and decision need to be made. The problem is that everyone in my family has it is own thoughts (as expected) about each item in a list, so it should be a collective decision. No surprise I immediately found it is very interesting case to solve using PowerShell. The idea is to allow each family member to go through the list by comparing each item against another. During compare process a winner item is getting the vote. Most voted items will be first in the list after all family members go through it.

## What you need

Simply fill in the variables in the script and run it.

Specify things from your list:

```text
$list = "
Do this
Do that
Buy that
"
```

Put the family members into `$voters` variable:

```text
$voters = "
Person1
Person2
"
```

## Script syntax with comments

```powershell
# Clear console screen.
clear
# Put things from your list.
$list = "
Do this
Do that
Buy that
"
# Specify who is going to vote. It also can be one person only.
$voters = "
Person1
Person2
"
# Creates array from our variable and randomizes it.
$list = $list -split '[\r\n]' | Where { $_ } | sort {Get-Random}
# Do the same for voters but no random here.
$voters = $voters -split '[\r\n]' | Where { $_ }
# Create array for our report.
$list2sort = @()
# Variable is used for ID. It is not actually used but I left it historically. ID paid me for its place here :)
$id = 1
# Default vote variable is set to 0 here. Also not actually needed.
$votes = 0
# Starting a one time dedicated loop to build our array for report.
foreach ($item in $list)
{
$Properties = [Ordered]@{
ID = $id
Item = $item
Votes = $votes}
$list2sort += New-Object -TypeName PSObject -Property $Properties
$id++
}
# Starting the loops for each of the voters.
foreach ($voter in $voters)
{
# Defaulting $start variable to $false. It is used for while loop to control key press.
$start = $false
# While loop waiting for voter to hit Enter key.
    while (!$start)  
    {
# Popup message to person.
    echo "$($voter) is voting. Press Enter to start"
# Then console is waiting for key to be pressed.
    $Key = [System.Console]::ReadKey($true)
# Clear the screen.
    clear
# Here is the trick. If you press Enter you start voting.
        if ($Key.Key -eq "Enter")
        {
# Create a dedicated array for items to compare against.
        $list2sort2 = $list2sort
# This one stops while loop above. When you set $start variable to $true, while statement "while (!$start)" is no correct any more and script can continue.
        $start = $true
# Creates a loop for each item in your original list.
            foreach ($item in $list2sort)
            {
# Build array with objects to compare against. One trick to remove yourself from the list. Randomize at the end.
            $list2compare = $list2sort2 | where {$_.Item -ne $item.Item} | sort {Get-Random}
# Then take each items from the list created above and start comparing objects.
                foreach ($thing in $list2compare)
                {
# Simply asking you to choose.
                echo "What do you choose? (Press 1 or 2)"
                echo "1: $($item.Item)"
                echo "2: $($thing.Item)"
# Same logic here as above to control keys. Once you hit a correct button, script continues.
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
                clear
                }
            }
        }
    }
}
# Output the results into console. Fair play.
echo $($list2sort | sort Votes -Descending | ft Item,Votes -AutoSize)
```

## Key things from script

Converting strings into array, parsing by new line:

```powershell
$strings = $strings -split '[\r\n]' | Where { $_ }
```

Randomizing your array:

```powershell
$array = $array | sort {Get-Random}
```

Using `while` and `if` to control what buttons are pressed:

```powershell
$KeyCheck = $false
while (!$KeyCheck)
{
echo "Please press Enter"
$Key = [System.Console]::ReadKey($true)
    if ($Key.Key -eq "Enter")
    {
    echo "Thanks"
    $KeyCheck = $true
    }
}
```