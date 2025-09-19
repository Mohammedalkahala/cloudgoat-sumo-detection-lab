# Threat Model & Use Case Context

## Overview

This lab simulates realistic attack scenarios in an AWS environment using CloudGoat. Each scenario represents a step in the adversary kill chain, aligned to MITRE ATT&CK tactics. The purpose is to emulate threats that a SOC or detection team would want visibility into, enabling proactive threat detection and hunting.

---

## Threat Actors Simulated

| Scenario         | Threat Actor      | Description |
|------------------|-------------------|-------------|
| `rce_web_app`    | External Attacker | Exploits vulnerable web app to gain initial access |
| `iam_privesc`    | Insider Threat    | Exploits IAM misconfig to escalate privileges |
| `lambda_privesc` | Cloud-Native APT  | Abuses over-permissive Lambda roles for lateral movement |
| `cloud_breach_s3`| External Attacker | Data exfiltration after unauthorized S3 access |

---

## Kill Chain Stages

- **Initial Access** – Web app RCE, misconfigured IAM policies
- **Execution** – Remote code execution in Lambda
- **Privilege Escalation** – Role assumption, misconfigured IAM privilege chaining
- **Lateral Movement** – Switching between roles/resources
- **Persistence** – Creation of rogue users or policies
- **Exfiltration** – Access to sensitive S3 objects or logs

---

## Assumptions

- AWS CloudTrail logging is fully enabled for management and data events
- All logs are ingested into Sumo Logic without filtering
- No service control policies block the attack path
- Attacks are executed within a single AWS account

---

## Detection Use Cases

| Use Case | MITRE ATT&CK | Description |
|----------|--------------|-------------|
| Unauthorized Role Assumption | T1078.004 | Detecting use of rarely used IAM roles |
| Lambda Privilege Escalation | T1606.001 | Role chaining using Lambda to get broader access |
| Suspicious S3 Access | T1530 | Unusual access patterns to S3 buckets |
| Web Shell in EC2 | T1059 | Execution of commands via RCE in a web app |

---

## Goal

By clearly mapping attack simulations to real-world threat behaviors, this lab ensures detection logic is grounded in realistic scenarios and builds robust coverage against evolving cloud threats.
