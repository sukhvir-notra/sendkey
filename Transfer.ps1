$OutPutFile 

function EncodeDatFile{

    $Inputfilepath = "C:\Users\sukhvir\Desktop\wget.exe"
    $Script:OutputFile = "C:\Users\sukhvir\Desktop\Encoded.txt"

    [System.Convert]::ToBase64String([System.IO.File]::ReadAllBytes($InputFilePath)) > $OutputFile
}

EncodeDatFile

Sleep 3

# IF $wshell.SendKeys Fails on a Character, Stop. 
$ErrorActionPreference = "Stop"

$wshell = New-Object -ComObject wscript.shell;

# Wshell.AppActivate Type in the Name of the Window you want to .SendKeys Too
$wshell.AppActivate('Untitled - Notepad')

# Obtain Contents of the File you want to send through .SendKey
$derp = Get-Content -Path "$OutputFile"

for ($count=0; $count -lt $derp.Length; $count+=1){
    $stuff=$derp[$count]
    $stuff
    Start-Sleep -Milliseconds 50
    $wshell.SendKeys("$Stuff") 
}

#This will show you all indexes where there is a '+' character. You need to add '+' character to recieved file at those indexes too. You can use something like this $b=$b.Insert(1,'+')

($derp|select-string '\+' -AllMatches).Matches.Index

<#

for ($count=0; $count -lt $one.Length; $count+=1){
    $stuff=$one[$count]
    $stuff2=$two[$count]
    
    if ($stuff -ceq $stuff2){
        Write-Host "$stuff $stuff2"
    }else{
        Write-Host "$stuff $stuff2" -ForegroundColor Red
    }
}
#>