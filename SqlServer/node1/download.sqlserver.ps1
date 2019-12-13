$SK = (Get-AzStorageAccountKey `
    -ResourceGroupName storage `
    -Name blobstorg).Value[0]
 
$CX = New-AzStorageContext `
    -StorageAccountName blobstorg `
    -StorageAccountKey $SK

$buck = 'microsoft/sqlserver/2019/'    
$base = 'SQLServer2019-x64-ENU' 
$dest = 'Downloads/'

$sufs = '.exe','.box'
foreach ($suf in $sufs)
{      
    $file = ( $base + $suf )                       
    Get-AzStorageBlobContent `
        -Container download `
        -Blob ( $buck + $file ) `
        -Destination 'Downloads\' `
        -Context $CX `
        -Force
}