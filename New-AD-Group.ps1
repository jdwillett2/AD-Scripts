$newgroup = Read-Host "New Group Name"

New-ADGroup -Name $newgroup -GroupCategory Security -GroupScope Universal -Path "OU DN HERE"
