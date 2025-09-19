_sourceCategory=aws/cloudtrail
| json "eventName"
| where eventName = "AttachUserPolicy" 
| count
