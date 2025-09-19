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
