. .\utils.ps1

# Install-WingetPackage --id=9N8MHTPHNGVV # Dev Home (Preview)
Install-WingetPackage --id=Anaconda.Miniconda3 --scope=user
Install-WingetPackage --id=Docker.DockerDesktop
Install-WingetPackage --id=GoLang.Go
Install-WingetPackage --id=Google.AndroidStudio
Install-WingetPackage --id=Microsoft.VisualStudioCode --scope=user --interactive
Invoke-WebRequest https://get.pnpm.io/install.ps1 | Invoke-Expression
Push-Location ~
git clone https://github.com/flutter/flutter.git --branch stable
Pop-Location

$PathEnv = [System.Environment]::GetEnvironmentVariable("Path", [System.EnvironmentVariableTarget]::User)
$PathEnv += ";$Env:LocalAppData\Android\Sdk\platform-tools"
$PathEnv += ";$Env:LocalAppData\pnpm" # https://github.com/pnpm/pnpm/issues/5135
$PathEnv += ";$home\flutter\bin"
[System.Environment]::SetEnvironmentVariable("Path", $PathEnv, [System.EnvironmentVariableTarget]::User)

$EdgePath = "${env:ProgramFiles(x86)}\Microsoft\Edge\Application\msedge.exe"
@("CHROME_PATH", "CHROME_EXECUTABLE") | ForEach-Object {
    [System.Environment]::SetEnvironmentVariable($_, $EdgePath, [System.EnvironmentVariableTarget]::Machine)
}
