# Monitors

 1) AttachUserPolicy Attempts (Privilege Escalation)
  Query:
  _sourceCategory=aws/cloudtrail
  | json "eventName"
  | where eventName = "AttachUserPolicy"
  | count

 2) AssumeRole Spikes (STS Credential Use)

Query:
_sourceCategory=aws/cloudtrail
| json "sourceIPAddress","eventName"
| where eventName = "AssumeRole"
| timeslice 10m
| count by _timeslice, sourceIPAddress
| where _count > 3



 3) GetCallerIdentity Bursts (Future/Disabled)

Query:
_sourceCategory=aws/cloudtrail
| json "eventName","sourceIPAddress","userIdentity.sessionContext.sessionIssuer.arn" as event, ip, role
| where event = "GetCallerIdentity"
| timeslice 10m
| count by _timeslice, ip, role
| where _count > 2
