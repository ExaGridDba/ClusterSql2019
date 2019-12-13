New-ADGroup -Name DBA `
    -GroupScope Global `
    -DisplayName 'Database Administrators'

Add-ADGroupMember `
    -Identity DBA `
    -Members sqlagent,sqlserver