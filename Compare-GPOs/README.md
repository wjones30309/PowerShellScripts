### Troubleshoot Group Policy issues with PowerShell
The script gets list of GPOs on specified Domain Controlers,  compares UserDSVersion, UserSysvolVersion, ComputerDSVersion and ComputerSysvolVersion attributes and prints if any differences are found.

### Parameters 
#### -FirstDC
Mandatory parameter, which specifies FQDN of first Domain Controller.

#### -SecondDC
Mandatory parameter, which specifies FQDN of second Domain Controller.

#### -DelayInMilliseconds
This optional parameter is used to control CPU usage during script execution.

### Examples
```powershell
.\Compare-GPOs.ps1 -FirstDC DC01.AD.FEDENKO.INFO -SecondDC DC02.AD.FEDENKO.INFO
```
```powershell
.\Compare-GPOs.ps1 -FirstDC DC01.AD.FEDENKO.INFO -SecondDC DC02.AD.FEDENKO.INFO -DelayInMilliseconds 500
```
### Usage
As example I will use Active Directory domain called "AD.FEDENKO.INFO" and 2 domain controllers "DC01"and "DC02".

I will create a test Group Policy called "Test_GPO" as below.
![](https://github.com/vfedenko/PowerShellScripts/blob/master/Compare-GPOs/screen1.jpg)

After some GPO settings amendments you can see that User and Computer versions are changed.
![](https://github.com/vfedenko/PowerShellScripts/blob/master/Compare-GPOs/screen2.jpg)

To simulate a replication issue I will go to the second Domain Controller and remove GPT.ini file.
![](https://github.com/vfedenko/PowerShellScripts/blob/master/Compare-GPOs/screen3.jpg)

As result you will see the User and Computer versions are not available in Group Policy Management console of DC02.
![](https://github.com/vfedenko/PowerShellScripts/blob/master/Compare-GPOs/screen4.jpg)

Compare-GPOs PowerShell script can help to identify such Group Policy objects.
```powershell
.\Compare-GPOs.ps1 -FirstDC DC01.AD.FEDENKO.INFO -SecondDC DC02.AD.FEDENKO.INFO
```
```
DCName                : DC02.AD.FEDENKO.INFO
Id                    : c1acca94-7078-403b-b636-7f9916aa4665
DisplayName           : Test_GPO
Path                  : cn={C1ACCA94-7078-403B-B636-7F9916AA4665},cn=policies,cn=system,DC=AD,DC=FEDENKO,DC=INFO
Owner                 : AD\Domain Admins
CreationTime          : 7/24/2016 4:41:12 PM
ModificationTime      : 7/24/2016 5:04:34 PM
UserDSVersion         : 2
UserSysvolVersion     :
ComputerDSVersion     : 1
ComputerSysvolVersion :
GpoStatus             : AllSettingsEnabled

DCName                : DC01.AD.FEDENKO.INFO
Id                    : c1acca94-7078-403b-b636-7f9916aa4665
DisplayName           : Test_GPO
Path                  : cn={C1ACCA94-7078-403B-B636-7F9916AA4665},cn=policies,cn=system,DC=AD,DC=FEDENKO,DC=INFO
Owner                 : AD\Domain Admins
CreationTime          : 7/24/2016 4:41:12 PM
ModificationTime      : 7/24/2016 5:03:00 PM
UserDSVersion         : 2
UserSysvolVersion     : 2
ComputerDSVersion     : 1
ComputerSysvolVersion : 1
GpoStatus             : AllSettingsEnabled
```
Also there is optional **-DelayInMilliseconds** parameter, which can be used for CPU usage throttling. 
