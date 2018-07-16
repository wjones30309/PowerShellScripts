# PowerShell - Session Recording

How to store all typed commands and their output to a file?

There is Start-Transcript cmdlet, which allows to do that. Example below will store all the output to Log.txt file.

```powershell
Start-Transcript -Path C:\Scripts\Log.txt
Transcript started, output file is C:\Scripts\Log.txt
```

Afterwards run `Get-Date` cmdlet to test.

```powershell
Get-Date

Thursday, July 27, 2017 8:36:53 PM
```

Then Stop-Transcript to stop storing the session output.

```powershell
Stop-Transcript
Transcript stopped, output file is C:\Scripts\Log.txt
```

Navigate to Log.txt file location and check the results or use Get-Content cmdlet.

```powershell
PS C:\> Get-Content C:\Scripts\Log.txt
**********************
Windows PowerShell transcript start
Start time: 20170727203647
Username: COMPUTERNAME\Administrator
RunAs User: COMPUTERNAME\Administrator
Machine: COMPUTERNAME (Microsoft Windows NT 6.2.9200.0)
Host Application: C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe
Process ID: 11420
**********************
Transcript started, output file is C:\Scripts\Log.txt

PS C:\> Get-Date

Thursday, July 27, 2017 8:36:53 PM



PS C:\> Stop-Transcript
**********************
Windows PowerShell transcript end
End time: 20170727203656
**********************
```

Log file contains all recording including useful information such as transcript start and end time, computer and user name, process ID and operating system version.