. .\utils.ps1

$BackupsPath = "$PSScriptRoot\..\Backups"

if (Test-Path "$BackupsPath\%AppData%") {
    Copy-Item "$BackupsPath\%AppData%\*" "$Env:AppData" -Recurse -Force
}
if (Test-Path "$BackupsPath\%LocalAppData%") {
    Copy-Item "$BackupsPath\%LocalAppData%\*" "$Env:LocalAppData" -Recurse -Force
}
if (Test-Path "$BackupsPath\%ProgramFiles%") {
    Copy-Item "$BackupsPath\%ProgramFiles%\*" "$Env:ProgramFiles" -Recurse -Force
}
if (Test-Path "$BackupsPath\%ProgramFiles(x86)%") {
    Copy-Item "$BackupsPath\%ProgramFiles(x86)%\*" "${Env:ProgramFiles(x86)}" -Recurse -Force
}
