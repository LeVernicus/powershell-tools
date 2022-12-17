$AddComps | ForEach-Object {
$CMDevice = (Get-CMDevice -Name $_)
Write-Host $CMDevice.Name "is" $CMDevice.MacAddress
}