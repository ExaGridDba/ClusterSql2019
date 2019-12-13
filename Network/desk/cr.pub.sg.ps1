$SG = New-AzNetworkSecurityGroup `
    -Name pub-sg `
    -ResourceGroupName w19 `
    -Location EastUS

$SG | Add-AzNetworkSecurityRuleConfig `
    -Name RDP `
    -Access Allow `
    -Protocol TCP `
    -Direction Inbound `
    -Priority 300 `
    -SourceAddressPrefix * `
    -SourcePortRange * `
    -DestinationAddressPrefix * `
    -DestinationPortRange 3389

$SG | Set-AzNetworkSecurityGroup