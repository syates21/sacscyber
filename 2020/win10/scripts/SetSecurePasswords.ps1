$specialusers = @("Administrator", "DefaultAccount", "defaultuser0", "Guest", "WDAGUtilityAccount")
$userName = $env:USERNAME

$specialusers += $userName

$newPassword = Get-Content ..\training\securepw
$securePassword = ConvertTo-SecureString $newPassword -AsPlainText -Force
$users = Get-LocalUser

foreach ($user in $users) {
  if ($specialusers -notcontains $user.Name) {
    Write-Output "Setting password for user: $($user.Name)"
    Set-LocalUser $user -Password $securePassword
  }
}