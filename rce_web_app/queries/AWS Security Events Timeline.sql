_sourceCategory=aws/cloudtrail
| json "eventTime", "eventName"
| where eventName in ("AttachUserPolicy", "CreateFunction20150331", "AssumeRole")
| timeslice 5m
| count by _timeslice, eventName
| transpose row _timeslice column eventName
