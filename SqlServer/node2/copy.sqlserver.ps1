$srchost = 'node1'
$srcshr = 'c$'
$srcdir = '\Users\adminusr.XDBA\Downloads\microsoft\sqlserver\2019'

$src = '\\{0}\{1}{2}' -f $srchost,$srcshr,$srcdir

$dest = 'Downloads\'

Copy-Item -Path $src `
    -Destination $dest `
    -Recurse -Force