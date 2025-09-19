---

### ✅ `setup/cloudgoat_setup.md`

````md
# ☁️ CloudGoat Setup Guide

This guide covers the exact steps used to deploy **CloudGoat scenarios** (`iam_privesc_by_attachment`, `rce_web_app`) and connect them to **Sumo Logic** for detection analysis.

> ✅ This was tested in a constrained AWS environment (e.g. AWS CloudShell) with limited space.

---

## 📦 Prerequisites

- An AWS account with admin access
- AWS CLI configured (`aws configure`)
- Sumo Logic set up with AWS CloudTrail ingest (optional)
- [Terraform](https://developer.hashicorp.com/terraform/downloads) installed

---

## 🔧 Step-by-Step Setup

### 1️⃣ Clone CloudGoat

```bash
git clone https://github.com/RhinoSecurityLabs/cloudgoat.git
````

---

### 2️⃣ Configure Environment Variables

```bash
export CGID="cglab4"
export YOUR_IP="$(curl -s https://checkip.amazonaws.com | tr -d '\n')"
export SAFE_DIR="/aws/mde/cloudgoat-lab"
export REPO_DIR="$SAFE_DIR/cloudgoat"
export WORKDIR="$REPO_DIR/scenarios/aws/iam_privesc_by_attachment/terraform"
export SSH_KEY_DIR="$REPO_DIR/keys"
export GITHUB_REPO_DIR="$SAFE_DIR/cloudgoat-sumo-detection-lab"
```

---

### 3️⃣ Clone CloudGoat to Safe Volume (Avoid `/home`)

```bash
sudo git clone https://github.com/RhinoSecurityLabs/cloudgoat.git "$REPO_DIR"
sudo chown -R $(whoami):$(whoami) "$REPO_DIR"
```

---

### 4️⃣ Generate SSH Key Pair

```bash
mkdir -p "$SSH_KEY_DIR"

if [ ! -f "$SSH_KEY_DIR/cloudgoat.pub" ]; then
    echo "[+] Generating new SSH key..."
    ssh-keygen -t rsa -b 4096 -f "$SSH_KEY_DIR/cloudgoat" -N ""
fi

cp "$SSH_KEY_DIR/cloudgoat.pub" "$REPO_DIR/cloudgoat.pub"
```

---

### 5️⃣ Use Free Tier EC2 Instance Type

```bash
cd "$WORKDIR"
sed -i 's/instance_type *= *".*"/instance_type = "t3.micro"/' ec2.tf
```

---

### 6️⃣ Prevent Terraform Disk Errors (CloudShell Fix)

#### Create a Terraform plugin cache on safe volume:

```bash
mkdir -p /aws/mde/cloudgoat-lab/.terraform-plugin-cache
export TF_PLUGIN_CACHE_DIR="/aws/mde/cloudgoat-lab/.terraform-plugin-cache"
```

#### Make this permanent:

```bash
echo 'export TF_PLUGIN_CACHE_DIR="/aws/mde/cloudgoat-lab/.terraform-plugin-cache"' >> ~/.bashrc
source ~/.bashrc
```

#### Fix permissions:

```bash
sudo chown -R $(whoami):$(whoami) /aws/mde/cloudgoat-lab/.terraform-plugin-cache
```

---

### 7️⃣ Initialize Terraform

```bash
cd "$WORKDIR"
rm -rf .terraform
terraform init
```

---

### 8️⃣ Deploy the Scenario (IAM PrivEsc or RCE)

```bash
terraform apply -auto-approve \
  -var="cgid=${CGID}" \
  -var="cg_whitelist=[\"${YOUR_IP}/32\"]"
```

---

## 🧹 Tear Down Afterward

```bash
terraform destroy -auto-approve \
  -var="cgid=${CGID}" \
  -var="cg_whitelist=[\"${YOUR_IP}/32\"]"
```

---

