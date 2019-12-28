New-Volume `
    -StoragePoolFriendlyName S2D* `
    -FriendlyName Data `
    -FileSystem CSVFS_NTFS `
    -Size 10GB

New-Volume `
    -StoragePoolFriendlyName S2D* `
    -FriendlyName Log `
    -FileSystem CSVFS_NTFS `
    -Size 10GB

New-Volume `
    -StoragePoolFriendlyName S2D* `
    -FriendlyName Backup `
    -FileSystem CSVFS_NTFS `
    -Size 10GB

Get-ClusterSharedVolume