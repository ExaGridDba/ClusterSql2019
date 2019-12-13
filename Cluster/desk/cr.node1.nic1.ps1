$VN = Get-AzVirtualNetwork `
    -Name vnet `
    -ResourceGroupName $resourcegroup

$SUB = Get-AzVirtualNetworkSubnetConfig `
    -Name sub1 `
    -VirtualNetwork $VN

$PUBIP = Get-AzPublicIpAddress `
    -Name node1-pubip `
    -ResourceGroupName $resourcegroup

$IP = New-AzNetworkInterfaceIpConfig `
    -Name ipconfig-nic1 `
    -Primary `
    -Subnet $SUB `
    -PublicIpAddress $PUBIP
$NIC = New-AzNetworkInterface `
    -Name node1-nic1 `
    -ResourceGroupName $resourcegroup `
    -Location $location `
    -IpConfiguration $IP 

$SG = Get-AzNetworkSecurityGroup `
    -Name pub-sg `
    -ResourceGroupName $resourcegroup 

$NIC.NetworkSecurityGroup = $SG

$NIC | Set-AzNetworkInterface
