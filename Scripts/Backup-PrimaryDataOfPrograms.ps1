$PathPatternsOfBackupData = @(
    # Firefox
    "$Env:AppData\Mozilla\Firefox\*.default\favicons.sqlite"
    "$Env:AppData\Mozilla\Firefox\*.default\formhistory.sqlite"
    "$Env:AppData\Mozilla\Firefox\*.default\places.sqlite"
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
    "$Env:AppData\Notepad++\userDefineLangs"
    "$Env:ProgramFiles\Notepad++\plugins"
    # Traffic Monitor
    "$Env:AppData\TrafficMonitor\config.ini"
    # XnView MP
    "$Env:AppData\XnViewMP\xnview.ini"
    # rclone
    "$Env:AppData\rclone\rclone.conf"
    # qBittorrent
    "$Env:AppData\qBittorrent\qBittorrent.ini"
)

$PathsOfBackupData = `
    Get-ChildItem $PathPatternsOfBackupData -Recurse -ErrorAction "SilentlyContinue" |
    ForEach-Object { $_.FullName }
