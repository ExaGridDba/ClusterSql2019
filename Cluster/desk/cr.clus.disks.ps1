Set-Strictmode -Version Latest
$DISK = New-AzDiskConfig `
    -Location $location `
    -CreateOption Empty `
    -SkuName Standard_LRS `
    -DiskSizeGB 32

foreach ($nn in 1,2)
{
    foreach ($dn in 1,2,3)
    {
        $diskname = 'node{0}-disk{1}'-f $nn,$dn
        New-AzDisk `
            -ResourceGroupName $resourcegroup `
            -DiskName $diskname `
            -Disk $DISK
    }
}
