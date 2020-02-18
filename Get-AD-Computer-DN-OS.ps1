Import-Module ActiveDirectory
$collection = @()
$list = Read-Host "input file name"
$computers = Get-Content $list
ForEach ($computer in $computers)
{

    $status = @{"Name" = $computer} 
    $group = Get-ADComputer $computer | select distinguishedName
    $status["DN"] = $group
    $OS = Get-ADComputer $computer -properties OperatingSystem | select OperatingSystem
    $status["OS"] = $OS
    New-Object -TypeName PSObject -Property $status -OutVariable serverStatus
    $collection = $collection + $serverStatus
}

$collection | Export-Csv -LiteralPath .\results.csv -NoTypeInformation