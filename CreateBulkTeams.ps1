#This script was made to bulk create Teams
Connect-MicrosoftTeams
$TeamsList = Import-CSV .\teams.csv 
Foreach ($Team in $TeamsList) {

#Testing if a Team with the same name already exists
If ((Get-Team -DisplayName $Team.DisplayName) -eq $Null){

#Creating The teams and setting the Owner of the Team
$Group = New-Team -DisplayName $Team.DisplayName -MailNickname $Team.MailNickname -Visibility $Team.Visibility -Owner $Team.Owner

#Adding Default Channels for the Team
$Channels = $Team.Channels.Split(";")
Foreach($Channel in $Channels){
New-TeamChannel -GroupId $Group.GroupId -DisplayName $Channel
}

#Adding Team members for each Team as member
$Members = $Team.Members.Split(";")
Foreach($Member in $Members) {
Add-TeamUser -GroupId $Group.GroupId -User $Member -Role Member
}
Write-Host ("Success: The Team with name " + $Team.DisplayName + " was created")
}
Else {Write-Host ("Error: The Team with name: " + $Team.DisplayName + " already exists")}
}