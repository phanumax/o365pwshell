$DGroup = Read-Host 'Insert Distribution Group Name'
$users = Import-Csv "C:\tmp\smtpaddresslist.csv"

foreach ($i in $users) {
  Add-DistributionGroupMember -Identity $DGroup -Member $i.PrimarySmtpAddress
}