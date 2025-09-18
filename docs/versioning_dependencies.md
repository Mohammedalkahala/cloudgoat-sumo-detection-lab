# Versioning & Dependencies

This file documents the required tools, supported versions, and update/change tracking for the lab.

---

## 🔧 Required Tools

| Tool         | Version          | Install Notes |
|--------------|------------------|---------------|
| CloudGoat    | v3.1+            | Clone from official repo: https://github.com/RhinoSecurityLabs/cloudgoat |
| Terraform    | v1.0+            | Required for CloudGoat infra deployment |
| AWS CLI      | v2.x             | For credential/configuration and S3 management |
| Sumo Logic Terraform Provider | v2.14+        | For managing sources and dashboards programmatically |
| jq           | Latest           | For parsing JSON outputs |
| Python       | 3.8+             | (If using custom log tools or data manipulation scripts) |

---

## ✅ Version Pinning

You should pin the following versions in config files to ensure reproducibility:

**Terraform example:**

```hcl
terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = ">= 4.0.0"
    }
    sumologic = {
      source  = "SumoLogic/sumologic"
      version = ">= 2.14.0"
    }
  }
}
