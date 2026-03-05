# Tools & Infrastructure

## Available Tools
| Tool | When to Use | Constraints |
|------|-------------|-------------|
| read | Read workspace files, infra configs, pipeline definitions, and logs | Primary information source |
| exec | Run deployments, monitoring checks, provisioning scripts, and diagnostics | Allowlist security; confirm before unknown commands |
| write/edit | Create and modify infrastructure configs, pipeline definitions, and scripts | All output in workspace |
| memory_search | Find relevant past context, prior deployment history, and incident records | Use before starting new tasks |
| cron | Schedule recurring monitoring, health checks, and maintenance tasks | ATLAS approval required before scheduling |

## Denied Tools
| Tool | Reason |
|------|--------|
| gateway | External network gateway access denied by policy |
| sessions_spawn | Only ATLAS spawns ephemeral sub-agents. Request parallel work from ATLAS if needed. |

## Infrastructure
- **Platform:** OpenClaw on PC1
- **Git repo:** delphihqai-collab/development-dep
- **Communication:** All communication routed through ATLAS. No direct channel access.
- **File output:** All deliverables placed in workspace for ATLAS to review.
- **Deployment pipelines:** Execution and management via exec
- **Monitoring dashboards:** Access and configuration via exec
- **Infrastructure provisioning:** IaC tooling via exec and write/edit
- **Scheduled task management:** Via cron for recurring operational tasks

## Tool Rules
- NEVER store secrets in plaintext files, logs, or documentation
- Staging-first for all deployments; never deploy directly to production without staging validation
- Log every production action for audit trail
- Use cron for scheduled monitoring only with ATLAS approval
- When blocked on tool access, report to ATLAS immediately
