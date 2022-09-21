param appServiceName string
param location string
param plan string


resource appServiceApp 'Microsoft.Web/sites@2022-03-01' = {
  name: appServiceName
  location: location
  properties: {
    serverFarmId: plan
    httpsOnly: true
  }
}
output appServiceAppHostName string = appServiceApp.properties.defaultHostName
