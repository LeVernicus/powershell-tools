# Where NewADComp is an array of strings for new Active Directory computers
$NewADComp | ForEach-Object{New-ADComputer -Name $_.Name -SamAccountName $_.SamAccountName -Path "OU=DEFAULT_OU_UNIT,DC=DOMAIN,DC=NET"}