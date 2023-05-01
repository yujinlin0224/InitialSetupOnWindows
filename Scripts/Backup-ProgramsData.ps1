. .\utils.ps1

$PathPatternsOfProgramsDataToBackup = @{
    "Primary"   = @(
        # Firefox
        "$Env:AppData\Mozilla\Firefox\Profiles\*.*\extension-preferences.json"
        "$Env:AppData\Mozilla\Firefox\Profiles\*.*\extensions"
        "$Env:AppData\Mozilla\Firefox\Profiles\*.*\extensions.json"
        "$Env:AppData\Mozilla\Firefox\Profiles\*.*\favicons.sqlite"
        "$Env:AppData\Mozilla\Firefox\Profiles\*.*\formhistory.sqlite"
        "$Env:AppData\Mozilla\Firefox\Profiles\*.*\places.sqlite"
        "$Env:AppData\Mozilla\Firefox\installs.ini"
        "$Env:AppData\Mozilla\Firefox\profiles.ini"
        # Foobar2000
        "$Env:AppData\foobar2000\*.sf*"
        "$Env:AppData\foobar2000\configuration"
        "$Env:AppData\foobar2000\theme.fth"
        "$Env:AppData\foobar2000\user-components"
        # Notepad++
        "$Env:AppData\Notepad++\config.xml"
        "$Env:AppData\Notepad++\plugins"
        "$Env:AppData\Notepad++\themes"
        "$Env:ProgramFiles\Notepad++\plugins"
        # QuickLook
        "$Env:AppData\pooi.moe\QuickLook\QuickLook.Plugin"
        # Traffic Monitor
        "$Env:AppData\TrafficMonitor\config.ini"
        "$Env:LocalAppData\TrafficMonitor\global_cfg.ini"
        "$Env:LocalAppData\TrafficMonitor\plugins"
        # XnView MP
        "$Env:AppData\XnViewMP\xnview.ini"
        # rclone
        "$Env:AppData\rclone\rclone.conf"
        # qBittorrent
        "$Env:AppData\qBittorrent\qBittorrent.ini"
    )
    "Secondary" = @(
        # Firefox
        "$Env:AppData\Mozilla\Firefox\Profiles\*.*\cookies.sqlite"
        "$Env:AppData\Mozilla\Firefox\Profiles\*.*\permissions.sqlite"
        "$Env:AppData\Mozilla\Firefox\Profiles\*.*\sessionstore.jsonlz4"
        # FreeFileSync
        "$Env:AppData\FreeFileSync"
        # Foobar2000
        "$Env:AppData\foobar2000\index-data"
        "$Env:AppData\foobar2000\playlists-v*"
        # Google Assistant
        "$Env:AppData\Google Assistant\client_secret_*.apps.googleusercontent.com.json"
        "$Env:AppData\Google Assistant\config.json"
        "$Env:AppData\Google Assistant\tokens.json"
        # Line
        "$Env:LocalAppData\LINE\Data"
        # Notepad++
        "$Env:AppData\Notepad++\backup"
        "$Env:AppData\Notepad++\session.xml"
        # SoundSwitch
        "$Env:AppData\SoundSwitch\SoundSwitchConfiguration.json"
        # qBittorrent
        "$Env:AppData\qBittorrent\categories.json"
        "$Env:AppData\qBittorrent\qBittorrent-data.ini"
        "$Env:LocalAppData\qBittorrent\BT_backup"
        # Start Menu
        "$Env:LocalAppData\Packages\Microsoft.Windows.StartMenuExperienceHost_cw5n1h2txyewy\LocalState\start*.bin"
    )
}

function Get-BackupPath {
    param (
        [Parameter(Mandatory = $true)][string]$Path
    )

    $BackupsPath = "$PSScriptRoot\..\Backups"

    if ($Path.StartsWith("$Env:AppData\")) {
        return $Path.Replace("$Env:AppData\", "$BackupsPath\%AppData%\")
    }
    if ($Path.StartsWith("$Env:LocalAppData\")) {
        return $Path.Replace("$Env:LocalAppData\", "$BackupsPath\%LocalAppData%\")
    }
    if ($Path.StartsWith("$Env:ProgramFiles\")) {
        return $Path.Replace("$Env:ProgramFiles\", "$BackupsPath\%ProgramFiles%\")
    }
    if ($Path.StartsWith("${Env:ProgramFiles(x86)}\")) {
        return $Path.Replace("${Env:ProgramFiles(x86)}\", "$BackupsPath\%ProgramFiles(x86)%\")
    }
}

Get-Item $PathPatternsOfProgramsDataToBackup[$Args[0]] -ErrorAction "SilentlyContinue" |
    ForEach-Object {
        if ($_.DirectoryName -ne $null) {
            New-Item (Get-BackupPath $_.DirectoryName) -ItemType Directory -Force
        }
        Copy-Item $_.FullName (Get-BackupPath $_.FullName) -Recurse -Force
    }
