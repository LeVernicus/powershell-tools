$Groups = (Get-ADGroup -Filter {Name -like 'APP_440_LanSchool*'} -Properties *).Name
$ADMembers = @()
foreach ($g in $Groups){
    try{
        $StringMembers = (Get-ADGroup -Identity $g -Properties Members).Members.Substring(3,15)
    }
    catch {}
        foreach ($s in $StringMembers){
            try{
                $ADMembers += (Get-ADComputer -Identity $s -Properties SamAccountName).SamAccountName
            }
            catch{}
        }
    try{
    Remove-ADGroupMember -Identity $g -Members $ADMembers -Confirm:$true 
    }
    catch{}
}