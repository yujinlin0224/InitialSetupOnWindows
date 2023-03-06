$PathPatternsOfBackupData = @(
    # Firefox
    "$Env:AppData\Mozilla\Firefox\*.default\cookies.sqlite"
    "$Env:AppData\Mozilla\Firefox\*.default\permissions.sqlite"
    "$Env:AppData\Mozilla\Firefox\*.default\sessionstore.jsonlz4"
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
    "$Env:AppData\SoundSwitch\*.mp3"
    "$Env:AppData\SoundSwitch\SoundSwitchConfiguration.json"
    # qBittorrent
    "$Env:AppData\qBittorrent\categories.json"
    "$Env:AppData\qBittorrent\qBittorrent-data.ini"
    "$Env:LocalAppData\qBittorrent\BT_backup"
)

$PathsOfBackupData = `
    Get-ChildItem $PathPatternsOfBackupData -Recurse -ErrorAction "SilentlyContinue" |
    ForEach-Object { $_.FullName }
