function conda_init {
    $condaEnv = $Env:CONDA_PROMPT_MODIFIER
    $baseEnv = "(base)"
    
    if (!($condaEnv -match $baseEnv)) {
        Write-Host($condaEnv) -NoNewline -foregroundcolor Magenta
    }
}
function prompt {
    conda_init

    $prompt = Write-Prompt "[" -ForegroundColor Cyan
    $prompt += & $GitPromptScriptBlock # ensure posh-git is installed
    $prompt += Write-Prompt "]" -ForegroundColor Cyan
    $prompt += Write-Prompt "`r`n동" -ForegroundColor Red
    if ($prompt) {
        "$prompt "
    }
    else {
        " "
    }
}

function poshgit_init {
    Import-Module posh-git
    $GitPromptSettings.DefaultPromptPath.ForegroundColor = 'Cyan'
    $GitPromptSettings.BranchColor.ForegroundColor = 'Blue'
    $GitPromptSettings.DefaultPromptSuffix = ""
    $GitPromptSettings.BeforeStatus.ForegroundColor = 'Blue'
    $GitPromptSettings.AfterStatus.ForegroundColor = 'Blue'
    $GitPromptSettings.DefaultPromptAbbreviateHomeDirectory = $false
}

function lsd { ls -Directory }
function rbo { ls bin,obj -recurse | rm -confirm -force -recurse }

poshgit_init