Invoke-Command -ScriptBlock {
    $Action = Get-WmiObject -Class CCM_ClientActions -Namespace ROOT\ccm\Policy\Machine\Actualconfig | Select Name,ActionID
    foreach($a in $Action){
        try{
                Write-Host "Running " -NoNewline 
                Write-Host $a.Name -ForegroundColor Yellow -NoNewline
                Write-Host "..."
                [void]([wmiclass]"root/ccm:SMS_Client").TriggerSchedule($a.ActionID)
        }
        catch{}
    }
    $Defaults = @{
    '{00000000-0000-0000-0000-000000000001}' = 'Hardware Inventory'
    '{00000000-0000-0000-0000-000000000002}' = 'Software Inventory'
    '{00000000-0000-0000-0000-000000000003}' = 'Data Discovery Record'
    '{00000000-0000-0000-0000-000000000121}' = 'Application Manager Policy'
    '{00000000-0000-0000-0000-000000000021}' = 'Machine Policy Assignments Request'
    '{00000000-0000-0000-0000-000000000022}' = 'Machine Policy Evaluation'
    }
    Write-Host "Attempting default Microsoft Actions"
    foreach($d in $Defaults.Keys){
        try{
            Write-Host "Running " $Defaults[$d] -ForegroundColor Yellow
            [void]([wmiclass]"root/ccm:SMS_Client").TriggerSchedule($d)
        }
        catch{}
    }
}