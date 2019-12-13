( ( Get-AzStorageAccountKey `
    -ResourceGroupName w19 `
    -Name witns ) `
    | Where-Object {$_.KeyName -eq "key1"} `
).Value | Set-Clipboard