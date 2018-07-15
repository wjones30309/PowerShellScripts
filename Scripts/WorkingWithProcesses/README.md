# PowerShell - get Process ID of running service

How to get a Process ID of running service using PowerShell?

```powershell
Get-WmiObject -Class win32_service | where {$_.Name -eq "Service Name"}
```

Example below will show a Process ID of “Task Scheduler” service:

```powershell
Get-WmiObject -Class win32_service | where {$_.Name -eq "Schedule"}
ExitCode  : 0
Name      : Schedule
ProcessId : 11900
StartMode : Auto
State     : Running
Status    : OK
```

Or use more convenient way through Caption property:

```powershell
Get-WmiObject -Class win32_service | where {$_.Caption -eq "Task Scheduler"}
```

Want to kill Task Scheduler process? Note that ID (11900) is taken from example above. This example sometimes can be useful with services, which are in Stop Pending state.

```powershell
Stop-Process 11900 -Force
```

Or even simpler without identifying Process ID, single string syntax:

```powershell
Stop-Process (Get-WmiObject -Class win32_service | where {$_.Name -eq "Schedule"}).ProcessID -Force
```

List of all running services. Example will select only Name, Caption and ID properties:

```powershell
Get-WmiObject -Class win32_service | where {$_.State -eq "Running"} | select Name,Caption,ProcessID
```