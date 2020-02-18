ForEach ($server in (get-content "serverlist.txt")) 
{   
    $workingserver = Get-ADComputer $server
    Remove-ADObject -Identity $workingserver -Recursive -Confirm:$false
}