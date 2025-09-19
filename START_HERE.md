# Start Here

Welcome to **CloudGoat + Sumo Detection Lab**.  
This repo contains two hands‑on labs:

1. **IAM Privilege Escalation** (`iam_privesc_by_attachment`)  
2. **RCE Web App** (`rce_web_app`)

## How to Use

- Browse top‑level `README.md` for general overview.  
- Go into each lab folder (`iam_privesc_by_attachment/` or `rce_web_app/`) for that lab’s artifacts:  
  - dashboards/  
  - queries/  
  - logs/  
  - screenshots/  

- If you want to review findings or logic, open the lab folder.  

## Repo Layout

cloudgoat‑sumo‑detection‑lab/
- iam_privesc_by_attachment/
- rce_web_app/
- .gitignore
- README.md
- START_HERE.md

Here's the updated `START_HERE.md` with the `setup/` folder included and explained clearly:

---


Welcome to the **CloudGoat + Sumo Detection Lab**.

This repo contains **two hands‑on detection labs** using real-world AWS attack simulations via CloudGoat, and Sumo Logic to monitor and detect them.

---

## 📌 Labs Included

1. **IAM Privilege Escalation** (`iam_privesc_by_attachment`)
2. **RCE Web App** (`rce_web_app`)

---

## 🔍 How to Use

- 📖 **Start here** to understand the project structure
- 📂 Open each lab folder to see:
  - `dashboards/` – Sumo dashboard exports (JSON)
  - `queries/` – Detection queries used in the dashboard
  - `logs/` – Raw CloudTrail logs captured from the lab
  - `screenshots/` – Dashboard panels / visual evidence

---

## ⚙️ Setup Instructions

To set up your own CloudGoat and Sumo Logic detection environment:

➡️ Go to [`setup/`](./setup)

Inside you'll find:

- 📄 `cloudgoat_installation.md` – Step-by-step guide to install and run CloudGoat scenarios on AWS
- 📄 `sumo_aws_cloudtrail_setup.md` – Full walkthrough for:
  - Creating an S3 bucket for CloudTrail
  - Enabling CloudTrail
  - Connecting AWS to Sumo Logic
  - Using Sumo’s Free Trial
  - Validating CloudTrail ingestion

---

## 📁 Repo Layout

```

cloudgoat-sumo-detection-lab/
├── iam\_privesc\_by\_attachment/
├── rce\_web\_app/
├── setup/
│   ├── cloudgoat\_installation.md
│   └── sumo\_aws\_cloudtrail\_setup.md
├── .gitignore
├── README.md
└── START\_HERE.md



Let me know once you've added that — then we can do a final polish pass if you'd like.
