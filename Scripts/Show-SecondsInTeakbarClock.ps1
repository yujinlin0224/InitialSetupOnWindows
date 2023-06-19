Set-ItemProperty `
    -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" `
    -Name "ShowSecondsInSystemClock" `
    -Value 1 `
    -Force
