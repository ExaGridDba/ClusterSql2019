Set-Strictmode -Version Latest
New-AzPublicIpAddress `
    -Name dc2-pubip `
    -ResourceGroupName $resourcegroup `
    -AllocationMethod Dynamic `
    -Location $location
