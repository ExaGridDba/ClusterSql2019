Set-Strictmode -Version Latest
New-AzAvailabilitySet `
    -ResourceGroupName $resourcegroup `
    -Name dc-aset `
    -PlatformFaultDomainCount 2 `
    -Location $location `
    -Sku Aligned
