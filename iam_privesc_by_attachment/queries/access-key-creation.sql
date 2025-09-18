_sourceCategory=aws/cloudtrail "CreateAccessKey"
| json field=_raw "userIdentity.userName" as user
| json field=_raw "requestParameters.userName" as targetUser
| count by user, targetUser
