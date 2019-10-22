Import-Module ActiveDirectory
$collection = @()
$computers = Get-Content critical.txt
ForEach ($computer in $computers)
{

    $status = @{"Name" = $computer} 
    $group = Get-ADComputer $computer | select distinguishedName
    $status["DN"] = $group
    New-Object -TypeName PSObject -Property $status -OutVariable serverStatus
    $collection = $collection + $serverStatus
}

$collection | Export-Csv -LiteralPath .\results.csv -NoTypeInformation