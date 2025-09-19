# MITRE ATT&CK Coverage

This matrix outlines which techniques from the MITRE ATT&CK framework are covered by detection logic in this lab.

---

## 🎯 Coverage Matrix

| MITRE Technique ID | Name                         | Scenario        | Detection Status | Notes |
|--------------------|------------------------------|------------------|------------------|-------|
| T1059              | Command and Scripting Interpreter | rce_web_app | ✅ Partial        | Shell in `/tmp` not retained |
| T1078.004          | Valid Accounts: Cloud Accounts | iam_privesc | ⛔ Not Tested     | Will detect unauthorized AssumeRole |
| T1606.001          | Forge Web Credentials: AWS IAM | lambda_privesc | ⛔ Not Tested     | Needs Lambda execution visibility |
| T1537              | Transfer Data to Cloud Account | cloud_breach_s3 | ⛔ Not Tested     | Monitor S3 bucket access and download |
| T1087.004          | Account Discovery: Cloud Account | All | 🔍 Finding only     | Can be used for enrichment |
| T1484.001          | Domain or Tenant Modification: Cloud Policy | iam_privesc | ⛔ Not Tested | Detect CreatePolicy/AttachRolePolicy |
| T1550.001          | Use Alternate Authentication Material | iam_privesc | ⛔ Not Tested | Can be tested via STS credentials |
| T1110.003          | Brute Force: Password Spraying | N/A | 🔲 Not Applicable | Out of scope for CloudGoat |

---

## 📈 Coverage Overview

| Tactic            | Coverage Level |
|-------------------|----------------|
| Initial Access    | ✅ Covered (rce_web_app) |
| Execution         | ✅ Covered (rce, lambda) |
| Privilege Escalation | 🟡 Partial |
| Credential Access | 🔍 Partial (via AssumeRole token use) |
| Discovery         | 🔍 Finding only |
| Lateral Movement  | 🟡 In progress (via role chaining) |
| Exfiltration      | ⛔ Not yet implemented |
| Defense Evasion   | 🔲 Not in scope (e.g., log tampering) |

---

## 📌 Notes

- More complete coverage requires executing all CloudGoat scenarios
- Detection logic should be aligned with ATT&CK Navigator for visual mapping
- Consider exporting detection metadata in ATT&CK-compatible format for integrations

---

## ✅ To-Do

- [ ] Run and document `iam_privesc`, `lambda_privesc`, `cloud_breach_s3`
- [ ] Add detection queries for each new MITRE technique
- [ ] Update this file regularly as detection logic evolves
