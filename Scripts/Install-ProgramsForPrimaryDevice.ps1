. .\utils.ps1

Install-WingetPackage --id=9NTM2QC6QWS7 # Lively Wallpaper
Install-WingetPackage --id=9PC3H3V7Q9CH # Rufus
Install-WingetPackage --id=AndreWiethoff.ExactAudioCopy
Install-WingetPackage --id=AntoineAflalo.SoundSwitch --scope=machine
Install-WingetPackage --id=EFF.Certbot
Install-WingetPackage --id=Melvin-Abraham.Google-Assistant
Invoke-ProgramFromWebpageWithUrlPattern "https://www.cyberpowersystems.com/product/software/power-panel-business/powerpanel-business-windows/" "https://*.cloudfront.net/software/PPB_Windows_v*.exe" # FIXME: https://github.com/microsoft/winget-pkgs/issues/98381
Invoke-ProgramFromWebpageWithUrlPattern "https://freefilesync.org/download.php" "/download/FreeFileSync_*_Windows_Setup.exe" # FIXME: https://github.com/microsoft/winget-pkgs/pull/15309
