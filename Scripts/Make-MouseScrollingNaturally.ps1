Get-ChildItem `
    -Path "HKLM:\SYSTEM\CurrentControlSet\Enum\HID" `
    -Include "Device Parameters" `
    -Recurse `
    -Depth 2 `
    -ErrorAction "SilentlyContinue" |
Select-Object -ExpandProperty PSPath |
Where-Object { (Get-Item $_).Property -Contains "FlipFlopWheel" } |
ForEach-Object { Set-ItemProperty $_ "FlipFlopWheel" 1 }
