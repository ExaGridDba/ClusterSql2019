$nodename = 'desk'
New-AzPublicIpAddress `
    -Name ('{0}-pubip' -f $nodename) `
    -ResourceGroupName $resourcegroup `
    -AllocationMethod Dynamic `
    -Location $location
