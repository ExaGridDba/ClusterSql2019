Set-Strictmode -Version Latest
$VN = Get-AzVirtualNetwork `
  -ResourceGroupName $resourcegroup `
  -Name vnet 

$VN.DhcpOptions.DnsServers = `
    '10.0.0.254', '10.0.1.254'

Set-AzVirtualNetwork `
   -VirtualNetwork $VN
