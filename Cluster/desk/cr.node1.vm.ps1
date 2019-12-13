$nodename = node1
$ASET = Get-AzAvailabilitySet `
    -ResourceGroupName w19 `
    -Name clus-aset

$VM = New-AzVMConfig `
    -VMName $nodename `
    -VMSize Standard_DS2_v2 `
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
    -ResourceGroupName w19 `
    -Name ('{0}-nic1' -f $nodename)
$VM | Add-AzVMNetworkInterface `
    -Primary `
    -Id $NIC1.id

$NIC2 = Get-AzNetworkInterface `
    -ResourceGroupName w19 `
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

foreach ($dn in 1,2,3)
{
    $ln = $dn - 1    
    $diskname = ('{0}-disk{1}' -f $nodename,$dn)
    $DISK = Get-AzDisk `
        -DiskName $diskname `
        -ResourceGroupName w19
    $VM | Add-AzVMDataDisk `
        -Name $diskname `
        -CreateOption Attach `
        -Caching 'ReadOnly' `
        -ManagedDiskId $DISK.Id `
        -Lun $ln
}

New-AzVM -ResourceGroupName w19 `
    -AsJob `
    -Location EastUS `
    -VM $VM