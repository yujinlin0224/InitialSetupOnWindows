. .\utils.ps1

Install-WingetPackage --id=9NRX63209R7B # Outlook For Windows
Install-WingetPackage --id=Bandisoft.Bandizip # has Microsoft Store version but with limited features
Install-WingetPackage --id=Notepad++.Notepad++
Install-WingetPackage --id=PeterPawlowski.foobar2000 --architecture=x86 # has Microsoft Store version but with limited features
Install-WingetPackage --id=XnSoft.XnViewMP
Install-WingetPackage --id=clsid2.mpc-hc
Install-MsiPackageFormUrl "https://download.mozilla.org/?product=firefox-devedition-msi-latest-ssl&os=win64&lang=zh-TW" # Install-WingetPackage --id=Mozilla.Firefox.DeveloperEdition --locale=zh-TW # FIXME: https://github.com/microsoft/winget-pkgs/issues/97773
Install-WingetPackage --id=Foxit.FoxitReader --interactive
# Locale Remulator # https://github.com/InWILL/Locale_Remulator
