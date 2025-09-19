# Environment Setup & Reproducibility

This document helps users deploy the detection lab safely, reproducibly, and cost-effectively.

---

## 🧰 Prerequisites

- AWS account with programmatic access (Access Key + Secret)
- IAM user/role with sufficient permissions to deploy CloudGoat
- Terraform v1.0+ installed
- Sumo Logic account with:
  - Access to manage Sources and FERs
  - Cloud-to-Cloud integration enabled

---

## 🔐 Permissions & Isolation

### Recommended Practice: Use a Separate AWS Account

- Create a dedicated AWS account under your org (if available)
- Do **not** run CloudGoat in a production or developer account
- Use AWS Organizations SCPs to block:
  - Costly services (e.g., SageMaker, Redshift)
  - Region expansion (keep it in 1 region)

---

## 📦 Deployment Commands

Inside your `setup/` directory, run:

```bash
cd setup

# Initialize CloudGoat
cloudgoat configure

# Choose scenario (e.g., rce_web_app)
cloudgoat create rce_web_app
