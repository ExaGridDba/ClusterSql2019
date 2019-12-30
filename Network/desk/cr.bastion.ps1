Set-Strictmode -Version Latest
$VN = Get-AzVirtualNetwork `
    -Name vnet `
    -ResourceGroupName $resourcegroup

$PUBIP = New-AzPublicIpAddress `
    -ResourceGroupName $resourcegroup `
    -name bas-pubip `
    -location $location `
    -AllocationMethod Static `
    -Sku Standard

New-AzBastion `
    -ResourceGroupName $resourcegroup `
    -Name bas `
    -PublicIpAddress $PUBIP `
    -VirtualNetwork $VN