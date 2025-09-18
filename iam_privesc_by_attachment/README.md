## ✅ CloudGoat IAM Privilege Escalation Lab – 

### 📌 Lab: `iam_privesc_by_attachment`

---

### 🧠 Objective

Simulate an attacker escalating privileges on AWS by abusing misconfigured IAM permissions. The attacker compromises an EC2 instance and uses `iam:AttachUserPolicy` and `iam:CreateAccessKey` to gain full admin access.

---

### 🚀 Attack Narrative

1. **Initial Access**: Attacker gains access to EC2 instance (meek user).
2. **Enumerates IAM Permissions**: Discovers ability to attach policies to their own user.
3. **Attaches AdministratorAccess**: Attaches `arn:aws:iam::aws:policy/AdministratorAccess` to self.
4. **Creates Access Keys**: Generates new access key for their IAM user.
5. **Escalated Control**: Attacker now has full AWS account access via CLI or SDK.

---

### 🔐 Key IAM Actions Exploited

| Action                 | Description                                  |
| ---------------------- | -------------------------------------------- |
| `iam:AttachUserPolicy` | Attach any policy to any user                |
| `iam:CreateAccessKey`  | Generate access keys for programmatic access |

---

### 🕵️ Sumo Logic Detection Queries

#### ✅ 1. Detect IAM Privilege Escalation via `AttachUserPolicy`

```sql
_sourceCategory=aws/cloudtrail "AttachUserPolicy"
| json field=_raw "userIdentity.userName" as user
| json field=_raw "requestParameters.policyArn" as policy
| where policy matches "*AdministratorAccess*"
| count by user, policy
```

---

#### ✅ 2. Detect Access Key Creation via `CreateAccessKey`

```sql
_sourceCategory=aws/cloudtrail "CreateAccessKey"
| json field=_raw "eventTime" as time
| json field=_raw "userIdentity.userName" as user
| json field=_raw "requestParameters.userName" as targetUser
| count by time, user, targetUser
```

---

#### ✅ 3. Detect EC2 Instances Launching with IAM Roles (Optional)

```sql
_sourceCategory=aws/cloudtrail "RunInstances"
| json field=_raw "userIdentity.userName" as user
| json field=_raw "requestParameters.iamInstanceProfile.arn" as iamRole
| count by user, iamRole
```

---

### 📊 Dashboard Panels (Suggested)

* **Attach Admin Policy Detection** (bar chart or table)
* **Access Key Creation Events** (timeline)
* **IAM Role Usage by EC2** (table)

---

### 🔒 Mitigation

* Apply **least privilege** to IAM users and roles.
* Enable **CloudTrail logging** and **real-time alerting**.
* Monitor for `iam:AttachUserPolicy` and `iam:CreateAccessKey` actions.

---

### 📁 Files in This Project

```
.
├── README.md
├── dashboards/
│   └── iam-privesc-dashboard.json
├── screenshots/
│   ├── attach-user-policy-detection.png
│   └── access-key-created.png
└── logs/
    └── cloudtrail.json
```

---

### 📝 Notes

* CloudGoat user: `kerrigan`
* Initial EC2 role: `cg-ec2-meek-role-cglab4`
* Escalated policy: `AdministratorAccess`
* New access key created with full privileges

