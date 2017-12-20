# Create 64 Base Hash for a specified loop count
$File = "c:\temp\Users.csv"
#$Pwd = "skw5asFhT#L"
$Pwd = "skw5asFhT#L"
$User = ""
$E = "" # Will be used for encoded string
$line = "" # Used to store the line of the csv file
$n = 100


# Create a comma delimited file
Add-Content $File "User,Authorization"

# Write to that file in a loop
For ($i = 1; $i -le $n; $i++){
    $User = "LT" + $i
    #$PWD = "LT" + $i

    $E = [System.Text.Encoding]::UTF8.GetBytes($User+":"+$Pwd)
    $auth = [System.Convert]::ToBase64String($E)
    $line = $User + "," + $auth
    Add-Content $File $line
}


