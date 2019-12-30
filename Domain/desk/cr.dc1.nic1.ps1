Set-Strictmode -Version Latest
$VN = Get-AzVirtualNetwork `
    -Name vnet `
    -ResourceGroupName $resourcegroup

$SUB = Get-AzVirtualNetworkSubnetConfig `
    -Name sub1 `
    -VirtualNetwork $VN

$PUBIP = Get-AzPublicIpAddress `
    -Name dc1-pubip `
    -ResourceGroupName $resourcegroup

$IP = New-AzNetworkInterfaceIpConfig `
    -Name ipconfig-nic1 `
    -PrivateIpAddressVersion IPv4 `
    -PrivateIpAddress 10.0.0.254 `
    -Primary `
    -Subnet $SUB `
    -PublicIpAddress $PUBIP
$NIC = New-AzNetworkInterface `
    -Name dc1-nic1 `
    -ResourceGroupName $resourcegroup `
    -Location $location `
    -IpConfiguration $IP 

$SG = Get-AzNetworkSecurityGroup `
    -Name pub-sg `
    -ResourceGroupName $resourcegroup 

$NIC.NetworkSecurityGroup = $SG

$NIC | Set-AzNetworkInterface