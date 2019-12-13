$Pend  = Get-Item 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Component Based Servicing\RebootPending' -ErrorAction Ignore
if ($Pend -ne $null) {

    Write-Host "Reboot Pending"
}