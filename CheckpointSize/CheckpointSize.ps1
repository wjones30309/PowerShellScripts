[CmdletBinding()]
Param(
[Parameter()]
[ValidateNotNull()]
[String]$File
)
$VMS = Get-SCVirtualMachine -All
$VMDISK=@()
foreach ($VM in $VMS) {
$VMName = $VM.name 
$VirtualMachineState = $VM.VirtualMachineState 
$VMDISK += Get-SCVirtualHardDisk -VM $VMName | where {$_.Location -like "*.avhd*"} | select @{Name='VMName'; Expression={[String]::join(";", $VMName)}},@{Name='VirtualMachineState'; Expression={[String]::join(";", $VirtualMachineState)}},HostName,Location,@{"Name"="Size (MB)"; "Expression"={[int]($_.Size/1MB)}} 
}
if ($File) {
$VMDISK | sort "Size (MB)" -Descending | export-csv $File
}
else {
$VMDISK | sort "Size (MB)" -Descending | ft -Wrap
}
