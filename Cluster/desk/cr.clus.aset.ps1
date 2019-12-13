New-AzAvailabilitySet `
    -ResourceGroupName w19 `
    -Name clus-aset `
    -PlatformFaultDomainCount 2 `
    -Location EastUS `
    -Sku Aligned