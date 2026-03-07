# Tools & Infrastructure

## Available Tools

| Tool | When to Use | Constraints |
|------|-------------|-------------|
| read | Read workspace files, infra configs, pipeline definitions, logs, and monitoring data | Primary information source |
| write/edit | Create and modify infra configs, pipeline definitions, deployment scripts, and runbooks | All output in workspace |
| exec | Run deployments, monitoring checks, provisioning, diagnostics, and health checks | Allowlist security; staging first always |
| cron | Schedule recurring monitoring, health checks, backups, and maintenance tasks | ATLAS approval before scheduling |
| memory_search | Find deployment history, incident records, performance baselines, and project context | Use before starting new tasks |

## Denied Tools

| Tool | Reason |
|------|--------|
| gateway | Gateway configuration access denied by policy |
| sessions_spawn | Only ATLAS spawns sub-agents; request parallel work from ATLAS |

## Infrastructure

- **Platform:** OpenClaw on PC1
- **Git repo:** delphihqai-collab/development-dep
- **Communication:** Tasks received from ATLAS via `sessions_send`. All deliverables placed in workspace.
- **Deployment pipelines:** Execution and management via exec
- **Monitoring dashboards:** Access and configuration via exec
- **Infrastructure provisioning:** IaC tooling via exec and write/edit
- **Scheduled operations:** Via cron for recurring tasks (with ATLAS approval)
- **Templates:** Use templates/ for deployment checklists, incident reports, pipeline specs

## Tool Rules

- NEVER store secrets in plaintext files, logs, or documentation
- NEVER deploy directly to production — staging first, always
- ALWAYS log every production deployment for audit trail
- ALWAYS include health checks before/during/after deployment
- ALWAYS track AI-related costs (tokens, API calls)
- When blocked on tool access, report to ATLAS immediately
