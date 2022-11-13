# https://hub.docker.com/_/microsoft-windows-servercore
# mcr.microsoft.com/windows/servercore 20H2-KB5016616
#FROM mcr.microsoft.com/windows/servercore:20H2-KB5016616
FROM mcr.microsoft.com/windows/nanoserver:1809
#FROM cirrusci/windowsservercore:2019
#FROM mcr.microsoft.com/windows/servercore:ltsc2019
#FROM mcr.microsoft.com/dotnet/framework/sdk
#FROM mcr.microsoft.com/windows/servercore:ltsc2019-amd64
#FROM mcr.microsoft.com/windows/servercore:10.0.18363.1556

RUN powershell -c 'New-Item -Type "directory" -Force -Path /Windows/Temp/sxs'
COPY ./sxs/* /Windows/Temp/sxs/
RUN dism.exe /Online /Enable-Feature /FeatureName:NetFx3 /All /Source:c:\Windows\Temp\sxs /NoRestart /LimitAccess
RUN powershell -c Get-ChildItem -Recurse c:\Windows\Temp\sxs
COPY ./script.ps1 /Windows/Temp/script.ps1
COPY ./script1.ps1 /Windows/Temp/script1.ps1
RUN powershell /Windows/Temp/script.ps1
