# Detection Metrics & Performance

This document outlines the effectiveness of each detection, potential false positives/negatives, and the expected performance of alerts once attacks are executed.

---

## ✅ Detection Coverage Summary

| Scenario      | MITRE Tactic        | Detection Status | Notes |
|---------------|---------------------|------------------|-------|
| rce_web_app   | Execution (T1059)   | ✅ Partial        | Initial detection works, but shell in `/tmp` not retained |
| iam_privesc   | Privilege Escalation (T1068) | ⛔ Pending        | Not yet executed |
| lambda_privesc | Privilege Escalation (T1606.001) | ⛔ Pending        | Not yet executed |
| cloud_breach_s3 | Exfiltration (T1537) | ⛔ Pending        | Not yet executed |

---

## ⚠️ Known Gaps

- **Short-lived shell artifacts** (e.g. `/tmp/shell.sh`) are not retained in logs.
- **Insufficient evidence from flow logs alone** — deeper analysis requires CloudTrail or Lambda logs.
- IAM-based attacks may require correlation of `AssumeRole`, `CreatePolicy`, `AttachRolePolicy`.

---

## 📊 False Positives

| Detection Use Case | Potential False Positives | Mitigation |
|--------------------|---------------------------|------------|
| `eventName = AssumeRole` | Legit automation (CI/CD) | Whitelist trusted IAM roles |
| `S3:GetObject` access | Developer/test environments | Filter known test buckets |
| Lambda debug logs | Noisy console output | Filter on content or event name context |

---

## ❌ False Negatives

| Scenario | Root Cause |
|----------|------------|
| rce_web_app | Shell written to `/tmp` not captured by logs |
| lambda_privesc | Lack of execution logging if role misuse is silent |

---

## ⚡ Detection Latency

| Detection Type | Avg Delay | Source |
|----------------|-----------|--------|
| CloudTrail-based | 2–5 minutes | CloudTrail → S3 → Sumo Ingest |
| VPC Flow Logs | 1–3 minutes | VPC Flow to CloudWatch |
| Lambda Logs | Instant to 1 min | Direct to CloudWatch |

---

## 🧪 Detection Validation Process

1. Run CloudGoat scenario
2. Confirm log events appear in Sumo Logic:
   - `sourceCategory=aws/cloudtrail`
   - `sourceCategory=aws/vpc/flowlogs`
   - `sourceCategory=aws/lambda`
3. Run detection query
4. Confirm alert fires within expected delay
5. Document signal/noise ratio and alert value

---

## 🛠️ Recommendations

- Add canary log injections to verify queries are working
- Tune alerts using frequency and aggregation to reduce noise
- Use metadata enrichment (GeoIP, AWS tag data) to add context

