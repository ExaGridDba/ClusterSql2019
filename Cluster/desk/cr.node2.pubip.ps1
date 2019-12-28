Set-Strictmode -Version Latest
New-AzPublicIpAddress `
    -Name node2-pubip `
    -ResourceGroupName $resourcegroup `
    -AllocationMethod Dynamic `
    -Location $location
