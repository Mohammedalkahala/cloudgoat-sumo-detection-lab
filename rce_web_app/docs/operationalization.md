# Operationalization Guidance

This guide outlines how to deploy, tune, and manage the detection content from this lab in a real-world or staging Sumo Logic environment.

---

## 🚨 Deploying Detections into Production

### Step-by-Step

1. **Deploy Log Sources**
   - Ensure S3, CloudTrail, Lambda logs are flowing into Sumo Logic
   - Verify FERs are parsing key fields (eventName, userIdentity, etc.)

2. **Load Detection Queries**
   - Use saved searches or dashboards provided in the repo
   - Group them under a folder like `Detections/CloudGoat` for easy access

3. **Set Up Monitors**
   - Create Scheduled Searches or Real-Time Monitors
   - Use aggregation (e.g., `count by` IAM role, IP, etc.) to reduce noise
   - Example threshold: `>3 AssumeRole events in 1 hour from unknown IP`

---

## 🎚️ Tuning Alerts

| Technique       | Use Case                  | Example |
|------------------|---------------------------|---------|
| Role Whitelisting | Filter trusted role ARNs | `!userIdentity.arn in (list)` |
| GeoIP Filters     | Block known internal IPs  | `!src_ip matches '10.0.*'` |
| Frequency Control | Suppress flapping alerts  | Alert if `count > 3` in 5m |

---

## 🔁 Alert Lifecycle

1. **Detection Fires**
   - Alert in Sumo Logic with relevant context (IAM role, IP, API call)

2. **Enrichment (Optional)**
   - Add role metadata, account tags, GeoIP data to alert

3. **Triage**
   - Check: was this expected? Known automation? New activity?

4. **Escalation**
   - If suspicious: pivot to logs, validate actor, revoke credentials

5. **Response**
   - Kill sessions, disable roles/users, update policies, notify owners

---

## 🧩 Example Monitor Query

```sql
_sourceCategory=aws/cloudtrail
|
