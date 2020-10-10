# Get the list of services we want to disable
$servicesToDisable = Get-Content ..\training\servicestodisable.txt


foreach ($serviceName in $servicesToDisable) {
  Write-Output "Stopping and disabling service: $serviceName"
  Stop-Service -Name $serviceName
  Set-Service -Name $serviceName -StartupType Disabled
}