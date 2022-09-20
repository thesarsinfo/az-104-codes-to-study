param storageAccountName string
param location string
param enviromentType string
var storageAccountSkuName = (enviromentType == 'prod') ? 'Standard_GRS' :'Standard_LRS'


resource storageAccount 'Microsoft.Storage/storageAccounts@2021-08-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: storageAccountSkuName
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
  }
}
