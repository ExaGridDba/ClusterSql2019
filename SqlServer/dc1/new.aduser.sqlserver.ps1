New-ADUser `
    -Name sqlserver `
    -ChangePasswordAtLogon $false `
    -DisplayName 'SQL Server' `
    -Enabled $true `
    -AccountPassword ( Get-Credential XDBA\sqlserver).Password