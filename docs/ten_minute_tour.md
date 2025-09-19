# 10-Minute Tour
1) Deploy rce_web_app (see setup/terraform_commands.md).
2) Run the exploit (RCE → IMDS → AssumeRole).
3) In Sumo, set time to your attack window.
4) Open dashboard.json; verify panels render.
5) Run the three queries in detections/sumo_queries.txt.
6) Triage using detections/detection_runbook.md.
7) Destroy stack.

