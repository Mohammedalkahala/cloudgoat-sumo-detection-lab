# Detections vs. Findings

This document clarifies the difference between **detections** (high-fidelity alerts) and **findings** (useful context or weak signals) in the lab.

---

## ✅ Detections

These are queries or monitors that should trigger alerts when matched.

| Name                  | Trigger Type | Confidence | Example Action |
|-----------------------|--------------|------------|----------------|
| Excessive AssumeRole Usage | Threshold | High | Alert & Escalate |
| Suspicious S3 Access | Behavior-based | Medium | Alert + Manual Review |
| Lambda Escalation via Role Chaining | Logic-based | High | Alert & Investigate |

**Traits:**
- Actionable
- Tuned to reduce noise
- Should be part of alerting pipelines

---

## 🕵️ Findings

These are queries that surface potentially interesting or unusual behavior but are **not alerts** by default.

| Name                | Trigger Type | Confidence | Usage |
|---------------------|--------------|------------|--------|
| First-time IAM Role Use | Baseline deviation | Low-Med | Hunting |
| Lambda Console Output Includes "sh" | Keyword search | Low | Contextual |
| Rare S3 Bucket Access | Anomaly | Medium | Analyst triage |

**Traits:**
- Used for hunting, triage, enrichment
- May support detections as context
- May produce false positives if not tuned

---

## 🔍 Why This Matters

Mixing detections with findings can lead to:

- Alert fatigue from low-confidence queries
- Missed context during incident response
- Difficulty triaging alerts quickly

---

## 🗂️ Suggested Directory Structure

