function prompt
{
   Write-host('[' + $(get-location) + ']') -NoNewline -foregroundcolor DarkYellow `r`n
   Write-host('>>') -NoNewline -foregroundcolor Red
   return " "
}

function Get-Batchfile ($file) {
    $cmd = "`"$file`" & set"
    cmd /c $cmd | Foreach-Object {
        $p, $v = $_.split('=')
        Set-Item -path env:$p -value $v
    }
}

function VS17()
{
    $vs140comntools = "C:\Program Files (x86)\Microsoft Visual Studio\2017\Enterprise\Common7\Tools\"
    $batchFile = [System.IO.Path]::Combine($vs140comntools, "VsDevCmd.bat")
    Get-Batchfile $BatchFile

    [System.Console]::Title = "Visual Studio 2017 Windows PowerShell"
}

# custom shortcuts
function lsd { ls -Directory }

VS17

# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}
