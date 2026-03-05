# Tools & Infrastructure

## Available Tools
| Tool | When to Use | Constraints |
|------|-------------|-------------|
| read | Read workspace files, API specs, database schemas, and project docs | Primary information source |
| exec | Run tests, debug integrations, execute curl/httpie for API testing, database queries | Allowlist security; confirm before unknown commands |
| write/edit | Create and modify backend code, API contracts, configs, and migrations | All output in workspace |
| memory_search | Find relevant past context, prior API designs, and debugging history | Use before starting new tasks |

## Denied Tools
| Tool | Reason |
|------|--------|
| cron | Scheduled tasks not required for backend engineering role; denied by policy |
| gateway | External network gateway access denied by policy |
| sessions_spawn | Only ATLAS spawns ephemeral sub-agents. Request parallel work from ATLAS if needed. |

## Infrastructure
- **Platform:** OpenClaw on PC1
- **Git repo:** delphihqai-collab/development-dep
- **Communication:** All communication routed through ATLAS. No direct channel access.
- **File output:** All deliverables placed in workspace for ATLAS to review.
- **API testing:** Via exec using curl, httpie, or similar CLI tools
- **Database access:** Via exec for queries and migrations
- **Integration debugging:** Via exec for service-level troubleshooting

## Tool Rules
- NEVER store secrets in files, logs, or documentation
- NEVER commit credentials or connection strings to the repository
- Use exec for running tests and debugging integrations
- All API contracts documented in the workspace
- When blocked on tool access, report to ATLAS immediately
