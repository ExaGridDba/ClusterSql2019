Set-Strictmode -Version Latest
Restart-AzVM -NoWait -ResourceGroupName $resourcegroup -Name dc1
Restart-AzVM -NoWait -ResourceGroupName $resourcegroup -Name dc2