# PowerShell - Working with archives

## Usage

```powershell
.\PSZip.ps1 -Action Archive -Source C:\Folder1 -Destination C:\Folder1.zip
.\PSZip.ps1 -Action Extract -Source C:\Folder1.zip -Destination C:\Folder1-unzipped
```

## Script syntax

```powershell
 [CmdletBinding()]
Param(
 [Parameter(Mandatory=$True)]
 [ValidateSet('Archive','Extract')]
 [String]$Action,

 [Parameter(Mandatory=$True)]
 [ValidateNotNull()]
 [String]$Source,

 [Parameter(Mandatory=$True)]
 [ValidateNotNull()]
 [String]$Destination
 )
 Add-Type -AssemblyName System.IO.Compression.FileSystem
    if ($Action -like "Archive") {
[io.compression.zipfile]::CreateFromDirectory($Source,$Destination)
}

    if ($Action -like "Extract") {
[io.compression.zipfile]::ExtractToDirectory($Source,$Destination)
}
```