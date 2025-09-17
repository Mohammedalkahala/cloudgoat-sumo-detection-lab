# cloudgoat-sumo-detection-lab
A project that provides a full walkthrough, artifacts, and detection content for a security monitoring lab. It uses a vulnerable AWS CloudGoat environment to simulate attacks and leverages Sumo Logic to detect the malicious activity.
**Author:** Mohammed Alkahala  
**Summary:** End-to-end demo: deployed CloudGoat scenarios in AWS (rce_web_app, lambda_privesc), executed attack chains, and built Sumo Logic searches, dashboards and monitors to detect and alert on the activity.

**Demo artifacts included**
- Terraform troubleshooting notes & example var file: `setup/`
- Attack walkthroughs & sanitized evidence: `attacks/`
- Sumo saved searches, exported dashboard and monitors: `detections/`
- Detection runbook & MITRE mapping: `detections/detection_runbook.md`, `findings/`

---

## Quick start

1. Clone repo:
   ```bash
   git clone https://github.com/mohammedalkahala/cloudgoat-sumo-detection-lab.git
   cd cloudgoat-sumo-detection-lab
2. Read setup/terraform_commands.md for CloudGoat deploy notes and setup/whitelist_example.tfvars for the cg_whitelist format.
3. Review Sumo Logic dashboard JSON in detections/dashboard.json and queries in detections/sumo_queries.txt. Import into Sumo Logic per the runbook.

