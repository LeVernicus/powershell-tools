# Where $Comp is the computer to get Active Directory groups to CSV
Get-ADComputer -Identity $Comp -Properties Name,Memberof `
| Select-Object name, @{n='MemberOf'; e={($_.MemberOf | % {(Get-ADObject $_).Name }) -join ";"}} `
| Sort-Object -Property Name | Export-Csv "C:\User\Foo\CSV_SAVE_PATH_GOES_HERE.csv" -NoTypeInformation -Encoding UTF8