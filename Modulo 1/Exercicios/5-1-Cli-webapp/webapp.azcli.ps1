$RG='rg'
$AppPlan='app'
$WebApp='webapp'
$Enviroment='test'
$Aplication='cert'
$Location='westus3'
$Instance='00'
$RgName = $RG + $Enviroment + $Aplication + $Location 
$AppPlanName = $AppPlan + $Enviroment + $Aplication + $Location + $Instance
$WebAppName = $WebApp + $Enviroment + $Aplication + $Location + $Instance

az group create -n $RgName -l $Location
az appservice plan create -n $AppPlanName -g $RgName -l $Location --sku FREE
az appservice plan list --output table
az webapp create --name $WebAppName -g $RgName --plan $AppPlanName
az webapp list --output table
curl $WebAppName.azurewebsites.net