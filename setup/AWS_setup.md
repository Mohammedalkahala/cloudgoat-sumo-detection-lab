# ✅ Sumo Logic Integration with AWS CloudTrail

> This guide shows how to configure AWS and Sumo Logic to forward CloudTrail logs for security detection, using the **Sumo Logic free trial**.

---

## 🟢 1. Sign Up for Sumo Logic Free Trial

- Go to: [https://www.sumologic.com](https://www.sumologic.com)
- Click **“Start Free Trial”**


---

## 🟢 2. Create an S3 Bucket for CloudTrail Logs

You need an S3 bucket to store CloudTrail logs.

```bash
aws s3 mb s3://your-cloudtrail-logs-bucket
````

Make sure the bucket name is globally unique.

---

## 🟢 3. Enable CloudTrail in AWS

```bash
aws cloudtrail create-trail \
  --name sumo-trail \
  --s3-bucket-name your-cloudtrail-logs-bucket \
  --is-multi-region-trail

aws cloudtrail start-logging --name sumo-trail
```

> This enables logging of **management events** to your S3 bucket across all regions.

---

## 🟢 4. Create IAM Role for Sumo Logic

Go to **IAM > Roles** in AWS and create a role with the following:

### 📌 **Trust Policy** (replace `SUMO_ACCOUNT_ID` and `EXTERNAL_ID`):

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::SUMO_ACCOUNT_ID:root"
      },
      "Action": "sts:AssumeRole",
      "Condition": {
        "StringEquals": {
          "sts:ExternalId": "YOUR_SUMO_EXTERNAL_ID"
        }
      }
    }
  ]
}
```

### 📌 **Permissions Policy** (attach this policy):

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "s3:GetObject",
        "s3:ListBucket"
      ],
      "Resource": [
        "arn:aws:s3:::your-cloudtrail-logs-bucket",
        "arn:aws:s3:::your-cloudtrail-logs-bucket/*"
      ]
    }
  ]
}
```

---

## 🟢 5. Add CloudTrail Source in Sumo Logic

In Sumo:

1. Go to **Manage Data > Collection**
2. Click **“Add Collector”**
3. Choose **“Hosted Collector”**
4. Add a **CloudTrail Source**
5. Provide:

   * S3 Bucket name
   * Path Expression: `*`
   * Region
   * IAM Role ARN (from previous step)
   * External ID (from Sumo UI)

---

## 🟢 6. Confirm Logs Are Ingested

Go to **Search** in Sumo Logic and run:

```sql
_sourceCategory=aws/cloudtrail
| limit 20
```

You should start seeing CloudTrail logs — including IAM activity, EC2 launches, and more.

---

## ✅ Summary

| Step                     | Description                      |
| ------------------------ | -------------------------------- |
| Create S3 Bucket         | Stores your CloudTrail logs      |
| Enable CloudTrail        | Sends logs to the S3 bucket      |
| IAM Role for Sumo        | Grants Sumo access to the bucket |
| Add Source in Sumo Logic | Connect Sumo to AWS CloudTrail   |
| Query Events             | View logs in Sumo’s Search       |
