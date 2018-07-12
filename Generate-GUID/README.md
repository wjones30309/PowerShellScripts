### Generate guid using PowerShell

This PowerShell script uses NewGuid() method of the .Net Framework guid class to generate a Globally Unique Identifier. You can generate 1 GUID by running the script or specify how many GUID’s you want.

### Examples
```
.\generate-guid.ps1
3e8c98a5-b352-4fe4-bcec-6ffe51ae8f84
```
```
.\generate-guid.ps1 3
90d92920-f41a-4c3f-86db-516be56edb72
dc9777b7-c3a2-4078-84bc-7fe270b556d6
940033c3-e487-4fd6-ab33-f97201595130
```

### Note
**“.\generate-guid.ps1 0”** will generate 1 GUID.
However **“.\generate-guid.ps1 -1”** will generate infinite GUID’s because  **“$guid++”** will never be a negative. It can be sorted by something like **“-and $howmany -ge 0”**
![](https://github.com/vfedenko/PowerShellScripts/blob/master/Generate-GUID/screen1.png)
