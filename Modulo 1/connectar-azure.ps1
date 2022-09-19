#az login
#definir o diretorio a ser acessado
#az account set --subscription "Concierge Subscription"
#procurar assinatura

     az account list `
        --refresh `
        --query "[?contains(name, 'Concierge Subscription')].id" `
        --output table

# az account set --subscription {your subscription ID} do comando acima

#definir grupo de recursos do concierge
#az configure --defaults group=learn-76e419b6-1460-47f7-979e-56fb9fcdc29f

#implantando o modelo proibido
# $TemplateFile="./Templates/storage.json"
# $Today=$(Get-Date -Format "dd-MM-yyyy")
# $DeploymentName="storageTemplate-ErrorRule"+$Today

az deployment group create `
 --name $DeploymentName `
 --template-file $TemplateFile `
 --parameters storageSKU=Standard_GRS `
 storageName=stdevcertmod1001
Template correto
$TemplateFile="./Templates/storage.json"
$Today=$(Get-Date -Format "dd-MM-yyyy")
$DeploymentName="storageTemplate-ErrorRule"+$Today

# az deployment group create `
#  --name $DeploymentName `
#  --template-file $TemplateFile `
#  --parameters storageSKU=Standard_LRS storageName=stdevcertmod1001
