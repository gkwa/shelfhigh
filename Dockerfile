FROM mcr.microsoft.com/windows:1809

ENV CYGWIN=winsymlinks

RUN choco --version
RUN choco feature enable -n allowGlobalConfirmation
RUN choco install cygwin
