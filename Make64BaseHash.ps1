# Create 64 Base Hash for a specified loop count
$File = "c:\temp\MyUsers.csv"
$n = 100

# Create a comma delimited file
Add-Content $File "User,Authorization"

# Write to that file in a loop
For ($i = 1; $i -le $n; $i++){
    $User = "LT" + $i
    $PWD = "LT" + $i

    $bytes = [System.Text.Encoding]::UTF8.GetBytes($User+":"+$Pwd)
    $encodedText = [Convert]::ToBase64String($bytes)
    $line = $User + ",Basic " + $encodedText
    Add-Content $File $line
    #Write-Host $line

    # Example of decoding
    $decodedText = [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String($encodedText))
    write-host $decodedText
}

