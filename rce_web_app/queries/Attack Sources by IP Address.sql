_sourceCategory=aws/cloudtrail 
| json "sourceIPAddress","eventName"
| where eventName in ("AttachUserPolicy","CreateFunction20150331","AssumeRole")
| count by sourceIPAddress, eventName
