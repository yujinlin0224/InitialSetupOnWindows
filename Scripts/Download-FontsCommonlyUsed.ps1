$TempPath = [System.IO.Path]::GetTempPath()
$FontsPath = [System.IO.Path]::Combine((New-Object -ComObject Shell.Application).NameSpace("shell:Downloads").Self.Path, "Fonts")
New-Item $FontsPath -ItemType "Directory"

function Get-ReleaseDownloadUrlFromGithubRepo {
    param ([string]$Owner, [string]$Repo, [string]$NameMatch)
    $Assets = ((Invoke-WebRequest "https://api.github.com/repos/$Owner/$Repo/releases/latest").Content | ConvertFrom-Json).assets
    return ($Assets | Where-Object { $_.name -Match $NameMatch } | Select-Object -First 1).browser_download_url
}

function Get-ContentDownloadUrlsFromGithubRepo {
    param ([string]$Owner, [string]$Repo, [string]$Path, [string]$NameMatch)
    $Files = (Invoke-WebRequest "https://api.github.com/repos/$Owner/$Repo/contents/$Path").Content | ConvertFrom-Json
    return @($Files | Where-Object { $_.name -Match $NameMatch } | ForEach-Object { $_.download_url })
}

# Fira Code
$DownloadUrl = Get-ReleaseDownloadUrlFromGithubRepo -Owner "tonsky" -Repo "FiraCode" -NameMatch "^Fira_Code_v[\d.]+\.zip$"
$ZipFilePath = [System.IO.Path]::Combine($TempPath, [System.IO.Path]::GetFileName($DownloadUrl))
$DistDirPath = [System.IO.Path]::Combine($TempPath, [System.IO.Path]::GetFileNameWithoutExtension($DownloadUrl))
Invoke-WebRequest $DownloadUrl -OutFile $ZipFilePath
Expand-Archive $ZipFilePath $DistDirPath
Get-ChildItem "$([System.IO.Path]::Combine($DistDirPath, "ttf"))" -File -Filter "*.ttf" | Move-Item -Destination $FontsPath
Remove-Item $ZipFilePath
Remove-Item $DistDirPath -Recurse

# Sarasa Gothic
$7zrUrl = "https://www.7-zip.org/a/7zr.exe"
$7zrFilePath = [System.IO.Path]::Combine($TempPath, [System.IO.Path]::GetFileName($7zrUrl))
Invoke-WebRequest $7zrUrl -OutFile $7zrFilePath
$DownloadUrl = Get-ReleaseDownloadUrlFromGithubRepo -Owner "be5invis" -Repo "Sarasa-Gothic" -NameMatch "^sarasa-gothic-ttc-[\d.]+\.7z$"
# $DownloadUrl = Get-DownloadUrlFromGithubRepo -Owner "be5invis" -Repo "Sarasa-Gothic" -NameMatch "^sarasa-gothic-ttc-unhinted-[\d.]+\.7z$"
$ZipFilePath = [System.IO.Path]::Combine($TempPath, [System.IO.Path]::GetFileName($DownloadUrl))
Invoke-WebRequest $DownloadUrl -OutFile $ZipFilePath
& $7zrFilePath x -y -o"$FontsPath" $ZipFilePath
Remove-Item $ZipFilePath

# Noto Sans CJK
$DownloadUrl = "https://github.com/googlefonts/noto-cjk/raw/main/Sans/SuperOTC/NotoSansCJK.ttc.zip"
$ZipFilePath = [System.IO.Path]::Combine($TempPath, [System.IO.Path]::GetFileName($DownloadUrl))
$DistDirPath = [System.IO.Path]::Combine($TempPath, [System.IO.Path]::GetFileNameWithoutExtension($DownloadUrl))
Invoke-WebRequest $DownloadUrl -OutFile $ZipFilePath
Expand-Archive $ZipFilePath $DistDirPath
Get-ChildItem $DistDirPath -File -Filter "*.ttc" | Move-Item -Destination $FontsPath
Remove-Item $ZipFilePath
Remove-Item $DistDirPath -Recurse

# Noto Serif CJK
$DownloadUrl = "https://github.com/googlefonts/noto-cjk/releases/download/Serif2.001/01_NotoSerifCJK.ttc.zip"
$ZipFilePath = [System.IO.Path]::Combine($TempPath, [System.IO.Path]::GetFileName($DownloadUrl))
$DistDirPath = [System.IO.Path]::Combine($TempPath, [System.IO.Path]::GetFileNameWithoutExtension($DownloadUrl))
Invoke-WebRequest $DownloadUrl -OutFile $ZipFilePath
Expand-Archive $ZipFilePath $DistDirPath
Get-ChildItem $DistDirPath -File -Filter "*.ttc" | Move-Item -Destination $FontsPath
Remove-Item $ZipFilePath
Remove-Item $DistDirPath -Recurse

# Noto Color Emoji
$DownloadUrl = "https://github.com/googlefonts/noto-emoji/raw/main/fonts/NotoColorEmoji_WindowsCompatible.ttf"
# $DownloadUrl = "https://github.com/googlefonts/noto-emoji/raw/main/fonts/NotoColorEmoji.ttf"
# $DownloadUrl = "https://github.com/googlefonts/noto-emoji/raw/main/fonts/Noto-COLRv1.ttf"
# $DownloadUrl = "https://github.com/googlefonts/noto-emoji/raw/main/fonts/Noto-COLRv1-noflags.ttf"
$FontFilePath = [System.IO.Path]::Combine($FontsPath, [System.IO.Path]::GetFileName($DownloadUrl))
Invoke-WebRequest $DownloadUrl -OutFile $FontFilePath

# Noto Sans
$DownloadUrls = Get-ContentDownloadUrlsFromGithubRepo -Owner "notofonts" -Repo "noto-fonts" -Path "hinted/ttf/NotoSans" -NameMatch "^NotoSans-(?!Display).+\.ttf$"
# $DownloadUrls = Get-ContentDownloadUrlsFromGithubRepo -Owner "notofonts" -Repo "noto-fonts" -Path "unhinted/ttf/NotoSans" -NameMatch "^NotoSans-(?!Display).+\.ttf$"
$DownloadUrls | ForEach-Object {
    $FontFilePath = [System.IO.Path]::Combine($FontsPath, [System.IO.Path]::GetFileName($_))
    Invoke-WebRequest $_ -OutFile $FontFilePath
}

# Noto Sans Mono
$DownloadUrls = Get-ContentDownloadUrlsFromGithubRepo -Owner "notofonts" -Repo "noto-fonts" -Path "hinted/ttf/NotoSansMono" -NameMatch "^NotoSansMono-.+\.ttf$"
# $DownloadUrls = Get-ContentDownloadUrlsFromGithubRepo -Owner "notofonts" -Repo "noto-fonts" -Path "unhinted/ttf/NotoSansMono" -NameMatch "^NotoSansMono-.+\.ttf$"
$DownloadUrls | ForEach-Object {
    $FontFilePath = [System.IO.Path]::Combine($FontsPath, [System.IO.Path]::GetFileName($_))
    Invoke-WebRequest $_ -OutFile $FontFilePath
}

# Noto Serif
$DownloadUrls = Get-ContentDownloadUrlsFromGithubRepo -Owner "notofonts" -Repo "noto-fonts" -Path "hinted/ttf/NotoSerif" -NameMatch "^NotoSerif-.+\.ttf$"
# $DownloadUrls = Get-ContentDownloadUrlsFromGithubRepo -Owner "notofonts" -Repo "noto-fonts" -Path "unhinted/ttf/NotoSerif" -NameMatch "^NotoSerif-.+\.ttf$"
$DownloadUrls | ForEach-Object {
    $FontFilePath = [System.IO.Path]::Combine($FontsPath, [System.IO.Path]::GetFileName($_))
    Invoke-WebRequest $_ -OutFile $FontFilePath
}
