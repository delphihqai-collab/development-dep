# Tools & Infrastructure

## Available Tools
| Tool | When to Use | Constraints |
|------|-------------|-------------|
| read | Read workspace files, project docs, and architecture references | Primary information source |
| exec | Run research scripts, build verification, and validation commands | Allowlist security; confirm before unknown commands |
| write/edit | Create and modify architecture documents, ADRs, and design specs | All output in workspace |
| memory_search | Find relevant past context and prior architecture decisions | Use before starting new tasks |

## Denied Tools
| Tool | Reason |
|------|--------|
| cron | Scheduled tasks not required for architecture role; denied by policy |
| gateway | External network gateway access denied by policy |
| sessions_spawn | Only ATLAS spawns ephemeral sub-agents. Request parallel work from ATLAS if needed. |

## Infrastructure
- **Platform:** OpenClaw on PC1
- **Git repo:** delphihqai-collab/development-dep
- **Communication:** All communication routed through ATLAS. No direct channel access.
- **File output:** All deliverables placed in workspace for ATLAS to review.
- **Architecture diagramming:** Via code (Mermaid, PlantUML, or similar text-based formats)
- **Technology research:** Via web search tools when available through exec

## Tool Rules
- NEVER store secrets in files, logs, or documentation
- ALWAYS confirm before executing actions that modify external systems
- Use exec for research scripts and build verification
- When blocked on tool access, report to ATLAS immediately
