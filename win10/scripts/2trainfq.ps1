$pathToFile = "c:\\users\\lsnart\\Desktop\\Cold Research.txt"
$answerFile = "c:\\users\\$user\\Desktop\\Forensics Question 2.txt"

# Get the ACL of the file
$acl = Get-ACL $pathToFile
# Get the owner and split the name up by "\" to get only the 
# username
$ownerName = $acl.Owner -split "\\"
$ownerName = $ownerName[1]
Write-Output "Found File Owner: $($ownerName)"

# Write the answer out to the forensics question file
$newFileContent = (Get-Content $answerFile) -replace '<Type Answer Here>',$ownerName
Write-Output "Writing answer to: $answerFile"
Set-Content -Path $answerFile -Value $newFileContent
