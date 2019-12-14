( ( Get-AzStorageAccountKey `
    -ResourceGroupName $resourcegroup `
    -Name witns ) `
    | Where-Object {$_.KeyName -eq "key1"} `
).Value | Set-Clipboard
