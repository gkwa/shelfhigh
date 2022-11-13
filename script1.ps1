function Get-FileIfNotExists {
    Param (
        $Url,
        $Destination
    )

    if (-not (Test-Path $Destination)) {
        [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
        $ProgressPreference = 'SilentlyContinue'

        Write-Verbose "Downloading $Url"
        Invoke-WebRequest -UseBasicParsing -Uri $url -Outfile $Destination
    }
    else {
        Write-Verbose "${Destination} already exists. Skipping."
    }
}

$url = "https://software-download.microsoft.com/download/pr/19042.508.200927-1902.20h2_release_svc_refresh_CLIENTENTERPRISEEVAL_OEMRET_x64FRE_en-us.iso"
$filename = Split-Path -Leaf -Path $url
$fileinfo = New-Object System.IO.FileInfo($filename)
$iso = Join-Path "${HOME}/Downloads" $filename
Get-FileIfNotExists $url $iso
$global:ProgressPreference = "SilentlyContinue"
Mount-DiskImage -ImagePath $iso

New-Item -Type "directory" -Force -Path sxs | Out-Null

for ($test = 0; $test -lt 26; $test++)
{
    $drive=[char](65 + $test)
    $sxs = "${drive}:/sources/sxs"
    If(Test-Path($sxs)){
        Copy-Item -Force -Recurse "${sxs}/*" ./sxs
        Get-ChildItem -Recurse ./sxs | Select-Object -Expand Fullname
        break
    }
}
