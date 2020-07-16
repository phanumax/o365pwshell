# Need to prepare user information in file "c:\tmp\smtpaddresslist.csv"

$users = Import-Csv "C:\tmp\smtpaddresslist.csv"

foreach ($i in $users) {
  Get-MsolUser -UserPrincipalName $i.PrimarySmtpAddress
}
Start-Sleep -Seconds 10