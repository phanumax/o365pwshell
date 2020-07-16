(Get-ADComputer -filter {(operatingsystem -like '*windows 7*') -or (operatingsystem -like '*windows 8*') -or (operatingsystem -like '*windows 10*')} `
|Select-Object Name,OperatingSystem,OperatingSystemServicePack,OperatingSystemVersion).count
