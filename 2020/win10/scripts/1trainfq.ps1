$pathToFile = "c:\\users\\hwells\\Documents\\Flash_Research.txt"
$user = $env:USERNAME
$answerFile = "c:\\users\\$user\\Desktop\\Forensics Question 1.txt"

# Get the hash of the file
$md5 = Get-FileHash $pathToFile -Algorithm MD5
Write-Output "Found MD5 Hash: $($md5.Hash)"

# Write the answer out to the forensics question file
$newFileContent = (Get-Content $answerFile) -replace '<Type Answer Here>',$md5.Hash
Write-Output "Writing answer to: $answerFile"
Set-Content -Path $answerFile -Value $newFileContent
