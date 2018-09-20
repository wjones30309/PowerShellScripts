# How to read logs using PowerShell

There is a very useful cmdlet called `Get-Content` also known as `gc`, `cat` or `type` (you can check the aliases on your system by issuing - `Get-Alias -Definition Get-Content` or `(Get-Help cat).Aliases`). This cmdlet gets the content of a specified file.

For example:

```powershell
echo Hello > hello.txt
gc hello.txt
Hello
```

Very convenient parameter `-Wait` can actually keep the file open and check the file every second for any changes and outputs the results with its updates. It is not locking the file for write operations. In combination with `-Tail` parameter, it starts checking only the number of lines from the end of the file. It works only during first run and very useful with a large log files. When the file is updated, all information is shown.

The example below checks last 3 lines of our `hello.txt` file and waits for the updates:

```powershell
cat hello.txt -Last 3 -Wait
Hello Line 2
Hello Line 3
Hello Line 4
```

Hold on one moment. Why did I use `-Last` instead `-Tail` in my command? `Last` is an alias for `Tail` parameter. It can be checked below:

```powershell
(Get-Command Get-Content).ParameterSets.Parameters | where {$_.Name -eq "Tail"} | fl Name,Aliases

Name    : Tail
Aliases : {Last}
```

Or simple way:

```powershell
(Get-Help Get-Content -Parameter Tail).Aliases
Last
```

What if you have a log file and want to monitor only strings with a specific word. You can parse the output using `Select-String` cmdlet. For Example:

```powershell
type hello.txt -Wait | sls Hello

Hello
hEllo
HeLlO
```

Optionally you can use `-CaseSensitive` parameter if required.

```powershell
type hello.txt -Wait | Select-String Hello -CaseSensitive

Hello
```

## Key features learned

How to read logs with PowerShell and parse the output  
How to check cmdlet aliases  
How to check cmdlet parameter aliases