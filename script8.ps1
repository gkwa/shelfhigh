$result = dism.exe /LogPath:c:\Windows\Temp\dism.log /Online /Enable-Feature /FeatureName:NetFx3 /All /Source:c:\Windows\Temp\sxs /NoRestart /LimitAccess
