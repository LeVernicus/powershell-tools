$AddComps | %{Write-Host -ForegroundColor Green "Getting $_ MemberOf Data"
$StringMember = (Get-ADComputer -Identity $_ -Properties *).MemberOf | Sort
foreach ($s in $StringMember){
        $Group = $s.Split(',')[0].TrimEnd(',').Remove(0,3)
        Write-Host -ForegroundColor Yellow $Group
    }
    Write-Host -ForegroundColor Red "Group count is"$StringMember.count"!"
}