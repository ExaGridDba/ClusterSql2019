$ASET = Get-AzAvailabilitySet `
    -ResourceGroupName w19 `
    -Name dc-aset

$VM = New-AzVMConfig `
    -VMName dc1 `
    -VMSize Standard_DS1_v2 `
    -AvailabilitySetID $ASET.Id

$VM | Set-AzVMOSDisk `
    -Name dc1-osdisk `
    -StorageAccountType Standard_LRS `
    -CreateOption FromImage

$VM | Set-AzVMOperatingSystem `
    -Credential $CRED `
    -Windows `
    -ComputerName dc1 `
    -ProvisionVMAgent `
    -EnableAutoUpdate

$NIC1 = Get-AzNetworkInterface `
    -ResourceGroupName w19 `
    -Name dc1-nic1
$VM | Add-AzVMNetworkInterface `
    -Primary `
    -Id $NIC1.id

$NIC2 = Get-AzNetworkInterface `
    -ResourceGroupName w19 `
    -Name dc1-nic2
$VM | Add-AzVMNetworkInterface `
    -Id $NIC2.id

$VM | Set-AzVMSourceImage `
    -PublisherName 'MicrosoftWindowsServer' `
    -Offer 'WindowsServer' `
    -Skus 2019-Datacenter `
    -Version latest

$VM | Set-AzVMBootDiagnostic `
    -Disable

New-AzVM -ResourceGroupName w19 `
    -AsJob `
    -Location EastUS `
    -VM $VM