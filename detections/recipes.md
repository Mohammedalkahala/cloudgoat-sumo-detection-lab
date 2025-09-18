# Detection Logic Recipes

This file breaks down detection queries into their components: logic, intent, tuning options, and caveats. Use this as a cookbook for building or modifying detection content.

---

## 📘 Example: Unusual AssumeRole Usage

### Goal

Detect use of AWS IAM `AssumeRole` API from unexpected IPs or roles.

### Query

```sql
_sourceCategory=aws/cloudtrail
| json field=_raw "eventName", "sourceIPAddress", "userIdentity.arn"
| where eventName = "AssumeRole"
| where !sourceIPAddress matches "10.*"  // example internal IP filter
| count by userIdentity.arn, sourceIPAddress
| where _count > 2

---

## 📘 Detection: High-Frequency AssumeRole Usage

### Goal
Detect IAM roles being assumed from the same IP more than 50 times in 15 minutes.

### Query
(see: detections/high_confidence/assume_role_volume.sumoql)

### MITRE Technique
T1078.004 – Valid Accounts: Cloud Accounts

### Confidence
High

### Trigger
Role/IP combo exceeds threshold of 50 in 15 min

### FP Mitigation
- Whitelist CI/CD roles
- Suppress known internal IPs

### FN Risk
- Role used just below threshold
- Different IPs used per session

---

