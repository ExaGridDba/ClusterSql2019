﻿Set-Strictmode -Version Latest
New-AzNetworkSecurityGroup `
    -Name priv-sg `
    -ResourceGroupName $resourcegroup `
    -Location $location