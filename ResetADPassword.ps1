Write-Host "WARNING !!! You are trying to reset your password !!!"
$user=Read-Host "Enter the username"
$newpass=Read-Host "Enter the new password" -AsSecureString

Set-ADAccountPassword -Identity $user -Reset -NewPassword $newpass 
Write-Host "Your password has been changed!"