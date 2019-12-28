Set-Strictmode -Version Latest
$VN = Get-AzVirtualNetwork `
    -Name vnet `
    -ResourceGroupName $resourcegroup

$SUB = Get-AzVirtualNetworkSubnetConfig `
    -Name sub2 `
    -VirtualNetwork $VN

$IP = New-AzNetworkInterfaceIpConfig `
    -Name ipconfig-nic2 `
    -Subnet $SUB
$NIC = New-AzNetworkInterface `
    -Name node1-nic2 `
    -ResourceGroupName $resourcegroup `
    -Location $location `
    -IpConfiguration $IP 

$SG = Get-AzNetworkSecurityGroup `
    -Name priv-sg `
    -ResourceGroupName $resourcegroup 

$NIC.NetworkSecurityGroup = $SG

$NIC | Set-AzNetworkInterface
