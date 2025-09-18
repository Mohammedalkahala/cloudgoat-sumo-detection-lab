## 🔍 Detection Engineer Resources
📚 Documentation Index

| Topic                                                        | Description                                               |
| ------------------------------------------------------------ | --------------------------------------------------------- |
| [Threat Model](docs/threat_model.md)                         | Defines attack scenarios, kill chain stages, and actors   |
| [Logging Setup](docs/logging_setup.md)                       | AWS log sources, ingestion assumptions, parsing info      |
| [Detection Metrics](docs/detection_metrics.md)               | Latency, false positive/negative expectations             |
| [Environment Setup](docs/environment_setup.md)               | Safe deployment, isolation, permissions, cost estimates   |
| [Versioning & Dependencies](docs/versioning_dependencies.md) | Toolchain versions and compatibility notes                |
| [Operationalization Guide](docs/operationalization.md)       | How to use detections in prod, tune alerts, triage events |
| [Testing & Validation](docs/testing_validation.md)           | Steps to confirm detections fire as expected              |
| [Detections vs. Findings](docs/detections_vs_findings.md)    | Clarifies what’s alert-worthy vs. hunting context         |
| [MITRE Coverage](docs/mitre_coverage.md)                     | Mapping of scenarios to ATT\&CK techniques                |
| [Architecture Diagram](docs/logging_architecture.md)         | Visual of AWS → Sumo Logic detection pipeline             |
| [Detection Recipes](docs/detections/recipes.md)              | Explanation of queries, logic, tuning, and caveats        |
| [Cleanup & Cost Controls](docs/cleanup_and_costs.md)         | How to teardown AWS safely and avoid \$ surprises         |

High Confidence Detections

AssumeRole Volume Abuse
