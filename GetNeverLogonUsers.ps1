$NeverLogonUsers = get-aduser -Filter {-not (lastlogontimestamp -like "*") -and -not (iscriticalsystemobject -eq $true)} `
| Select-Object SamAccountName, Name, UserprincipalName, PasswordLastSet, DistinguishedName

$NeverLogonUsers | export-csv C:\tmp\neverlogonusers.csv -NoTypeInformation
$fileNameFormat = "neverlogonusers" + "-" + (Get-Date -Format "yyyy-MM-dd") + ".csv"
Rename-Item -Path "C:\tmp\neverlogonusers.csv" -NewName $fileNameFormat