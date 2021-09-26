$specialUsers = @("Administrator")
$authAdmins = Get-Content ..\practice\authadmins.txt
$currentAdmins = Get-LocalGroupMember "Administrators"

# Append the special users to our list of authorized admins
$authAdmins += $specialUsers

# Get the computer name and prepend it to each entry from the authadmins
$computerName = $env:COMPUTERNAME
$authAdmins = $authAdmins | ForEach-Object {"$computerName\$_"}


foreach ($currentAdmin in $currentAdmins) {
  if ($authAdmins -notcontains $currentAdmin) {
    Write-Output "Removing unauthorized administrator: $currentAdmin)"
    Remove-LocalGroupMember -Member $currentAdmin -Group "Administrators"
  }
}