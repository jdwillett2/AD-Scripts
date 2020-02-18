<#
.SYNOPSIS

Pulls a list of computers from the specified text file, and checks to see if they exist in Active Directory

.DESCRIPTION

This script uses the Get-ADComputer cmdlet to check for a specified list of devices in Active directory.  
The file name of the list is asked for at the beginning, and it then runs through the list, returning either a "yes" or "no" response along side the computer name.
The output is printed to the screen and also exported to a .csv file in the script directory called results.csv.  

.PARAMETER $serverlist

$serverlist is required. Can be any sort of list, such as a .txt or .csv file.

.EXAMPLE

Get-ADComputer-List -serverlist serverlist.txt

Check AD for server names in a file called serverlist.txt

.NOTES

Uses the primary domain of the computer you are logged on to.  Obviously you would need at least read permissions to the entirety of the domain.

Author: Jesse Willett
Date: 9/8/2016

#>
#Defining the single parameter, as well as the collection below it for the output
Param(
    [Parameter(Mandatory=$True,Position=1)]
        [string]$serverlist
    )
$collection = @()
#Run each line of input for the main file through this code block
ForEach ($server in (get-content $serverlist)) 
    {  
        #First writing the current server name to the status variable to be brought into the collection
        $status = @{"Name" = $server} 
        #See if it returns a result in AD, if it does writing "Yes" to the status variable
        Try {
            Get-ADComputer $server -ErrorAction Stop
            $status["Exists"] = "Yes"
        }
        #Anything that doesn't give a result, gets "no" written to the status variable
        Catch {
            $status["Exists"] = "No"
        }
        #Taking the status variable and making it a new PSObject under the serverstatus variable, and then adding into the collection
        New-Object -TypeName PSObject -Property $status -OutVariable serverStatus
        $collection = $collection + $serverStatus
        
    }
#After all computers are complete, we export the entire collection into a .csv file
$collection | Export-Csv -LiteralPath .\results.csv -NoTypeInformation
