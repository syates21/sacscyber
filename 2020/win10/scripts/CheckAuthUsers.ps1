$specialusers = @("Administrator", "DefaultAccount", "defaultuser0", "Guest", "WDAGUtilityAccount")
$localusers = Get-LocalUser|select Name
$authusers = Import-Csv ..\practice\authusers.txt
$authusers += Import-Csv ..\practice\authadmins.txt



foreach ($localuser in $localusers) {
  if ($authusers.Name -notcontains $localuser.Name) {
    $unauthUserName = $localuser.Name
    if ($specialusers -notcontains $unauthUserName) {
      Write-Output "Removing unauthorized user: $unauthUserName"
      Remove-LocalUser $unauthUserName
    }
  }
}