$input = Read-Host "Input file name"
Import-Module ActiveDirectory
$collection = @()
$computers = Get-Content $input
ForEach ($computer in $computers)
{
    #$serverStatus = Get-ADComputer $computer -Properties memberOf, OperatingSystem | select Name, memberOf, OperatingSystem
    $status = @{"Name" = $computer} 
    $group = Get-ADComputer $computer -Properties memberOf | select -ExpandProperty memberOf
    $status["Group"] = "$group"
    $OS = Get-ADComputer $computer -Properties OperatingSystem | select -ExpandPropert OperatingSystem
    $status["Operating System"] = $OS
    New-Object -TypeName PSObject -Property $status -OutVariable serverStatus
    $collection = $collection + $serverStatus
}

$collection | Out-File result.txt -Width 500