$specialusers = @("Administrator", "DefaultAccount", "defaultuser0", "Guest")
$localusers = Get-LocalUser|select Name
$authusers = Import-Csv ..\training\authusers.txt
$authusers += Import-Csv ..\training\authadmins.txt



foreach ($localuser in $localusers) {
  if ($authusers.Name -notcontains $localuser.Name) {
    $unauthUserName = $localuser.Name
    if ($specialusers -notcontains $unauthUserName) {
      Write-Output "Removing unauthorized user: $unauthUserName"
      Remove-LocalUser $unauthUserName
    }
  }
}