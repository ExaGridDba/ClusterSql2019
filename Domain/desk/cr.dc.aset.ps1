New-AzAvailabilitySet `
    -ResourceGroupName w19 `
    -Name dc-aset `
    -PlatformFaultDomainCount 2 `
    -Location EastUS `
    -Sku Aligned