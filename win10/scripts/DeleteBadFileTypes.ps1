$badExtensions = Get-Content ..\training\badextensions.txt

foreach ($ext in $badExtensions) {
  Write-Output "Removing all files with extension $ext"
  ls c:\users\*.$ext -Recurse | foreach {Remove-Item -Path $_.FullName}
}