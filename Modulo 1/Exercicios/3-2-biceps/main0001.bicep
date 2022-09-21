targetScope= 'subscription'
param rname string = 'rg'
param stoname string = 'sto'
param appservicename string = 'app'
param location string = 'eastus'
param enviroment string = '-dev-cert-${location}' 
param storageAccountName string = '${stoname}devcert${location}'

var appServicePlanName = 'sf${appServiceAppName}${enviroment}plan'
@allowed([
  'dev'
  'prod'
])
param enviromentType string
param appServiceAppName string = '${appservicename}${enviromentType}${appservicename}'

resource rgname 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name:'${rname}${enviromentType}${location}'
  location:location
}
module storage  'storage.bicep' = {
  name: 'storageDeployment'
  scope: rgname
  params: {
    storageAccountName: storageAccountName
    location: location
    enviromentType: enviromentType
    
  }
}
module serverFarm  'serverFarm.bicep' = {
  name: 'serverFarmDeployment'
  scope: rgname
  params: {
    serverFarmPlan: appServicePlanName   
    location: location    
    enviromentType:enviromentType
  }
}
var appPlan = serverFarm.outputs.serverFarmId
module appService  'appservice.bicep' = {
  name: 'AppServiceDeployment'
  scope: rgname
  params: {
    appServiceName: appServiceAppName
    location: location    
    plan: appPlan
  }
}
