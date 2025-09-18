# MITRE ATT&CK Mapping (RCE → IMDS → STS)
| Tactic             | Technique ID | Technique Name                | Where Observed                          |
|--------------------|--------------|-------------------------------|-----------------------------------------|
| Initial Access     | T1190        | Exploit Public-Facing App     | RCE web app (CloudGoat scenario)        |
| Cred. Access       | T1552.005    | Cloud Instance Metadata API   | IMDS queried for temp creds             |
| Priv. Escalation   | T1098        | Account Manipulation          | AttachUserPolicy attempts in CloudTrail |
| Defense Evasion    | T1078        | Valid Accounts                | STS AssumeRole with harvested creds     |
| Discovery          | T1526        | Cloud Service Discovery       | Low-volume STS GetCallerIdentity        |
