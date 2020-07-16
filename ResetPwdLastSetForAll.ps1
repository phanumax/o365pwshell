<# By allenage.com
$days=42  #change date here according to GPO
Example you set a policy that users password will expire in 42 days,then the script will reset last password set date to today's days those users who haven't changed password in last 42 days.

If all users password expired today
$users=get-ADUser -filter {Enabled -eq $True -and PasswordExpired -eq $true} |select -ExpandProperty samaccountname
#>

$days=90  #change date here according to GPO.


$users=Get-ADUser -Filter {enabled -eq $true} -Properties pwdLastSet |Select  samaccountname, @{n='pwdLastSet';e={[DateTime]::FromFileTime($_.pwdLastSet)}} |Where-object {$_.pwdlastset -lt (get-date).AddDays(-$days)} 
foreach ($user in $users) {
       $sam = $user.samaccountname 
 
       $todouser = Get-ADUser $sam -Properties pwdLastSet 
     
       $todouser.pwdLastSet = 0 
       Set-ADUser -Instance $todouser 
     
       $todouser.pwdLastSet = -1 
       Set-ADUser -Instance $todouser 
}


# Now verify

Get-ADUser -Filter {enabled -eq $true} -Properties pwdLastSet |Select  samaccountname, @{n='pwdLastSet';e={[DateTime]::FromFileTime($_.pwdLastSet)}} 

#get expiry date
Get-ADUser -filter {Enabled -eq $True -and PasswordNeverExpires -eq $False} `
–Properties "SamAccountName","pwdLastSet","msDS-UserPasswordExpiryTimeComputed" |
Select-Object -Property "SamAccountName",@{Name="Password Last Set";`
Expression={[datetime]::FromFileTime($_."pwdLastSet")}}, @{Name="Password Expiry Date";`
Expression={[datetime]::FromFileTime($_."msDS-UserPasswordExpiryTimeComputed")}}