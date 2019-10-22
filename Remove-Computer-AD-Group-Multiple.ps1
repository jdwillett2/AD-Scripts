$serverlist = Read-host "Input file name"
$Group = Read-host "Security group name"
ForEach ($server in (get-content $serverlist))
{
    $Workingserver = get-adcomputer $server
	Remove-ADGroupMember "$Group" $Workingserver -Confirm:$false
}