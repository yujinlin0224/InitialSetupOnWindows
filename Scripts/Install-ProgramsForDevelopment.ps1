. .\utils.ps1

$WingetPackageIdOfGoLangGo = (
    winget search --id=GoLang.Go |
        Select-String -Pattern "GoLang\.Go\.\d+\.\d+" |
        ForEach-Object { $_.Matches.Value } |
        Sort-Object |
        Select-Object -Last 1
)

Install-WingetPackage --id=Git.Git --interactive
Install-WingetPackage --id=Microsoft.VisualStudioCode --scope=user --interactive
Install-WingetPackage --id=$WingetPackageIdOfGoLangGo
Install-WingetPackage --id=Anaconda.Miniconda3 --scope=user
Install-WingetPackage --id=Google.AndroidStudio
Invoke-WebRequest https://get.pnpm.io/install.ps1 | Invoke-Expression
Push-Location ~
git clone https://github.com/flutter/flutter.git --branch stable
Pop-Location

$PathEnv = [System.Environment]::GetEnvironmentVariable("Path", [System.EnvironmentVariableTarget]::User)
$PathEnv += ";$Env:LocalAppData\Android\Sdk\platform-tools"
$PathEnv += ";$home\flutter\bin"
[System.Environment]::SetEnvironmentVariable("Path", $PathEnv, [System.EnvironmentVariableTarget]::User)

$EdgePath = "${env:ProgramFiles(x86)}\Microsoft\Edge\Application\msedge.exe"
[System.Environment]::SetEnvironmentVariable("CHROME_EXECUTABLE", $EdgePath, [System.EnvironmentVariableTarget]::User)

Install-WingetPackage --id=Docker.DockerDesktop # install at the end due to log out automatically
