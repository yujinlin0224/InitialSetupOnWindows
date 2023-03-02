function Get-RedirectedUrl {
    param (
        [Parameter(Mandatory = $true)][String]$Url
    )

    $Request = [System.Net.WebRequest]::Create($Url)
    $Request.AllowAutoRedirect = $false
    $Response = $Request.GetResponse()

    If ($Response.StatusCode -eq "Found") {
        return [System.Web.HttpUtility]::UrlDecode($Response.GetResponseHeader("Location"))

    }
}

function Install-WingetPackage {
    winget source update
    winget install --force --accept-package-agreements --accept-source-agreements @Args
}

function Install-MsiPackageFormUrl {
    param (
        [Parameter(Mandatory = $true)][string]$Url
    )

    $MsiUrl = Get-RedirectedUrl $Url
    $MsiPath = "$Env:Temp\$([System.IO.Path]::GetFileName($MsiUrl))"
    Invoke-WebRequest $Url -OutFile $MsiPath
    Start-Process "msiexec" -ArgumentList "/i `"$MsiPath`" /quiet /passive" -Wait
    Remove-Item $MsiPath
}
