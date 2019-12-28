Set-Strictmode -Version Latest
$VN = New-AzVirtualNetwork `
    -ResourceGroupName $resourcegroup `
    -Location $location `
    -Name vnet `
    -AddressPrefix 10.0.0.0/8

$VN |Add-AzVirtualNetworkSubnetConfig `
    -Name sub1 `
    -AddressPrefix 10.0.0.0/24

$VN | Add-AzVirtualNetworkSubnetConfig `
    -Name sub2 `
    -AddressPrefix 10.0.1.0/24

$VN | Set-AzVirtualNetwork