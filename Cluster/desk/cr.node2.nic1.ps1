$VN = Get-AzVirtualNetwork `
    -Name vnet `
    -ResourceGroupName w19

$SUB = Get-AzVirtualNetworkSubnetConfig `
    -Name sub1 `
    -VirtualNetwork $VN

$PUBIP = Get-AzPublicIpAddress `
    -Name node2-pubip `
    -ResourceGroupName w19

$IP = New-AzNetworkInterfaceIpConfig `
    -Name ipconfig-nic1 `
    -Primary `
    -Subnet $SUB `
    -PublicIpAddress $PUBIP
$NIC = New-AzNetworkInterface `
    -Name node2-nic1 `
    -ResourceGroupName w19 `
    -Location EastUS `
    -IpConfiguration $IP 

$SG = Get-AzNetworkSecurityGroup `
    -Name pub-sg `
    -ResourceGroupName w19 

$NIC.NetworkSecurityGroup = $SG

$NIC | Set-AzNetworkInterface