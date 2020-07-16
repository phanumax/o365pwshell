Import-Csv C:\tmp\smtpaddresslist.csv | foreach {
  $Upn = $_.PrimarySmtpAddress
  $Users = Get-MsolUser -UserPrincipalName $Upn
  $GroupId = Get-MsolGroup -ObjectId "5b98acca-223d-4eeb-92c3-4c7b230694ca" # Group ID of "AllowedToCreateGroups" 

  $Users | foreach {
    Add-MsolGroupMember -GroupObjectId $GroupId.ObjectId -GroupMemberObjectId $Users.ObjectId -GroupMemberType User
  }
}