function prompt
{
   Write-host('[' + $(get-location) + ']') -NoNewline -foregroundcolor DarkGreen
   Write-host(' >>') -NoNewline -foregroundcolor Red
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
function ncadir { cd C:\Projects\NCA\ }
function kafkadir { cd C:\Kafka\kafka_2.11-2.0.0\bin\windows }
function zkdir { cd C:\Kafka }

VS17

# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}
