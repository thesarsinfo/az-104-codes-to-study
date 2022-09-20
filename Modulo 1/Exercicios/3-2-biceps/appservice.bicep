param serverFarmPlan string
param location string
param appServiceName string
param enviromentType string
var appServicePlanSkuName = (enviromentType == 'prod') ? 'P2v3' :'F1'

resource appServicePlan 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: serverFarmPlan
  location: location
  sku: {
    name: appServicePlanSkuName
  }
}
resource appServiceApp 'Microsoft.Web/sites@2022-03-01' = {
  name: appServiceName
  location: location
  properties: {
    serverFarmId: appServicePlan.id
    httpsOnly: true
  }
}
