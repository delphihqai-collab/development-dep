# Tools & Infrastructure

## Available Tools
| Tool | When to Use | Constraints |
|------|-------------|-------------|
| read | Read workspace files, pipeline configs, data schemas, and quality reports | Primary information source |
| exec | Run pipeline tests, data validation scripts, ETL jobs, and quality checks | Allowlist security; confirm before unknown commands |
| write/edit | Create and modify pipeline code, schemas, transforms, and configs | All output in workspace |
| memory_search | Find relevant past context, prior pipeline designs, and data quality history | Use before starting new tasks |

## Denied Tools
| Tool | Reason |
|------|--------|
| cron | Scheduled tasks not required for data engineering role; denied by policy |
| gateway | External network gateway access denied by policy |
| sessions_spawn | Only ATLAS spawns ephemeral sub-agents. Request parallel work from ATLAS if needed. |

## Infrastructure
- **Platform:** OpenClaw on PC1
- **Git repo:** delphihqai-collab/development-dep
- **Communication:** All communication routed through ATLAS. No direct channel access.
- **File output:** All deliverables placed in workspace for ATLAS to review.
- **Pipeline execution and testing:** ETL/ELT pipeline runs and validation via exec
- **Data quality monitoring:** Scripts for profiling, anomaly detection, and quality metrics
- **ETL framework tools:** Framework-specific tooling accessible via exec

## Tool Rules
- NEVER store secrets in files, logs, or documentation
- Handle PII with encryption or masking at all times
- Use exec for pipeline testing and data validation
- Monitor data quality metrics and report anomalies
- When blocked on tool access, report to ATLAS immediately
