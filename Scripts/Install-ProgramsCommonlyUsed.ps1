. .\utils.ps1

Install-WingetPackage --id=Microsoft.DotNet.DesktopRuntime.3_1 # FIXME: required by Mica For Everyone https://github.com/MicaForEveryone/MicaForEveryone/issues/209

Install-WingetPackage --id=9NBLGGH536CC # CrystalDiskMark
Install-WingetPackage --id=9PGCV4V3BK4W # DevToys
Install-WingetPackage --id=9NBLGGH516XP # EarTrumpet
Install-WingetPackage --id=9WZDNCRFJ3PS # Microsoft Remote Desktop
Install-WingetPackage --id=9MSPC6MP8FM4 # Microsoft Whiteboard
Install-WingetPackage --id=9MTFTXSJ9M7F # RoundedTB
Install-WingetPackage --id=9NBLGGH4Z1JC # Speedtest by Ookla
# Install-WingetPackage --id=9P1HQ5TQZMGD # Microsoft Loop # FIXME: just a wrapper of PWA in Microsoft Edge and cannot pin to taskbar properly
# Install-WingetPackage --id=9PF4KZ2VN4W9 # TranslucentTB # FIXME: https://github.com/TranslucentTB/TranslucentTB/issues/537
# Install-WingetPackage --id=9MT60QV066RP # ModernFlyouts # FIXME: https://github.com/ModernFlyouts-Community/ModernFlyouts/issues/1153
# Install-WingetPackage --id=9NBHCS1LX4R0 # paint.net # FIXME: server error https://github.com/microsoft/winget-cli/issues/908
Install-WingetPackage --id=7zip.7zip
Install-WingetPackage --id=AntibodySoftware.WizTree
Install-WingetPackage --id=BandicamCompany.Bandicam
Install-WingetPackage --id=CrystalDewWorld.CrystalDiskInfo.ShizukuEdition
Install-WingetPackage --id=Discord.Discord
Install-WingetPackage --id=FinalWire.AIDA64.Extreme
Install-WingetPackage --id=Google.ChromeRemoteDesktop
Install-WingetPackage --id=ImageMagick.ImageMagick
Install-WingetPackage --id=KDE.KDiff3 --scope=machine
Install-WingetPackage --id=LINE.LINE # has Microsoft Store version but with limited features
Install-WingetPackage --id=MicaForEveryone.MicaForEveryone --scope=machine
Install-WingetPackage --id=Microsoft.PowerToys
Install-WingetPackage --id=Nilesoft.Shell
Install-WingetPackage --id=PeterPawlowski.foobar2000.EncoderPack
Install-WingetPackage --id=QL-Win.QuickLook # has Microsoft Store version but with limited features
Install-WingetPackage --id=Surfshark.Surfshark
Install-WingetPackage --id=qBittorrent.qBittorrent
Install-WingetPackage --id=rcmaehl.MSEdgeRedirect --scope=machine # must to install in admin mode
Invoke-ProgramFromWebpageWithUrlPattern "https://codecguide.com/download_other.htm#mediainfo" "https://files*.codecguide.com/MediaInfoLite*.exe" # FIXME: https://github.com/microsoft/winget-pkgs/issues/98379
# HashCheck # https://github.com/idrassi/HashCheck/releases # FIXME: https://github.com/microsoft/winget-pkgs/issues/99329
# TrafficMonitor # https://github.com/zhongyang219/TrafficMonitor/releases

$Aida64LanguageFile = "${Env:ProgramFiles(x86)}\FinalWire\AIDA64 Extreme\Language\lang_tw.txt"
Copy-Item $Aida64LanguageFile "$Aida64LanguageFile.bak" -Force
Get-Content "$Aida64LanguageFile.bak" -Encoding "big5" | Set-Content $Aida64LanguageFile -Encoding "utf8"

# https://github.com/Cologler/QuickLook.Plugin.TorrentViewer/blob/master/README.md#how-to-use
$QuickLookConfigFile = "$Env:LocalAppData\Programs\QuickLook\QuickLook.exe.config"
$QuickLookConfigFileContent = [xml](Get-Content $QuickLookConfigFile)
$QuickLookConfigFileContent.SelectSingleNode("/configuration/runtime").AppendChild(
    $QuickLookConfigFileContent.ImportNode(([xml]'
        <assemblyBinding xmlns="urn:schemas-microsoft-com:asm.v1">
        <dependentAssembly>
            <assemblyIdentity name="System.Buffers" publicKeyToken="cc7b13ffcd2ddd51" culture="neutral" />
            <bindingRedirect oldVersion="0.0.0.0-4.0.3.0" newVersion="4.0.3.0"/>
        </dependentAssembly>
        </assemblyBinding>
    ').DocumentElement, $true)
)
$QuickLookConfigFileContent.Save($QuickLookConfigFile)

$PathEnv = [System.Environment]::GetEnvironmentVariable("Path", [System.EnvironmentVariableTarget]::Machine)
$PathEnv += ";${Env:ProgramFiles(x86)}\foobar2000\encoders"
[System.Environment]::SetEnvironmentVariable("Path", $PathEnv, [System.EnvironmentVariableTarget]::Machine)
