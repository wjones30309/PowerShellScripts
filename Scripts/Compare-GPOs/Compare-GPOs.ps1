[CmdletBinding()]
Param(
 [Parameter(Mandatory=$True)]
 [ValidateNotNull()]
 [String]$FirstDC,

 [Parameter(Mandatory=$True)]
 [ValidateNotNull()]
 [String]$SecondDC,

 [Parameter(Mandatory=$False)]
 [ValidateNotNull()]
 [String]$DelayInMilliseconds
 )

$ErrorActionPreference = "Stop"
$DCList = Get-ADComputer -SearchBase (Get-ADDomain).DomainControllersContainer -Filter * | where {$_.DNSHostName -like $FirstDC -or $_.DNSHostName -like $SecondDC}
$Output = @()
    $C1 = 0
    foreach ($DC in $DCList.DNSHostName) {
        $C1++
        Write-Progress -Activity 'Getting list of GPOs' -PercentComplete (($C1 / ($DCList.DNSHostName).count) * 100) -CurrentOperation $DC
        $GPO = Get-GPO -All -Server $DC
    
    $C2 = 0
    foreach ($GP in $GPO) {   
                $C2++
                Write-Progress -Activity 'Combining into single array from:'$DC -PercentComplete (($C2 / $GPO.count) * 100) -CurrentOperation $GP.DisplayName
    $Properties = @{"DCName"=$DC;
                    "Id"=$GP.Id;
                    "DisplayName"=$GP.DisplayName;
                    "Path"=$GP.Path;
                    "Owner" = $GP.Owner;
                    "CreationTime"=$GP.CreationTime;
                    "ModificationTime"=$GP.ModificationTime;
                    "UserDSVersion"=$GP.User.DSVersion;
                    "UserSysvolVersion"=$GP.User.SysvolVersion;
                    "ComputerDSVersion"=$GP.Computer.DSVersion;
                    "ComputerSysvolVersion"=$GP.Computer.SysvolVersion;
                    "GpoStatus"=$GP.GpoStatus} 
            $Obj = New-Object -TypeName PSObject -Property $Properties
        $Output += $Obj
    }
}
    
    $C1 = 0
    $OC = $Output.count
    foreach ($OutItem in $Output) {   
        $ErrorActionPreference = "SilentlyContinue"
        $C1++
        Write-Progress -Activity 'Comparing the result' -PercentComplete (($C1 / $OC) * 100) -CurrentOperation $OutItem.DisplayName
        if ($DelayInMilliseconds) {Start-Sleep -Milliseconds $DelayInMilliseconds}
        $OutItemToCompare = $Output | where {$_.Id -like $OutItem.Id -and $_.DCName -notlike $OutItem.DCName}
        $CompareMatched = Compare-Object $OutItem $OutItemToCompare -Property UserDSVersion,UserSysvolVersion,ComputerDSVersion,ComputerSysvolVersion
            if ($CompareMatched) {
                $OutItem | select DCName,Id,DisplayName,Path,Owner,CreationTime,ModificationTime,UserDSVersion,UserSysvolVersion,ComputerDSVersion,ComputerSysvolVersion,GpoStatus
                $OutItemToCompare | select DCName,Id,DisplayName,Path,Owner,CreationTime,ModificationTime,UserDSVersion,UserSysvolVersion,ComputerDSVersion,ComputerSysvolVersion,GpoStatus
                $Output = $Output -ne $OutItem; $Output = $Output -ne $OutItemToCompare;
}
            if (!$CompareMatched) {
                $Output = $Output -ne $OutItem; $Output = $Output -ne $OutItemToCompare; 
        
    }
}
