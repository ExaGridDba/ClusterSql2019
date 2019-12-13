New-ADUser `
    -Name sqlagent `
    -ChangePasswordAtLogon $false `
    -DisplayName 'SQL Agent' `
    -Enabled $true `
    -AccountPassword ( Get-Credential XDBA\sqlagent).Password