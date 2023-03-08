$PathPatternsOfBackupData = @(
    # Firefox
    "$Env:AppData\Mozilla\Firefox\Profiles\*.default\cookies.sqlite"
    "$Env:AppData\Mozilla\Firefox\Profiles\*.default\permissions.sqlite"
    "$Env:AppData\Mozilla\Firefox\Profiles\*.default\sessionstore.jsonlz4"
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
    "$Env:AppData\SoundSwitch\*.mp3" # FIXME: https://github.com/Belphemur/SoundSwitch/issues/1130
    "$Env:AppData\SoundSwitch\SoundSwitchConfiguration.json"
    # Traffic Monitor
    "$Env:AppData\TrafficMonitor\config.ini"
    "$Env:LocalAppData\\TrafficMonitor\global_cfg.ini"
    # qBittorrent
    "$Env:AppData\qBittorrent\categories.json"
    "$Env:AppData\qBittorrent\qBittorrent-data.ini"
    "$Env:LocalAppData\qBittorrent\BT_backup"
)

$PathsOfBackupData = `
    Get-Item $PathPatternsOfBackupData -ErrorAction "SilentlyContinue" |
    ForEach-Object { $_.FullName }
