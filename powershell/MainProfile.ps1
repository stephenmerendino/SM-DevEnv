$IsTcsh =
    $env:TERM -eq 'cygwin' -or
    $env:OSTYPE -like 'cygwin*' -or
    ($env:PATH -split ';' | Where-Object { $_ -match '\\cygwin\\' })

if ($IsTcsh)
{
    return;
}

$PlayWorkspace = "$env:USERPROFILE\Workspace\"
$NDWorkspace = "C:\branches\main"

if (Get-Command oh-my-posh -ErrorAction SilentlyContinue)
{
    Set-ExecutionPolicy RemoteSigned
    $OhMyPoshConfigPath = $PlayWorkspace + "SM-DevEnv\powershell\gruvbox.omp.json"
    oh-my-posh init pwsh --config $OhMyPoshConfigPath | Invoke-Expression
}

function Open-Nvim-Workspace {
    nvim $PlayWorkspace
}

function Go-Home-Dir {
    Set-Location $env:USERPROFILE
}

function Go-Play-Workspace {
    Set-Location $PlayWorkspace
}

function Go-ND-Workspace {
    Set-Location $NDWorkspace 
}

function Start-Nd-Shell {
    c:\ndibin\cygwin\bin\tcsh -l
}

new-alias -name n nvim
new-alias -name g git
new-alias -name me Go-Home-Dir
new-alias -name play Go-Play-Workspace
new-alias -name work Go-ND-Workspace
new-alias -name ndstart Start-Nd-Shell
new-alias -name nw Open-Nvim-Workspace 

$VSPath = . "C:\Program Files (x86)\Microsoft Visual Studio\Installer\vswhere.exe" -Latest -Property InstallationPath
$FullVSCommandPath = $VSPath + "\Common7\Tools\Launch-VsDevShell.ps1"
. $FullVSCommandPath -Latest -Arch amd64 -HostArch amd64 1>$null
Go-Play-Workspace

# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}
