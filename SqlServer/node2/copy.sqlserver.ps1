$srchost = 'node1'
$srcshr = 'c$'
$srcdir = '\Users\domadm.XDBA\Downloads\microsoft\sqlserver\2019'

$src = '\\{0}\{1}{2}' -f $srchost,$srcshr,$srcdir

$dest = 'Downloads\'

Copy-Item -Path $src `
    -Destination $dest `
    -Recurse `
    -Force
