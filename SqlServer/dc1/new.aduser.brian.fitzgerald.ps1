New-ADUser `
    -Name brian.fitzgerald `
    -ChangePasswordAtLogon $false `
    -DisplayName 'SQL Agent' `
    -Enabled $true `
    -AccountPassword ( Get-Credential XDBA\brian.fitzgerald).Password