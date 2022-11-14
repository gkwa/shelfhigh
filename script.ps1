Set-ExecutionPolicy Bypass -Scope Process -Force
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
choco feature enable -n allowGlobalConfirmation
choco install wixtoolset
$wix_dir = (Get-ChildItem -Recurse C:\Program*\Wix*Toolset*\bin -Filter "heat.exe" | select-object -first 1).Directory.FullName
$env:PATH = "$wix_dir;$env:PATH"
heat
