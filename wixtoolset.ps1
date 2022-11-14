choco install wixtoolset
$wix_dir = (Get-ChildItem -Recurse C:\Program*\Wix*Toolset*\bin -Filter "heat.exe" | select-object -first 1).Directory.FullName
$env:PATH = "$wix_dir;$env:PATH"
heat1
