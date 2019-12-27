Set-Strictmode -Version Latest
New-Cluster `
    -Name nyc-clus `
    -S2D `
    -Node node1,node2
