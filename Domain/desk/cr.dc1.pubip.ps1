New-AzPublicIpAddress `
    -Name dc1-pubip `
    -ResourceGroupName $resourcegroup `
    -AllocationMethod Dynamic `
    -Location $location
