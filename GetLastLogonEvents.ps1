$LastLogonEvents = Get-ADUser -Filter {enabled -eq $true} -Properties LastLogonTimeStamp |
Select-Object SamAccountName,Name,@{Name="Stamp"; Expression={[DateTime]::FromFileTime($_.lastLogonTimestamp).ToString('yyyy-MM-dd_hh:mm:ss')}},DistinguishedName

$LastLogonEvents | export-csv C:\tmp\lastlogonevents.csv -NoTypeInformation
$fileNameFormat = "lastlogonevents" + "-" + (Get-Date -Format "yyyy-MM-dd") + ".csv"
Rename-Item -Path "C:\tmp\lastlogonevents.csv" -NewName $fileNameFormat