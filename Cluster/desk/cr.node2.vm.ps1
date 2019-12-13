$ASET = Get-AzAvailabilitySet `
    -ResourceGroupName w19 `
    -Name clus-aset

$VM = New-AzVMConfig `
    -VMName node2 `
    -VMSize Standard_DS2_v2 `
    -AvailabilitySetID $ASET.Id

$VM | Set-AzVMOSDisk `
    -Name node2-osdisk `
    -StorageAccountType Standard_LRS `
    -CreateOption FromImage

$VM | Set-AzVMOperatingSystem `
    -Credential $CRED `
    -Windows `
    -ComputerName node2 `
    -ProvisionVMAgent `
    -EnableAutoUpdate

$NIC1 = Get-AzNetworkInterface `
    -ResourceGroupName w19 `
    -Name node2-nic1
$VM | Add-AzVMNetworkInterface `
    -Primary `
    -Id $NIC1.id

$NIC2 = Get-AzNetworkInterface `
    -ResourceGroupName w19 `
    -Name node2-nic2
$VM | Add-AzVMNetworkInterface `
    -Id $NIC2.id

$VM | Set-AzVMSourceImage `
    -PublisherName 'MicrosoftWindowsServer' `
    -Offer 'WindowsServer' `
    -Skus 2019-Datacenter `
    -Version latest

$VM | Set-AzVMBootDiagnostic `
    -Disable

$DISK1 = Get-AzDisk `
    -DiskName node2-disk1 `
    -ResourceGroupName w19
$VM | Add-AzVMDataDisk `
    -Name node2-disk1 `
    -CreateOption Attach `
    -Caching 'ReadOnly' `
    -ManagedDiskId $DISK1.Id `
    -Lun 0

$DISK2 = Get-AzDisk `
    -DiskName node2-disk2 `
    -ResourceGroupName w19
$VM | Add-AzVMDataDisk `
    -Name node2-disk2 `
    -CreateOption Attach `
    -Caching 'ReadOnly' `
    -ManagedDiskId $DISK2.Id `
    -Lun 1

$DISK3 = Get-AzDisk `
    -DiskName node2-disk3 `
    -ResourceGroupName w19
$VM | Add-AzVMDataDisk `
    -Name node2-disk3 `
    -CreateOption Attach `
    -Caching 'ReadOnly' `
    -ManagedDiskId $DISK3.Id `
    -Lun 2

New-AzVM -ResourceGroupName w19 `
    -AsJob `
    -Location EastUS `
    -VM $VM