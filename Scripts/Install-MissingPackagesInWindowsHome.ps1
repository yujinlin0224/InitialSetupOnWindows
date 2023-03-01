Get-ChildItem @(
    "$Env:SystemRoot\servicing\Packages\*-Containers-*.mum"
    "$Env:SystemRoot\servicing\Packages\Containers-*.mum"
    "$Env:SystemRoot\servicing\Packages\Microsoft-Hyper-V-*.mum"
    "$Env:SystemRoot\servicing\Packages\Microsoft-Windows-GroupPolicy-ClientTools-Package~*.mum"
    "$Env:SystemRoot\servicing\Packages\Microsoft-Windows-GroupPolicy-ClientExtensions-Package~*.mum"
) | ForEach-Object { Dism /Online /NoRestart /Add-Package:"$_" }
