$encodedString = "WW91IGFyZSBjeWJlciBkZWZlbmRlcnM="
$answerFile = "c:\\users\\$user\\Desktop\\Forensics Question 3.txt"

# Decode string using .NET classes
$decodedString = [System.Text.Encoding]::ASCII.GetString([System.Convert]::FromBase64String($encodedString))


# Write the answer out to the forensics question file
$newFileContent = (Get-Content $answerFile) -replace '<Type Answer Here>',$decodedString
Write-Output "Writing answer to: $answerFile"
Set-Content -Path $answerFile -Value $newFileContent
