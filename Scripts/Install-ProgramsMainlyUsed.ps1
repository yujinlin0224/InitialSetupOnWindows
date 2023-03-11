. .\utils.ps1

Install-WingetPackage --id=9NRX63209R7B # Outlook For Windows
Install-WingetPackage --id=Bandisoft.Bandizip # has Microsoft Store version but with limited features
Install-WingetPackage --id=Notepad++.Notepad++
Install-WingetPackage --id=PeterPawlowski.foobar2000 --architecture=x86 # has Microsoft Store version but with limited features
Install-WingetPackage --id=XnSoft.XnViewMP
Install-WingetPackage --id=clsid2.mpc-hc
Install-MsiPackageFromUrl "https://download.mozilla.org/?product=firefox-devedition-msi-latest-ssl&os=win64&lang=zh-TW" # Install-WingetPackage --id=Mozilla.Firefox.DeveloperEdition --locale=zh-TW # FIXME: https://github.com/microsoft/winget-pkgs/issues/97773
Install-WingetPackage --id=Foxit.FoxitReader --interactive

Get-Item "$Env:AppData\Mozilla\Firefox\Profiles\*.*" | ForEach-Object {
    Copy-Item "$PSScriptRoot\..\Modifications\Firefox\WaveFox\chrome" $_ -Force -Recurse # FIXME: https://github.com/QNetITQ/WaveFox/issues/119
    Copy-Item "$PSScriptRoot\..\Modifications\Firefox\Profile\*" $_ -Force -Recurse
}

& "$PSScriptRoot\..\Modifications\MPC-HC\FluentUI-Toolbar\install.bat"
& "$PSScriptRoot\..\Modifications\MPC-HC\KLite-IconLibrary\install.bat"
