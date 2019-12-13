$VN = Get-AzVirtualNetwork `
  -ResourceGroupName $resourcegroup `
  -Name vnet 

$VN.DhcpOptions.DnsServers = `
    '10.0.0.254','10.0.1.254', `
    '10.0.0.253','10.0.1.253' 

Set-AzVirtualNetwork `
   -VirtualNetwork $VN
