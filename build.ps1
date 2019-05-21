$acrName = "acrtechorama2019"
$gitUser = "Stijnc"



#build the base image
az acr build --registry acrtechorama2019 -t acrtechorama2019.azurecr.io/powershell:6.1.0-ubuntu-18.04 -f .\Dockerfile-base .

az acr repository show-tags -n acrtechorama2019 --repository powershell


az acr task create \
    --registry techorama2019 \
    --name OSupdate \
    --image helloworld:{{.Run.ID}} \
    --arg REGISTRY_NAME=$ACR_NAME.azurecr.io \
    --context https://github.com/$GIT_USER/acr-build-helloworld-node.git \
    --file Dockerfile-app \
    --branch master \
    --git-access-token $env:PAT