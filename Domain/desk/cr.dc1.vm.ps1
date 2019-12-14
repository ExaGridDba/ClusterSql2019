Set-Strictmode -Version Latest
$nodename = 'dc1'
$ASET = Get-AzAvailabilitySet `
    -ResourceGroupName $resourcegroup `
    -Name dc-aset

$VM = New-AzVMConfig `
    -VMName $nodename `
    -VMSize Standard_DS1_v2 `
    -AvailabilitySetID $ASET.Id

$VM | Set-AzVMOSDisk `
    -Name ('{0}-osdisk' -f $nodename) `
    -StorageAccountType Standard_LRS `
    -CreateOption FromImage

$VM | Set-AzVMOperatingSystem `
    -Credential $CRED `
    -Windows `
    -ComputerName $nodename `
    -ProvisionVMAgent `
    -EnableAutoUpdate

$NIC1 = Get-AzNetworkInterface `
    -ResourceGroupName $resourcegroup `
    -Name ('{0}-nic1' -f $nodename)
$VM | Add-AzVMNetworkInterface `
    -Primary `
    -Id $NIC1.id

$NIC2 = Get-AzNetworkInterface `
    -ResourceGroupName $resourcegroup `
    -Name ('{0}-nic2' -f $nodename)
$VM | Add-AzVMNetworkInterface `
    -Id $NIC2.id

$VM | Set-AzVMSourceImage `
    -PublisherName 'MicrosoftWindowsServer' `
    -Offer 'WindowsServer' `
    -Skus 2019-Datacenter `
    -Version latest

$VM | Set-AzVMBootDiagnostic `
    -Disable

New-AzVM -ResourceGroupName $resourcegroup `
    -AsJob `
    -Location $location `
    -VM $VM
