$NeverExpiresUsers = Get-ADUser -Filter { (Enabled -eq $true) -and (PasswordNeverExpires -eq $true) } -Properties PasswordNeverExpires, PasswordLastSet `
| Select-Object SamAccountName, Name, UserprincipalName, PasswordLastSet, DistinguishedName 

$NeverExpiresUsers | export-csv C:\tmp\pwneverexpires.csv -NoTypeInformation
$fileNameFormat = "pwneverexpires" + "-" + (Get-Date -Format "yyyy-MM-dd") + ".csv"
Rename-Item -Path "C:\tmp\pwneverexpires.csv" -NewName $fileNameFormat