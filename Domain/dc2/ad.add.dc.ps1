Install-ADDSDomainController `
    -InstallDns `
    -Credential (Get-Credential XDBA\domadm) `
    -DomainName xdba.exagriddba.com `
    -Force
