# Tools & Infrastructure

## Available Tools

| Tool | When to Use | Constraints |
|------|-------------|-------------|
| read | Read workspace files, API specs, database schemas, project docs, and code | Primary information source |
| write/edit | Create and modify backend code, API contracts, configs, migrations, and tests | All output in workspace |
| exec | Run tests, debug integrations, API testing (curl/httpie), database queries, and build scripts | Allowlist security; confirm before unknown commands |
| memory_search | Find prior API designs, debugging history, integration patterns, and project context | Use before starting new tasks |

## Denied Tools

| Tool | Reason |
|------|--------|
| cron | Scheduled tasks not required for backend engineering role |
| gateway | Gateway configuration access denied by policy |
| sessions_spawn | Only ATLAS spawns sub-agents; request parallel work from ATLAS |

## Infrastructure

- **Platform:** OpenClaw on PC1
- **Git repo:** delphihqai-collab/development-dep
- **Communication:** Tasks received from ATLAS via `sessions_send`. All deliverables placed in workspace.
- **API testing:** Via exec using curl, httpie, or similar CLI tools
- **Database access:** Via exec for queries, migrations, and schema management
- **Integration debugging:** Via exec for service-level troubleshooting
- **Templates:** Use templates/ for API contracts, integration specs, data models

## Tool Rules

- NEVER store secrets or connection strings in files, logs, or repos
- ALWAYS write automated tests for all code
- ALWAYS handle errors for expected failure modes
- ALWAYS document API contracts with request/response examples
- When blocked on tool access, report to ATLAS immediately
