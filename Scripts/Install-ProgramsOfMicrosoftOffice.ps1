$TempPath = [System.IO.Path]::GetTempPath()
Invoke-WebRequest "https://officecdn.microsoft.com/pr/wsus/setup.exe" -OutFile "$TempPath\OfficeSetup.exe"
Start-Process "$TempPath\OfficeSetup.exe" "/configure ..\Configurations\OfficeSetup.xml" -Wait
Remove-Item "$TempPath\OfficeSetup.exe"
