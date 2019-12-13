New-AzPublicIpAddress `
    -Name node1-pubip `
    -ResourceGroupName $resourcegroup `
    -AllocationMethod Dynamic `
    -Location $location
