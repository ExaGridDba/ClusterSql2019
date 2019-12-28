Set-Strictmode -Version Latest
$SG = New-AzNetworkSecurityGroup `
    -Name pub-sg `
    -ResourceGroupName $resourcegroup `
    -Location $location

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