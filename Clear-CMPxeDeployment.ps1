# Where $Comps is an array of ComputerName strings to clear PXEs
$Comps | foreach {Clear-CMPxeDeployment -Device (Get-CMDevice -Name $_) -Confirm}