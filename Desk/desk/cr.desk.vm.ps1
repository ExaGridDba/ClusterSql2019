$nodename = 'aesk'
$ASET = Get-AzAvailabilitySet `
    -ResourceGroupName w19 `
    -Name clus-aset

$VM = New-AzVMConfig `
    -VMName $nodename `
    -VMSize Standard_D2_v2 `
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

$VM | Set-AzVMSourceImage `
    -PublisherName 'MicrosoftWindowsDesktop' `
    -Offer 'windows-10' `
    -Skus '19h2-pro' `
    -Version latest

$VM | Set-AzVMBootDiagnostic `
    -Disable

New-AzVM -ResourceGroupName w19 `
    -Location EastUS `
    -AsJob `
    -VM $VM

