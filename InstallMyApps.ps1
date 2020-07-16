# Set directory for installation - Chocolatey does not lock
# down the directory if not the default
$InstallDir='C:\ProgramData\chocoportable'
$env:ChocolateyInstall="$InstallDir"

# If your PowerShell Execution policy is restrictive, you may
# not be able to get around that. Try setting your session to
# Bypass.
Set-ExecutionPolicy Bypass

# All install options - offline, proxy, etc at
# https://chocolatey.org/install
iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
# PowerShell 3+?
#iwr https://chocolatey.org/install.ps1 -UseBasicParsing | iex

choco install 7zip.install -y
choco install awscli -y
# choco install ccleaner -y
# choco install curl -y
choco install git.inatall -y
choco install irfanview -y
choco install irfanviewplugins -y
choco install keepass.install -y
choco install notepadplusplus.install -y
choco install powershell -y
choco install putty.install -y
choco install python -y
choco install rvtools -y
choco install sysinternals --params "/InstallDir:C:\admtools\sysinternals"
choco install tightvnc -y
choco install vscode -y
choco install winscp.install -y
# choco install zap -y