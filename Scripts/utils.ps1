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
    return $Url
}

function Install-WingetPackage {
    winget source update
    winget install --force --accept-package-agreements --accept-source-agreements @Args
}

function Install-MsiPackageFromUrl {
    param (
        [Parameter(Mandatory = $true)][string]$Url
    )

    $MsiUrl = Get-RedirectedUrl $Url
    $MsiPath = "$Env:Temp\$([System.IO.Path]::GetFileName($MsiUrl))"
    Invoke-WebRequest $Url -OutFile $MsiPath
    Start-Process "msiexec" -ArgumentList "/i `"$MsiPath`" /quiet /passive" -Wait
    Remove-Item $MsiPath
}

function Invoke-ProgramFromWebpageWithUrlPattern {
    param (
        [Parameter(Mandatory = $true)][string]$WebpageUrl,
        [Parameter(Mandatory = $true)][string]$ProgramUrlPattern,
        [string]$ReplaceFrom = "",
        [string]$ReplaceTo = ""
    )
    $Webpage = Invoke-WebRequest $WebpageUrl
    $ProgramUrl = $Webpage.Links |
        Where-Object { $_.href -like $ProgramUrlPattern } |
        Select-Object -First 1 -ExpandProperty href
    if ($ProgramUrl.StartsWith("/")) {
        $WebpageAuthority = [System.Uri]::new($WebpageUrl).GetLeftPart([System.UriPartial]::Authority)
        $ProgramUrl = $WebpageAuthority + $ProgramUrl
    }
    if ($ReplaceFrom -ne "" -and $ReplaceTo -ne "") {
        $ProgramUrl = $ProgramUrl.Replace($ReplaceFrom, $ReplaceTo)
    }
    $ProgramUrl = Get-RedirectedUrl $ProgramUrl
    $ProgramPath = "$Env:Temp\$([System.IO.Path]::GetFileName($ProgramUrl))"
    if ($ProgramPath -notmatch "\.exe$") {
        $ProgramPath += ".exe"
    }
    Invoke-WebRequest $ProgramUrl -OutFile $ProgramPath
    Start-Process $ProgramPath -Wait
    # Remove-Item $ProgramPath
}
