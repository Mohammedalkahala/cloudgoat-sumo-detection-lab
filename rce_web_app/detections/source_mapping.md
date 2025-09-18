# Source Mapping
These queries assume `_sourceCategory=aws/cloudtrail`. If your org differs, set:
- CloudTrail source category → `<YOUR_CLOUDTRAIL_SC>`
Then replace `_sourceCategory=aws/cloudtrail` with `_sourceCategory=<YOUR_CLOUDTRAIL_SC>`.

Tip: In Sumo, run:
_sourceCategory=*cloudtrail*
| json "eventSource","eventName"
| count by _sourceCategory
