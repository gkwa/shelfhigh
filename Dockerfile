# https://hub.docker.com/_/microsoft-windows-servercore
#FROM mcr.microsoft.com/windows/servercore:20H2-KB5016616
#FROM cirrusci/windowsservercore
#FROM mcr.microsoft.com/windows/nanoserver:1809
#FROM cirrusci/windowsservercore:2019
#FROM mcr.microsoft.com/windows/servercore:ltsc2019
#FROM mcr.microsoft.com/dotnet/framework/sdk
FROM mcr.microsoft.com/windows/servercore:ltsc2019-amd64
#FROM mcr.microsoft.com/windows/servercore:10.0.18363.1556

RUN cmd /c "md c:\Windows\Temp\sxs"
COPY ./sxs/* /Windows/Temp/sxs/
RUN dir /s /b c:\Windows\Temp\sxs
RUN dism.exe /Online /Enable-Feature /FeatureName:NetFx3 /All /Source:c:\Windows\Temp\sxs /NoRestart /LimitAccess
COPY ./script.ps1 /Windows/Temp/script.ps1
COPY ./script1.ps1 /Windows/Temp/script1.ps1
RUN powershell /Windows/Temp/script.ps1
