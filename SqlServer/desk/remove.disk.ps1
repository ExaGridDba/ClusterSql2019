Set-Strictmode -Version Latest
$VM = Get-AzVM `
    -ResourceGroupName $resourcegroup -Name node2
Remove-AzVMDataDisk `
    -VM $VM `
    -Name node2-disk1
Update-AzVM `
    -ResourceGroupName $resourcegroup `
    -VM $VM