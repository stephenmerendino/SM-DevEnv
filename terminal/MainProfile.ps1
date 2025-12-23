Set-ExecutionPolicy RemoteSigned
oh-my-posh init pwsh --config "https://github.com/JanDeDobbeleer/oh-my-posh/blob/main/themes/gruvbox.omp.json" | Invoke-Expression

new-alias -name n nvim
. "C:\Program Files\Microsoft Visual Studio\2022\Community\Common7\Tools\Launch-VsDevShell.ps1" -Latest -Arch amd64 -HostArch amd64
Set-Location -Path $env:USERPROFILE\Workspace

# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}
