@(
    "MicrosoftWindowsPowerShellV2"
    "MicrosoftWindowsPowerShellV2Root"
    "MediaPlayback"
    "WorkFolders-Client"
).ForEach({ Get-WindowsOptionalFeature -FeatureName $_ -Online | Disable-WindowsOptionalFeature -Online -NoRestart })
