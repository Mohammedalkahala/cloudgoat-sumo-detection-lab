# Coverage Matrix (this repo)
| Signal                          | Source      | Status  | Notes                                  |
|---------------------------------|-------------|---------|----------------------------------------|
| CloudTrail mgmt events          | CloudTrail  | ✅ On   | eventName=AssumeRole, AttachUserPolicy |
| S3 data events (GetObject, …)   | CloudTrail  | ❌ Off  | Not enabled; S3 read panels will be empty |
| ALB/ELB access logs             | ALB/ELB     | ❌ N/A  | Not ingested in this lab               |
| App logs (web/RCE breadcrumb)   | App logs    | ❌ N/A  | Not ingested                           |
| STS validation (GetCallerIdentity) | CloudTrail | ✅ Low | Low volume; “burst” monitors disabled  |

