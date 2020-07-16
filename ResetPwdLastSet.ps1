$dateam = ((Get-Date -hour 0 -Minute 00 -Second 00).Add("-60")).ToFileTime()
$datepm = ((Get-Date -Hour 23 -Minute 59 -Second 59).Add("-90")).ToFileTime()
$users = (Get-ADUser -Filter {(pwdLastSet -gt $dateam) -or (pwdLastSet -lt $datepm) -and (extensionAttribute2 -notlike "*")} -Properties  pwdLastSet, extensionAttribute2)

foreach($user in $users)
{
    $user.pwdLastSet = 0
    $user.PasswordNeverExpires = $false
    Set-ADUser -Instance $user

    $user.pwdLastSet = -1
    Set-ADUser -Instance $user
}