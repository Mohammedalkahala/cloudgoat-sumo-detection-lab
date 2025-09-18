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
