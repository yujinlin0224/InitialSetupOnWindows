@(
    "App.StepsRecorder"
    "MathRecognizer"
    "Media.WindowsMediaPlayer"
    "Microsoft.Wallpapers.Extended"
    "Microsoft.Windows.Notepad.System"
    "Microsoft.Windows.PowerShell.ISE"
    "Microsoft.Windows.WordPad"
    "WMIC"
).ForEach({ Get-WindowsCapability -Name "$_~*" -Online | Remove-WindowsCapability -Online })
