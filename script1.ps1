$url = "https://software-download.microsoft.com/download/pr/19042.508.200927-1902.20h2_release_svc_refresh_CLIENTENTERPRISEEVAL_OEMRET_x64FRE_en-us.iso"
$filename = Split-Path -Leaf -Path $url
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$ProgressPreference = 'SilentlyContinue'
Invoke-WebRequest -UseBasicParsing -Uri $url -Outfile $filename
$iso = Join-Path (pwd) $filename
Mount-DiskImage -ImagePath $iso
Get-ChildItem -Recurse d:\sources\sxs | Select-Object -Expand Fullname
