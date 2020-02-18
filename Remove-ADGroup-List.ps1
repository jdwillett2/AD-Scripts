$collection = @()
$input = Read-Host "Input File Name"
ForEach ($server in (get-content $input)) 
{   
    $workingserver = Get-ADGroup "$server-Admin"
    Remove-ADObject -Identity $workingserver -Recursive -Confirm:$false -ErrorVariable Result
    $Result | Out-File result.txt -append
    
}
