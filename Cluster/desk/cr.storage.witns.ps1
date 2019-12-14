New-AzStorageAccount `
    -ResourceGroupName $resourcegroup `
    -Name witns `
    -Location $location `
    -SkuName Standard_RAGRS `
    -Kind StorageV2