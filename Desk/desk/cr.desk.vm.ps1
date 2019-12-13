$nodename = 'desk'

$VM = New-AzVMConfig `
    -VMName $nodename `
    -VMSize Standard_D2_v2

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

$VM | Set-AzVMSourceImage `
    -PublisherName 'MicrosoftWindowsDesktop' `
    -Offer 'windows-10' `
    -Skus '19h2-pro' `
    -Version latest

$VM | Set-AzVMBootDiagnostic `
    -Disable

New-AzVM -ResourceGroupName $resourcegroup `
    -Location $location `
    -AsJob `
    -VM $VM