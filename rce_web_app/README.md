## ✅ RCE Web App Lab (CloudGoat Scenario)

### 📌 Scenario: rce_web_app

---

### 🧠 Objective

This lab simulates a Remote Code Execution (RCE) vulnerability on an AWS‑hosted web application via CloudGoat. The attacker exploits a vulnerable input field, obtains EC2 Instance Role / metadata credentials, and uses CloudTrail logs to detect these actions.

---

### 🚀 Attack Narrative

1. **Deploy RCE Web App** scenario using CloudGoat.  
2. **Locate the public web application** (via ALB or public endpoint).  
3. **Exploit vulnerable input** (e.g., signup form / email field) for remote code execution.  
4. **Use EC2 metadata / instance role credentials** to retrieve IAM credentials.  
5. **Perform AWS API actions** using those credentials (e.g. describe instance, metadata requests).  

---

### 🔐 Key Features & Exploits Used

| Feature                         | Purpose / Use                                            |
|----------------------------------|----------------------------------------------------------|
| Web application input vulnerability | Exploits remote code execution                        |
| EC2 Instance Profile / Metadata     | Retrieves temporary AWS credentials                 |
| AWS API Calls via Compromised Role   | Performs actions detectable via CloudTrail          |

---

### 🕵️ Detection Content Provided

Here are the detections and artifacts included in this lab:

- **Detection Queries** in `queries/` that capture important steps (e.g., metadata access, instance attribute description, etc.)  
- **Dashboard JSON** in `dashboards/` showing panels for EC2 metadata / attribute requests, and possibly instance launches  
- **Raw Logs** in `logs/` containing CloudTrail events like `DescribeInstanceAttribute`, `RunInstances`  
- **Screenshots** in `screenshots/` showing where detections trigger in dashboards

---

### 📊 Dashboard Panels Included

- Metadata Access / Instance Role Usage  
- Describe Instance Attribute (userData / metadata attributes)  

---

### 🔒 Mitigation & Lessons

- Enforce IMDSv2 and disable IMDSv1 for EC2 instances  
- Limit EC2 Instance Profile permissions to only what is needed  
- Sanitize web app input to prevent RCE  
- Monitor CloudTrail for unusual instance metadata access and attribute description activity  

---

### 📁 Files in This Project

```

rce\_web\_app/
├── attacks/
├── dashboards/
│   └── rce-web-app-dashboard.json
├── detections/
├── findings/
├── logs/
│   └── relevant CloudTrail JSON logs
├── queries/
│   └── detection‑queries.txt
├── screenshots/
│   └── dashboard evidence images
└── README.md

