function prompt
{
   Write-host('[' + $(get-location) + ']') -NoNewline -foregroundcolor DarkGreen
   Write-host(' >>') -NoNewline -foregroundcolor Red
   return " "
}

set-location $home 

# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}
