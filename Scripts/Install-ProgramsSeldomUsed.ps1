. .\utils.ps1

Install-WingetPackage --id=9NXQXXLFST89 # Disney+
Install-WingetPackage --id=9WZDNCRFJ3TJ # Netflix
Install-WingetPackage --id=9P6RC76MSMMJ # Prime Video for Windows
Install-WingetPackage --id=9WZDNCRD2G0J # Sway
Install-WingetPackage --id=9PGJGD53TN86 # WinDbg Preview
Install-WingetPackage --id=9MVVSZK43QQW # draw.io Diagrams
Install-WingetPackage --id=XP8BT8DW290MPQ # Microsoft Teams (work or school)
Install-WingetPackage --id=Audacity.Audacity
Install-WingetPackage --id=Citrix.Workspace # has Microsoft Store version but with limited features
Install-WingetPackage --id=LIGHTNINGUK.ImgBurn # has Microsoft Store version but not offical
Install-WingetPackage --id=Piriform.Recuva --interactive
Install-WingetPackage --id=PrimateLabs.Geekbench.5
Install-WingetPackage --id=PrimateLabs.Geekbench.6
Install-WingetPackage --id=TeamViewer.TeamViewer
Install-WingetPackage --id=Wagnardsoft.DisplayDriverUninstaller
Install-WingetPackage --id=WinSCP.WinSCP --scope=machine
Invoke-ProgramFromWebpageWithUrlPattern "https://www.cheatengine.org/downloads.php" "https://*.cloudfront.net/installer/*" # FIXME: https://github.com/microsoft/winget-pkgs/issues/61767
# FurMark # https://geeks3d.com/furmark/downloads/ # FIXME: https://github.com/microsoft/winget-pkgs/pull/93904
# GoPro VR Player # https://mega.nz/file/81k0HAjI#RfLERA6vXyWGKU7q37e4qQvXfFQ6PFiqy01b85lsNgI
# Ivanti Secure Access Client # https://ndhu.twaren.net # VPN to NDHU
# Locale Remulator # https://github.com/InWILL/Locale_Remulator
