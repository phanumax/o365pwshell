# Need to prepare user information in file "c:\tmp\smtpaddresslist.csv"

$users = Import-Csv "C:\tmp\smtpaddresslist.csv"

foreach ($i in $users) {
  Get-MsolUser -UserPrincipalName $i.PrimarySmtpAddress
}

foreach ($i in $users) {
  Set-MsolUser -UserPrincipalName $i.PrimarySmtpAddress -UsageLocation $i.UsageLocation
} 

foreach ($i in $users) {
  Set-MsolUserLicense -UserPrincipalName $i.PrimarySmtpAdress -AddLicenses $i.SKU
}