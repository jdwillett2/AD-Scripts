$newgroup = Read-Host "New Group Name"
$oldgroup = Read-Host "Old Group Name"
$members = Get-ADGroupMember $oldgroup

New-ADGroup -Name $newgroup -GroupCategory Security -GroupScope Universal -Path "OU DN HERE"
Add-ADGroupMember -Identity $newgroup -Members $members
