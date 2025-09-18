# Logging & Data Sources Setup

This document outlines the logging architecture used in the CloudGoat-Sumo Detection Lab. It ensures detection logic is tied to actual, observable telemetry in AWS.

---

## 📥 Data Sources Enabled in AWS

| Log Type           | Service        | Purpose |
|--------------------|----------------|---------|
| CloudTrail         | AWS Management & Data Events | Tracks API calls across services |
| VPC Flow Logs      | Networking     | Captures inbound/outbound IP traffic metadata |
| S3 Access Logs     | S3             | Logs access to sensitive buckets |
| Lambda Execution Logs | Lambda     | Captures stdout/stderr and execution metadata |
| GuardDuty (optional) | AWS Security | Detects AWS-native threats for enrichment |

---

## ✅ Logging Configuration Assumptions

- **CloudTrail**:
  - Both **Management Events** and **Data Events** are enabled.
  - Logging is enabled for all regions.
  - Logs are sent to an S3 bucket and ingested into Sumo Logic via an AWS S3 source.
- **VPC Flow Logs**:
  - Enabled for all VPCs used in CloudGoat environments.
  - Set to capture **ALL** traffic (accept/reject/all).
- **S3 Access Logs**:
  - Enabled on sensitive S3 buckets used in scenarios like `cloud_breach_s3`.
- **Lambda Logs**:
  - Automatically pushed to CloudWatch.
  - Ingested into Sumo Logic via CloudWatch Source or Cloud-to-Cloud Integration.

---

## 🔄 Log Ingestion into Sumo Logic

Ingestion is assumed to be configured using **AWS Cloud-to-Cloud Integration** or custom ingestion pipelines using:

- **S3 Bucket Source** for CloudTrail
- **CloudWatch Source** for Lambda and Flow Logs
- **Field Extraction Rules (FERs)** in Sumo Logic for:
  - Parsing CloudTrail fields
  - Mapping IPs, UserAgents, Roles, EventNames

---

## 📋 Recommended Fields for Detection

| Log Source   | Critical Fields |
|--------------|------------------|
| CloudTrail   | `eventName`, `userIdentity.arn`, `sourceIPAddress`, `eventTime`, `errorCode`, `eventSource` |
| Flow Logs    | `srcaddr`, `dstaddr`, `action`, `protocol`, `bytes`, `packets` |
| S3 Logs      | `requester`, `bucket`, `operation`, `status`, `bytesSent` |
| Lambda Logs  | Any suspicious `console.log`, `stderr` messages |

---

## 📌 Notes

- All logs should be retained for **at least 7 days** for detection and response.
- If using demo or low-cost AWS environments, ensure S3-based logs are not being truncated or lost due to bucket policy.

---

## 🧪 Validation Steps

Use the following query in Sumo Logic to validate CloudTrail ingestion:

```sql
_sourceCategory=aws/cloudtrail
| json field=_raw "eventName", "userIdentity.arn", "sourceIPAddress", "eventTime"
| count by eventName
| sort by _count desc
