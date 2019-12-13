$VN = Get-AzVirtualNetwork `
    -Name vnet `
    -ResourceGroupName w19

$SUB = Get-AzVirtualNetworkSubnetConfig `
    -Name sub2 `
    -VirtualNetwork $VN

$IP = New-AzNetworkInterfaceIpConfig `
    -Name ipconfig-nic2 `
    -PrivateIpAddressVersion IPv4 `
    -PrivateIpAddress 10.0.1.254 `
    -Subnet $SUB
$NIC = New-AzNetworkInterface `
    -Name dc1-nic2 `
    -ResourceGroupName w19 `
    -Location EastUS `
    -IpConfiguration $IP 

$SG = Get-AzNetworkSecurityGroup `
    -Name priv-sg `
    -ResourceGroupName w19 

$NIC.NetworkSecurityGroup = $SG

$NIC | Set-AzNetworkInterface