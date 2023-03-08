$PathPatternsOfBackupData = @(
    # Firefox
    "$Env:AppData\Mozilla\Firefox\Profiles\*.default\extension-preferences.json"
    "$Env:AppData\Mozilla\Firefox\Profiles\*.default\extensions"
    "$Env:AppData\Mozilla\Firefox\Profiles\*.default\extensions.json"
    "$Env:AppData\Mozilla\Firefox\Profiles\*.default\favicons.sqlite"
    "$Env:AppData\Mozilla\Firefox\Profiles\*.default\formhistory.sqlite"
    "$Env:AppData\Mozilla\Firefox\Profiles\*.default\places.sqlite"
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
    # XnView MP
    "$Env:AppData\XnViewMP\xnview.ini"
    # rclone
    "$Env:AppData\rclone\rclone.conf"
    # qBittorrent
    "$Env:AppData\qBittorrent\qBittorrent.ini"
)

$PathsOfBackupData = `
    Get-Item $PathPatternsOfBackupData -ErrorAction "SilentlyContinue" |
    ForEach-Object { $_.FullName }
