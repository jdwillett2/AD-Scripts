#Script uses a file for input and checks to see if the specified AD group exists
#I opted to use a collection with custom values as the cmdlet didn't give the output I wanted
#outputs to results.csv in the same folder

$collection = @()
$input = Read-Host "Input File Name"
ForEach ($server in (get-content $input)) 

{   $status = @{"Name" = $server}
    Try {
        Get-ADGroup "$server-admin" -ErrorAction Stop
        $status["Exists"] = "Yes"
    }
    Catch {
        $status["Exists"] = "No"
    }
    
    New-Object -TypeName PSObject -Property $status -OutVariable serverStatus
    $collection = $collection + $serverStatus
}
$collection | export-csv results.csv -NoTypeInformation