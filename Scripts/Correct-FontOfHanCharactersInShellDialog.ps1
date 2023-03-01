Set-ItemProperty `
    -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\GRE_Initialize" `
    -Name "GUIFont.Facename" `
    -Value "Microsoft JhengHei UI" `
    -Force
Set-ItemProperty `
    -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\FontSubstitutes" `
    -Name "MS Sans Serif" `
    -Value "Microsoft Sans Serif" `
    -Force
$NewLinksOfShellDialogFontToPrepand = @(
    "MSJH.TTC,Microsoft Jhenghei UI,128,96"
    "MSJH.TTC,Microsoft Jhenghei UI"
    "MSYH.TTC,Microsoft YaHei UI,128,96"
    "MSYH.TTC,Microsoft YaHei UI"
    "MEIRYO.TTC,Meiryo UI,128,96"
    "MEIRYO.TTC,Meiryo UI"
    "SIMHEI.TTF,SimHei"
    "MSGOTHIC.TTC, MS UI Gothic"
    "MALGUN.TTF,Malgun Gothic,128,96"
    "MALGUN.TTF,Malgun Gothic"
    "YUGOTHM.TTC,Yu Gothic UI,128,96"
    "YUGOTHM.TTC,Yu Gothic UI"
)
@("MS Shell Dlg", "MS Shell Dlg 2") | ForEach-Object {
    $ShellDialogFont = Get-ItemPropertyValue `
        -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\FontSubstitutes" `
        -Name $_
    $LinksOfShellDialogFont = Get-ItemPropertyValue `
        -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\FontLink\SystemLink" `
        -Name $ShellDialogFont
    $LinksOfShellDialogFont = $NewLinksOfShellDialogFontToPrepand + (
        $LinksOfShellDialogFont | Where-Object { $_ -notin $NewLinksOfShellDialogFontToPrepand }
    )
    Set-ItemProperty `
        -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\FontLink\SystemLink" `
        -Name $ShellDialogFont `
        -Value $LinksOfShellDialogFont `
        -Force
}
