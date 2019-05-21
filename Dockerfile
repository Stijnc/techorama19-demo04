FROM acrtechorama2019.azurecr.io/powershell:6.1.0-ubuntu-18.04

WORKDIR /app

#expose the website
EXPOSE $PORT

#switch user
#start website
ENTRYPOINT ["pwsh", "./Start-Website.ps1" ]
#monitor
HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 CMD [ "pwsh", "-command", "if($(Invoke-WebRequest $('http://localhost:{0}' -f $Env:PORT)).statusCode -ne 200) {exit 1}" ]
