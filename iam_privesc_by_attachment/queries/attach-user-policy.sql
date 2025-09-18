_sourceCategory=aws/cloudtrail "AttachUserPolicy"
| json field=_raw "userIdentity.userName" as user
| json field=_raw "requestParameters.policyArn" as policy
| count by user, policy
| sort by _count desc
