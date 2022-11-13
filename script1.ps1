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
$basedir = "${HOME}/Downloads"

If(!(Test-Path($basedir))){ New-Item -Type "directory" -Force -Path $basedir | Out-Null; }

$iso = Join-Path $basedir $filename
Get-FileIfNotExists $url $iso
$global:ProgressPreference = "SilentlyContinue"
Mount-DiskImage -ImagePath $iso

$target_dir = "./sxs"
New-Item -Type "directory" -Force -Path $target_dir | Out-Null

for ($iter = 0; $iter -lt 26; $iter++)
{
    $drive=[char](65 + $iter)
    $source = "${drive}:/sources/sxs"

    If(!(Test-Path($source))){
        Continue
    }
    Copy-Item -Force -Recurse "${source}/*" $target_dir
    Get-ChildItem -Recurse $target_dir | Select-Object -Expand Fullname
    break
}
