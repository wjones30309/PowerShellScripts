$Groups = Get-MsolGroup -All
foreach ($Group in $Groups) 
{
$Group_GUID = $Group.ObjectId
$Group_DisplayName = $Group.DisplayName
$Group_Email = $Group.EmailAddress
$Group_GroupType = $Group.GroupType
$GroupMembers = Get-MsolGroupMember -GroupObjectId $Group_GUID

foreach ($GroupMember in $GroupMembers) 
    {
$Properties = @{"GroupDisplayName"=$Group_DisplayName;
"GroupEmail"=$Group_Email;
"GroupType"=$Group_GroupType;
"MemberDisplayName"=$GroupMember.DisplayName;
"MemberEmail"=$GroupMember.EmailAddress;
"MemberType"=$GroupMember.GroupMemberType}

$Obj = New-Object -TypeName PSObject -Property $Properties
Write-Output $Obj | select GroupDisplayName,GroupEmail,GroupType,MemberDisplayName,MemberEmail,MemberType
    }
}
