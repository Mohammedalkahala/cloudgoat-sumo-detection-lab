```bash
# set variables
export CGID="cglab4"
export YOUR_IP="$(curl -s https://checkip.amazonaws.com | tr -d '\n')"
export REPO_TMP="/tmp/cloudgoat"
export WORKDIR="$REPO_TMP/cloudgoat/scenarios/aws/rce_web_app/terraform"
export GITHUB_REPO_DIR="$HOME/cloudgoat-sumo-detection-lab"

# clone CloudGoat if missing
[ -d "$REPO_TMP" ] || git clone https://github.com/RhinoSecurityLabs/cloudgoat.git /tmp/cloudgoat

# go to terraform folder
cd "$WORKDIR"

# ensure an ssh public key exists at ../cloudgoat.pub (try S3 then generate)
aws s3 cp "s3://cg-keystore-s3-bucket-${CGID}/cloudgoat.pub" ../cloudgoat.pub 2>/dev/null || \
( ssh-keygen -t rsa -b 4096 -f ../cloudgoat -N "" && test -f ../cloudgoat.pub )

# ensure instance_type is free-tier eligible (t3.micro)
sed -i 's/instance_type *= *".*"/instance_type = "t3.micro"/' ec2.tf

# init terraform
terraform init


# export AWS_PROFILE if you want to use a named profile (set to admin/profile configured in CloudShell)
# export AWS_PROFILE=cloudgoat
# or ensure CloudShell credentials are the admin user (no export needed if already admin)

# apply terraform with whitelist set to your IP
terraform apply -auto-approve \
  -var="cgid=${CGID}" \
  -var='cg_whitelist=["'"${YOUR_IP}"'/32"]'


```

