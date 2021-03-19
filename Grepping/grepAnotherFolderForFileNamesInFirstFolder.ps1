# Locate any script that is used in the runtime, with the console folder
try{
    New-Item .\searchResults.csv  -ItemType File -Force 
    Add-Content -Value "Filename,Basename,BaseFolder,FoundFileName" -Path .\searchResults.csv

    $linuxScripts = Get-ChildItem -Recurse X:\g\runtime\ebin\linux\
    $winScripts =  Get-ChildItem -Recurse X:\g\runtime\ebin\win

    foreach($linScript in $linuxScripts){
        $list = Get-ChildItem X:\g\configuration-console\ConsoleModuleSolution\Configurators\ -Exclude X:\g\configuration-console\Resources\assembly -Recurse 
            | Select-String $linScript.BaseName -List 
        foreach ($linResult in $list){
            $linBaseName = $linScript.BaseName
            Add-Content -Value "$linScript,$linBaseName,linux,$linResult"   -Path .\searchResults.csv
        }    
    }

    foreach($winScript in $winScripts){
        $list = Get-ChildItem X:\g\configuration-console\ConsoleModuleSolution\Configurators\ -Exclude X:\g\configuration-console\Resources\assembly -Recurse 
            | Select-String $winScript.BaseName -List 
        foreach ($winResult in $list){
            $winBaseName = $winScript.BaseName
            Add-Content -Value "$winScript,$winBaseName,win,$winResult"   -Path .\searchResults.csv
        }    
    }
    Write-Host "File written successfully"
} catch{
    Write-Host "An error occurred: $_.Exception.Message"
    Write-Host $_.ScriptStackTrace
}