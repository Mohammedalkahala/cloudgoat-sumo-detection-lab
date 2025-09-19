# CloudGoat Sumo Logic Detection Labs

This repository contains two complete labs built with AWS CloudGoat to demonstrate attack‑to‑detection workflows using Sumo Logic.

## Included Labs

| Lab | Purpose |
|---|---------|
| `iam_privesc_by_attachment` | Demonstrates IAM privilege escalation via AttachUserPolicy & CreateAccessKey. |
| `rce_web_app` | Demonstrates Remote Code Execution and EC2 exploitation in a web app. |

## Contents of Each Lab

Each lab directory contains:

- `dashboards/` — JSON exports of dashboards showing detection panels  
- `queries/` — Working detection queries  
- `logs/` — Sample raw CloudTrail logs supporting detections  
- `screenshots/` — Visual evidence of detections  
- `README.md` — Lab‑specific instructions and narrative 

## 🎯 Objectives

- Simulate realistic AWS attacks in a controlled lab
- Capture logs using CloudTrail, ELB, and S3 logging
- Build detection queries and visual dashboards in Sumo Logic
- Validate the end-to-end kill chain from exploit → exfiltration → alerting

## 🛠 Setup Requirements

- AWS account (tested in `us-east-1`)
- CloudTrail enabled + log delivery to S3
- Sumo Logic trial account with CloudTrail log source
- [CloudGoat v3.1.0](https://github.com/RhinoSecurityLabs/cloudgoat) and AWS CLI

See each lab’s README for specific attack details and detection logic.
