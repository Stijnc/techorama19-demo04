$acrName = "acrtechorama2019"
$gitUser = "Stijnc"



#build the base image
az acr build --registry $acrName -t acrtechorama2019.azurecr.io/powershell:6.1.0-ubuntu-18.04 -f .\Dockerfile-base .

az acr repository show-tags -n $acrName --repository powershell


az acr task create --registry acrtechorama2019 --name baseupdate -t hellotechormama:{{.Run.ID}} --context https://github.com/$gitUser/techorama19-demo04.git --file Dockerfile --git-access-token $env:PAT

az acr task list --registry $acrName

az acr task run --registry $acrName --name baseupdate