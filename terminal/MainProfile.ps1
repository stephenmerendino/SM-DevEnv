$IsTcsh =
    $env:TERM -eq 'cygwin' -or
    $env:OSTYPE -like 'cygwin*' -or
    ($env:PATH -split ';' | Where-Object { $_ -match '\\cygwin\\' })

if ($IsTcsh)
{
    return;
}

$Workspace = "$env:USERPROFILE\Workspace\"

if (Get-Command oh-my-posh -ErrorAction SilentlyContinue)
{
    Set-ExecutionPolicy RemoteSigned
    $OhMyPoshConfigPath = $Workspace + "SM-DevEnv\terminal\gruvbox.omp.json"
    oh-my-posh init pwsh --config $OhMyPoshConfigPath | Invoke-Expression
}

$NDWorkspace = "C:\branches\main"

function Open-Nvim-Workspace {
    nvim $Workspace
}

function Go-To-Work {
    Set-Location $Workspace
}

function Go-To-Kennel {
    Set-Location $NDWorkspace 
}

new-alias -name n nvim
new-alias -name g git
new-alias -name work Go-To-Work
new-alias -name nd Go-To-Kennel
new-alias -name nw Open-Nvim-Workspace 

$VSPath = . "C:\Program Files (x86)\Microsoft Visual Studio\Installer\vswhere.exe" -Latest -Property InstallationPath
$FullCommandPath = $VSPath + "\Common7\Tools\Launch-VsDevShell.ps1"
. $FullCommandPath -Latest -Arch amd64 -HostArch amd64 1>$null
Set-Location -Path $Workspace 

# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}
