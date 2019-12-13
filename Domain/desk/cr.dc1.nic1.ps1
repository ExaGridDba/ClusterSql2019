$VN = Get-AzVirtualNetwork `
    -Name vnet `
    -ResourceGroupName w19

$SUB = Get-AzVirtualNetworkSubnetConfig `
    -Name sub1 `
    -VirtualNetwork $VN

$PUBIP = Get-AzPublicIpAddress `
    -Name dc1-pubip `
    -ResourceGroupName w19

$IP = New-AzNetworkInterfaceIpConfig `
    -Name ipconfig-nic1 `
    -PrivateIpAddressVersion IPv4 `
    -PrivateIpAddress 10.0.0.254 `
    -Primary `
    -Subnet $SUB `
    -PublicIpAddress $PUBIP
$NIC = New-AzNetworkInterface `
    -Name dc1-nic1 `
    -ResourceGroupName w19 `
    -Location EastUS `
    -IpConfiguration $IP 

$SG = Get-AzNetworkSecurityGroup `
    -Name pub-sg `
    -ResourceGroupName w19 

$NIC.NetworkSecurityGroup = $SG

$NIC | Set-AzNetworkInterface