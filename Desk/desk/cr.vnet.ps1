﻿$VN = New-AzVirtualNetwork `
    -ResourceGroupName $resourcegroup `
    -Location $location `
    -Name vnet `
    -AddressPrefix 10.0.0.0/8

$VN |Add-AzVirtualNetworkSubnetConfig `
    -Name sub1 `
    -AddressPrefix 10.0.0.0/24

$VN | Set-AzVirtualNetwork