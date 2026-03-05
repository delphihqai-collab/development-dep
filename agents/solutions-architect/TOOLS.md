# Tools & Infrastructure

## Available Tools
| Tool | When to Use | Constraints |
|------|-------------|-------------|
| read | Read workspace files and project docs | Primary information source |
| exec | Run scripts, tests, builds | Allowlist security; ask on unknown commands |
| write/edit | Create and modify files | All output in workspace |
| memory_search | Find relevant past context | Use before starting new tasks |

## Infrastructure
- **Platform:** OpenClaw on PC1
- **Git repo:** delphihqai-collab/development-dep
- **Communication:** All communication routed through ATLAS. No direct channel access.
- **File output:** All deliverables placed in workspace for ATLAS to review.

## Tool Rules
- NEVER store secrets in files, logs, or documentation
- ALWAYS confirm before executing actions that modify external systems
- When blocked on tool access, report to ATLAS immediately
