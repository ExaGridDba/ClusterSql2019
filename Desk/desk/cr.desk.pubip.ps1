$nodename = 'aesk'
New-AzPublicIpAddress `
    -Name ('{0}-pubip' -f $nodename) `
    -ResourceGroupName w19 `
    -AllocationMethod Dynamic `
    -Location EastUS