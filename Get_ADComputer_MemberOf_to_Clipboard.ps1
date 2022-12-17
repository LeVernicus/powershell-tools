Invoke-Command -ScriptBlock {
    [String]$Groups = ''
    Clear-Host
    $Identity = Read-Host -Prompt 'Computer to copy Active Directory groups from'
    $MemberOf = Get-ADComputer -Identity $Identity -Properties Name,Memberof `
    | Select-Object @{Name='MemberOf'; Expression={
    ($_.MemberOf | Sort-Object | ForEach-Object {(Get-ADObject $_).Name }) -join ";"}
    }
    $Listing = $MemberOf.MemberOf `
    | ForEach-Object{$Groups + $_}
    $Listing | Set-Clipboard
    Write-Host "Groups copied to clipboard:"
    foreach($l in $Listing.Split(';')){
        Write-Host -ForegroundColor Green $l
    }
}