# Detection Testing & Validation

This document describes how to validate that detection logic works as expected across each CloudGoat scenario.

---

## 🧪 Testing Strategy

Each detection must pass the following test types:

| Type             | Goal                             |
|------------------|----------------------------------|
| Functional       | Does the detection fire when the attack is executed? |
| Data Quality     | Are required log fields present and parsed correctly? |
| Alert Enrichment | Does the alert contain enough info for triage? |
| Performance      | How fast does the detection trigger? |

---

## ✅ Recommended Testing Process

1. **Deploy the CloudGoat scenario** (e.g. `rce_web_app`)
2. **Execute the attack steps** (manually or via automation)
3. **Wait for logs to be ingested**
4. **Run the detection queries manually**
5. **Verify:**
   - Correct fields were parsed
   - Alert fired with expected values
   - Any false positives are identified

---

## 🔁 Example Test Tracker Table

| Scenario     | Detection | Log Source | Query Status | Alert Status | Notes |
|--------------|-----------|------------|--------------|--------------|-------|
| rce_web_app  | RCE via EC2 | CloudTrail, VPC Logs | ✅ Parsed | ✅ Alerted | Need better retention of `/tmp` artifacts |
| iam_privesc  | IAM Escalation | CloudTrail | ⛔ Not run | ⛔ N/A | To be tested |
| lambda_privesc | Lambda misuse | CloudTrail, Lambda Logs | ⛔ Not run | ⛔ N/A | To be tested |

---

## 💡 Automation Ideas

- Use a bash or Python script to:
  - Deploy CloudGoat
  - Run attack steps
  - Export relevant logs from Sumo Logic via API
  - Run assertions (e.g., grep logs for `AssumeRole`)
- Store test logs in `artifacts/logs/` for future replay

---

## 🔂 Continuous Detection Validation

Integrate detection testing with CI/CD:

- Trigger tests on PRs that change detection logic
- Run a set of predefined log queries
- Fail the build if alerts are missing or malformed

---

## 📋 Sample Log Replay (Manual)

```bash
# Export logs from a known-good run
sumo-cli search "sourceCategory=aws/cloudtrail eventName=AssumeRole" --time "last 24h" > logs/assume_role_test.json

# Use this to re-test detection queries
