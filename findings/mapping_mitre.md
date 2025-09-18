# MITRE ATT&CK Mapping – CloudGoat RCE Path

| Tactic           | Technique ID  | Technique Name                    | Where Observed                          |
|------------------|---------------|----------------------------------|-----------------------------------------|
| Credential Access | T1552.005     | Cloud Instance Metadata API      | RCE exploit accessed IMDS for creds.    |
| Privilege Escal.  | T1098         | Account Manipulation             | AttachUserPolicy detected in CloudTrail |
| Defense Evasion   | T1078         | Valid Accounts                   | Stolen role credentials via AssumeRole  |
| Discovery         | T1087         | Account Discovery (GetCallerID)  | Low-volume credential validation seen   |

