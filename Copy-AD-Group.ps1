$newgroup = Read-Host "New Group Name"
$oldgroup = Read-Host "Old Group Name"
$members = Get-ADGroupMember $oldgroup

New-ADGroup -Name $newgroup -GroupCategory Security -GroupScope Universal -Path "OU=Server Local Groups,OU=Server Groups,OU=Servers,OU=Computer Accounts,DC=chp,DC=clarian,DC=org"
Add-ADGroupMember -Identity $newgroup -Members $members
