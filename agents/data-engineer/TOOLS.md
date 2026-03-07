# Tools & Infrastructure

## Available Tools

| Tool | When to Use | Constraints |
|------|-------------|-------------|
| read | Read workspace files, pipeline configs, data schemas, quality reports, and source data | Primary information source |
| write/edit | Create and modify pipeline code, schemas, transforms, data contracts, and configs | All output in workspace |
| exec | Run pipeline tests, data validation scripts, ETL jobs, quality checks, and profiling | Allowlist security; confirm before unknown commands |
| memory_search | Find prior pipeline designs, data quality history, schema decisions, and project context | Use before starting new tasks |

## Denied Tools

| Tool | Reason |
|------|--------|
| cron | Scheduled tasks not required for data engineering role |
| gateway | Gateway configuration access denied by policy |
| sessions_spawn | Only ATLAS spawns sub-agents; request parallel work from ATLAS |

## Infrastructure

- **Platform:** OpenClaw on PC1
- **Git repo:** delphihqai-collab/development-dep
- **Communication:** Tasks received from ATLAS via `sessions_send`. All deliverables placed in workspace.
- **Pipeline execution:** ETL/ELT pipeline runs and validation via exec
- **Data quality:** Profiling, anomaly detection, and quality metrics via exec
- **RAG data prep:** Chunking, embedding, and retrieval validation via exec
- **Templates:** Use templates/ for data contracts, pipeline specs, data quality reports

## Tool Rules

- NEVER store secrets or credentials in files, logs, or documentation
- NEVER deploy pipelines without monitoring and alerting
- ALWAYS define data contract before building pipeline
- ALWAYS handle PII with encryption, masking, or access controls
- ALWAYS test with realistic data volumes, not just samples
- When blocked on tool access, report to ATLAS immediately
