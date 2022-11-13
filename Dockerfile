#FROM mcr.microsoft.com/windows/server:10.0.20348.1006
#FROM mcr.microsoft.com/windows/server:10.0.20348.1006-amd64
#FROM mcr.microsoft.com/windows/server:10.0.20348.1129
#FROM mcr.microsoft.com/windows/server:10.0.20348.1129-amd64
#FROM mcr.microsoft.com/windows/server:10.0.20348.1249
#FROM mcr.microsoft.com/windows/server:10.0.20348.1249-amd64
#FROM mcr.microsoft.com/windows/server:10.0.20348.169
#FROM mcr.microsoft.com/windows/server:10.0.20348.169-amd64
#FROM mcr.microsoft.com/windows/server:10.0.20348.230
#FROM mcr.microsoft.com/windows/server:10.0.20348.230-amd64
#FROM mcr.microsoft.com/windows/server:10.0.20348.288
#FROM mcr.microsoft.com/windows/server:10.0.20348.288-amd64
#FROM mcr.microsoft.com/windows/server:10.0.20348.350
#FROM mcr.microsoft.com/windows/server:10.0.20348.350-amd64
#FROM mcr.microsoft.com/windows/server:10.0.20348.405
#FROM mcr.microsoft.com/windows/server:10.0.20348.405-amd64
#FROM mcr.microsoft.com/windows/server:10.0.20348.469
FROM mcr.microsoft.com/windows/server:10.0.20348.469-amd64
#FROM mcr.microsoft.com/windows/server:10.0.20348.473
#FROM mcr.microsoft.com/windows/server:10.0.20348.473-amd64
#FROM mcr.microsoft.com/windows/server:10.0.20348.524
#FROM mcr.microsoft.com/windows/server:10.0.20348.524-amd64
#FROM mcr.microsoft.com/windows/server:10.0.20348.587
#FROM mcr.microsoft.com/windows/server:10.0.20348.587-amd64
#FROM mcr.microsoft.com/windows/server:10.0.20348.643
#FROM mcr.microsoft.com/windows/server:10.0.20348.643-amd64
#FROM mcr.microsoft.com/windows/server:10.0.20348.707
#FROM mcr.microsoft.com/windows/server:10.0.20348.707-amd64
#FROM mcr.microsoft.com/windows/server:10.0.20348.768
#FROM mcr.microsoft.com/windows/server:10.0.20348.768-amd64
#FROM mcr.microsoft.com/windows/server:10.0.20348.825
#FROM mcr.microsoft.com/windows/server:10.0.20348.825-amd64
#FROM mcr.microsoft.com/windows/server:10.0.20348.887
#FROM mcr.microsoft.com/windows/server:10.0.20348.887-amd64
#FROM mcr.microsoft.com/windows/server:ltsc2022
#FROM mcr.microsoft.com/windows/server:ltsc2022-KB5005039
#FROM mcr.microsoft.com/windows/server:ltsc2022-KB5005039-amd64
#FROM mcr.microsoft.com/windows/server:ltsc2022-KB5005575
#FROM mcr.microsoft.com/windows/server:ltsc2022-KB5005575-amd64
#FROM mcr.microsoft.com/windows/server:ltsc2022-KB5006699
#FROM mcr.microsoft.com/windows/server:ltsc2022-KB5006699-amd64
#FROM mcr.microsoft.com/windows/server:ltsc2022-KB5007205
#FROM mcr.microsoft.com/windows/server:ltsc2022-KB5007205-amd64
#FROM mcr.microsoft.com/windows/server:ltsc2022-KB5008223
#FROM mcr.microsoft.com/windows/server:ltsc2022-KB5008223-amd64
#FROM mcr.microsoft.com/windows/server:ltsc2022-KB5009555
#FROM mcr.microsoft.com/windows/server:ltsc2022-KB5009555-amd64
#FROM mcr.microsoft.com/windows/server:ltsc2022-KB5010354
#FROM mcr.microsoft.com/windows/server:ltsc2022-KB5010354-amd64
#FROM mcr.microsoft.com/windows/server:ltsc2022-KB5010796
#FROM mcr.microsoft.com/windows/server:ltsc2022-KB5010796-amd64
#FROM mcr.microsoft.com/windows/server:ltsc2022-KB5011497
#FROM mcr.microsoft.com/windows/server:ltsc2022-KB5011497-amd64
#FROM mcr.microsoft.com/windows/server:ltsc2022-KB5012604
#FROM mcr.microsoft.com/windows/server:ltsc2022-KB5012604-amd64
#FROM mcr.microsoft.com/windows/server:ltsc2022-KB5013944
#FROM mcr.microsoft.com/windows/server:ltsc2022-KB5013944-amd64
#FROM mcr.microsoft.com/windows/server:ltsc2022-KB5014678
#FROM mcr.microsoft.com/windows/server:ltsc2022-KB5014678-amd64
#FROM mcr.microsoft.com/windows/server:ltsc2022-KB5015827
#FROM mcr.microsoft.com/windows/server:ltsc2022-KB5015827-amd64
#FROM mcr.microsoft.com/windows/server:ltsc2022-KB5016627
#FROM mcr.microsoft.com/windows/server:ltsc2022-KB5016627-amd64
#FROM mcr.microsoft.com/windows/server:ltsc2022-KB5017316
#FROM mcr.microsoft.com/windows/server:ltsc2022-KB5017316-amd64
#FROM mcr.microsoft.com/windows/server:ltsc2022-KB5018421
#FROM mcr.microsoft.com/windows/server:ltsc2022-KB5018421-amd64
#FROM mcr.microsoft.com/windows/server:ltsc2022-KB5019081
#FROM mcr.microsoft.com/windows/server:ltsc2022-KB5019081-amd64
#FROM mcr.microsoft.com/windows/server:ltsc2022-amd64
#FROM mcr.microsoft.com/windows/server:win10-21h1-preview

# https://hub.docker.com/_/microsoft-windows-servercore
#FROM mcr.microsoft.com/windows/servercore:20H2-KB5016616
#FROM cirrusci/windowsservercore
#FROM mcr.microsoft.com/windows/nanoserver:1809
#FROM cirrusci/windowsservercore:2019
#FROM mcr.microsoft.com/windows/servercore:ltsc2019
#FROM mcr.microsoft.com/dotnet/framework/sdk
#FROM mcr.microsoft.com/windows/servercore:ltsc2019-amd64
#FROM mcr.microsoft.com/windows/servercore:10.0.18363.1556

RUN cmd /c "md c:\Windows\Temp\sxs"
COPY ./sxs/* /Windows/Temp/sxs/
RUN Get-ChildItem -Recurse c:\Windows\Temp\sxs | Select-Object -Expand Fullname
RUN dism.exe /Online /Enable-Feature /FeatureName:NetFx3 /All /Source:c:\Windows\Temp\sxs /NoRestart /LimitAccess
COPY ./script.ps1 /Windows/Temp/script.ps1
COPY ./script1.ps1 /Windows/Temp/script1.ps1
RUN powershell /Windows/Temp/script.ps1
