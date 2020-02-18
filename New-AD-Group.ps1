$newgroup = Read-Host "New Group Name"

New-ADGroup -Name $newgroup -GroupCategory Security -GroupScope Universal -Path "OU=Server Local Groups,OU=Server Groups,OU=Servers,OU=Computer Accounts,DC=chp,DC=clarian,DC=org"
