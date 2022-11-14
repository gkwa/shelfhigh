$result = dism.exe /LogPath:c:\dism.log /Online /Enable-Feature /FeatureName:NetFx3 /All /Source:c:\Windows\Temp\sxs /NoRestart /LimitAccess
cat c:\dism.log

