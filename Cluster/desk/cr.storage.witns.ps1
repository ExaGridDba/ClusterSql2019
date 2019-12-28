Set-Strictmode -Version Latest
New-AzStorageAccount `
    -ResourceGroupName $resourcegroup `
    -Name witns `
    -Location $location `
    -SkuName Standard_LRS `
    -Kind StorageV2