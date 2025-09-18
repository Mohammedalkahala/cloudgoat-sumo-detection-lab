# Cleanup & AWS Cost Control

This guide helps prevent unnecessary AWS charges and ensures resources are safely cleaned up after lab runs.

---

## ☠️ Danger Zones

| Resource Type | Why it Costs | Cleanup Method |
|---------------|---------------|----------------|
| EC2 Instances | Charged per hour | CloudGoat destroy / EC2 Console |
| S3 Buckets    | Charged for storage + PUT requests | Empty + delete |
| Lambda Functions | Charged per call (minor) | CloudGoat destroy |
| CloudTrail    | Data events incur $ | Delete Trail or disable Data Events |
| VPC Flow Logs | Writes to CloudWatch | Disable log groups manually if stuck |

---

## 🧹 Recommended Teardown Process

After each test or scenario:

### Manual:

```bash
cloudgoat destroy rce_web_app
