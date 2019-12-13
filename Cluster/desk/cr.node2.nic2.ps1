$VN = Get-AzVirtualNetwork `
    -Name vnet `
    -ResourceGroupName w19

$SUB = Get-AzVirtualNetworkSubnetConfig `
    -Name sub2 `
    -VirtualNetwork $VN

$IP = New-AzNetworkInterfaceIpConfig `
    -Name ipconfig-nic2 `
    -Subnet $SUB
$NIC = New-AzNetworkInterface `
    -Name node2-nic2 `
    -ResourceGroupName w19 `
    -Location EastUS `
    -IpConfiguration $IP 

$SG = Get-AzNetworkSecurityGroup `
    -Name priv-sg `
    -ResourceGroupName w19 

$NIC.NetworkSecurityGroup = $SG

$NIC | Set-AzNetworkInterface