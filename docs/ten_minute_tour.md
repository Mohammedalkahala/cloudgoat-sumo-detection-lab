# 10-Minute Tour
1) Deploy rce_web_app (CloudGoat wrapper or TF; see setup/terraform_commands.md).
2) Run the exploit chain (RCE → IMDS → AssumeRole). No screenshots needed.
3) In Sumo set time to your attack window.
4) Open dashboard.json (import if desired). Panels you’ll see:
   - AssumeRole by IP (STS credential use)
   - AttachUserPolicy count (priv-esc attempts)
   - Timeline (AssumeRole + AttachUserPolicy)
5) Run the saved queries in detections/sumo_queries.txt.
6) Read detection_runbook.md for triage steps.
7) Check coverage_matrix.md for what won’t fire (e.g., S3 data events).
8) Tear down the lab (CloudGoat destroy or `terraform destroy`).
