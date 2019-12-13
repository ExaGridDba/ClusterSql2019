New-AzAvailabilitySet `
    -ResourceGroupName $resourcegroup `
    -Name clus-aset `
    -PlatformFaultDomainCount 2 `
    -Location $location `
    -Sku Aligned
