$sourceString = Get-Content("C:\temp\params.csv")
$file = "c:\temp\params2.csv"
Add-Content $file $sourceString.split(",")

# Optionally split into $arr
#$arr = $sourceString.split(",")
#$arr
