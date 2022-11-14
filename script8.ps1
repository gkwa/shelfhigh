$result = dism.exe /Online /Enable-Feature /FeatureName:NetFx3 /All /NoRestart /LimitAccess /LogPath:c:\dism.log /Source:c:\Windows\Temp\sxs
cat c:\dism.log

