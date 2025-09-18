# Detection Runbook – CloudGoat RCE Path

## 1) AttachUserPolicy Attempts (Privilege Escalation)
**Purpose:** Detects when someone tries to attach an IAM policy (privilege escalation).

- **Check in CloudTrail:**  
  * Search for `eventName = AttachUserPolicy`.  
  * Review `userIdentity.arn`, `sourceIPAddress`, and `requestParameters.policyArn`.  
- **Pivot:**  
  * From the IP or user, look for related `AssumeRole` or `GetCallerIdentity` events.  
  * Check CloudTrail for any new roles or permissions changes.  
- **Containment:**  
  * Detach suspicious policies.  
  * Disable or rotate the affected user’s credentials.  
  * Investigate if the policy allowed access to sensitive resources.

---

## 2) AssumeRole Spikes (STS Credential Use)
**Purpose:** Flags unusual bursts of role assumptions—can indicate stolen credentials being reused.

- **Check in CloudTrail:**  
  * Search for `eventName = AssumeRole`.  
  * Identify source IPs making multiple calls in a short period.  
- **Pivot:**  
  * Trace back to the instance or ALB logs to see how the credentials were obtained (e.g., from IMDS).  
  * Review the role’s permissions and recent activity on S3 or Lambda.  
- **Containment:**  
  * Revoke or limit the affected IAM role.  
  * Rotate credentials and review network paths to metadata endpoints.  

---

## 3) AWS Security Events Timeline (Activity Over Time)
**Purpose:** Visual timeline to spot patterns (AssumeRole bursts, AttachUserPolicy attempts).

- **Check in CloudTrail:**  
  * Use the timeline to identify time windows with spikes in `AssumeRole` or `AttachUserPolicy`.  
- **Pivot:**  
  * Drill into logs for those time windows—look for related API calls, source IPs, or new resources created.  
  * Correlate with other detections (e.g., GetCallerIdentity checks).  
- **Containment:**  
  * If activity looks malicious, isolate the resource or revoke the related IAM roles.  
  * Investigate further for lateral movement or data exfiltration.

