Install-ADDSDomainController `
    -InstallDns `
    -Credential (Get-Credential XDBA\adminusr) `
    -DomainName xdba.exagriddba.com `
    -Force