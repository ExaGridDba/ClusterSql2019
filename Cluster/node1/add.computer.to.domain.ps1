Add-Computer `
    -Credential (Get-Credential XDBA\domadm) `
    -Domainname xdba.exagriddba.com `
    -Restart
