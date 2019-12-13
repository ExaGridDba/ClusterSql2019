$DISK = New-AzDiskConfig `
    -Location EastUS `
    -CreateOption Empty `
    -SkuName Standard_LRS `
    -DiskSizeGB 32

foreach ($nn in 1,2)
{
    foreach ($dn in 1,2,3)
    {
        $diskname = 'node{0}-disk{1}'-f $nn,$dn
        New-AzDisk `
            -ResourceGroupName w19 `
            -DiskName $diskname `
            -Disk $DISK
    }
}