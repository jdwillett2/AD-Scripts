# AD-Scripts

This repository contains scripts I have written to perform various actions in AD.  I will describe each script as best I can below:

Add-Computer-AD-Group-Multiple.ps1:

This script simply takes a text file as input (the script asks for the file name when ran), and adds the computers listed in the text file to the specified security group.  Currently the script will just work for the AD domain the computer it is run on is joined to.  I might add the capability to do other domains with credentials later.

Copy-AD-Group.ps1

Takes input for a new security group and an old security group, creates the new group and copies the members from the old one.

Get-AD-Computer-DistinguishedName.ps1:

This takes computers from a specified text file and retrieves the distinguished name from AD, then dumps it all into a a .csv file.  Currently the input file is hard coded.

Get-AD-Computer-DN-OS.ps1

Same as above, but the output also includes OS name.

Get-AD-Computer-Group-Membership.ps1:

This retrieves the group membership of the list of computers (once again, text file input).  It outputs the results into another text file.  Recent revelations have made me realize I should probably change it to output to Out-GridView so the results can be seen easier.

Get-ADComputer-List.ps1

Pulls a list of computers from the specified text file, and checks to see if they exist in Active Directory.  This script is well commented for better detail.

Get-ADGroup-List.ps1

Uses a file for input and checks to see if the specified AD group exists.

New-AD-Group.ps1

Makes a new universal security group with the name given.

Remove-ADComputer-List.ps1

Removes computers from AD from a given list.  Currently configured to use a file called "severlist.txt"

Remove-ADGroup-List.ps1

Same as above only for Security Groups.

Remove-Computer-Ad-Group-Multiple.ps1:

Removes computers in a specified text file from a specified AD group.
