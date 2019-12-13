$nodename = 'aesk'
$VN = Get-AzVirtualNetwork `
    -Name vnet `
    -ResourceGroupName w19

$SUB = Get-AzVirtualNetworkSubnetConfig `
    -Name sub1 `
    -VirtualNetwork $VN

$PUBIP = Get-AzPublicIpAddress `
    -Name ('{0}-pubip' -f $nodename) `
    -ResourceGroupName w19

$IP = New-AzNetworkInterfaceIpConfig `
    -Name ('{0}-nic1' -f $nodename) `
    -Primary `
    -Subnet $SUB `
    -PublicIpAddress $PUBIP
$NIC = New-AzNetworkInterface `
    -Name (('{0}-nic1' -f $nodename)) `
    -ResourceGroupName w19 `
    -Location EastUS `
    -IpConfiguration $IP 

$SG = Get-AzNetworkSecurityGroup `
    -Name pub-sg `
    -ResourceGroupName w19 

$NIC.NetworkSecurityGroup = $SG

$NIC | Set-AzNetworkInterface