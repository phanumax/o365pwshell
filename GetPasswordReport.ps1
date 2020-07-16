$MaxPwdAge = (Get-ADDefaultDomainPasswordPolicy).MaxPasswordAge.Days
$ExpiredDate = (Get-Date).AddDays(-$MaxPwdAge)
# Set the number of days untile you would like to begin notifing the users.
# Filters for all users who's password is within $date of expireation.
$ExpiredUsers = Get-ADUser -Filter {(PasswordLastSet -gt $ExpiredDate) -and (PasswordNeverExpires -eq $false) -and (Enabled -eq $true)} -Properties PasswordNeverExpires, PasswordLastSet, Mail `
| Select-Object SamAccountName, Name, PasswordLastSet, @{name = "DaysUntilExpired"; Express = {$_.PasswordLastSet - $ExpiredDate `
| Select-Object -ExpandProperty Days}}, DistinguishedName | Sort-Object PasswordLastSet

$ExpiredUsers | export-csv C:\tmp\pwage.csv -NoTypeInformation
$fileNameFormat = "pwage" + "-" + (Get-Date -Format "yyyy-MM-dd") + ".csv"
Rename-Item -Path "C:\tmp\pwage.csv" -NewName $fileNameFormat