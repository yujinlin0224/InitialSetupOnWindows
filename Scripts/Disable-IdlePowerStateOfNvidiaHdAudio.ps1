Get-ChildItem `
    -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Class\{4d36e96c-e325-11ce-bfc1-08002be10318}" `
    -ErrorAction "SilentlyContinue" |
Select-Object -ExpandProperty PSPath |
Where-Object { (Get-Item $_).GetValue("Driver") -eq "nvhda64v.sys" } |
ForEach-Object {
    $RootPath = $_
    $PowerSettingsPath = "$RootPath\PowerSettings"
    Set-ItemProperty $RootPath "PnPCapabilities" 0x00000018 -Force
    Set-ItemProperty $PowerSettingsPath "IdlePowerState" @(0x00, 0x00, 0x00, 0x00) -Force
    Set-ItemProperty $PowerSettingsPath "ConservationIdleTime" @(0xff, 0xff, 0xff, 0xff) -Force
    Set-ItemProperty $PowerSettingsPath "PerformanceIdleTime" @(0xff, 0xff, 0xff, 0xff) -Force
}
