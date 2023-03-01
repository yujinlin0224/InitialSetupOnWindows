. .\utils.ps1

winget search --id=Microsoft.VCRedist |
Select-String -Pattern "Microsoft\.VCRedist\.\d+\+?\.x\d+"  |
ForEach-Object { Install-WingetPackage $_.Matches.Value }

Install-WingetPackage --id=Microsoft.DirectX
