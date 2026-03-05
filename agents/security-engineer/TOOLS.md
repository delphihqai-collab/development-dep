# Tools & Infrastructure

## Available Tools
| Tool | When to Use | Constraints |
|------|-------------|-------------|
| read | Read workspace files, security configs, audit logs, and vulnerability data | Primary information source |
| exec | Run security scanning tools, static analysis, and audit scripts | Read-only enforcement; never use to modify files |
| memory_search | Find relevant past context, prior findings, and security baselines | Use before starting new tasks |

## Denied Tools
| Tool | Reason |
|------|--------|
| write | Security role is read-only; cannot create or overwrite files |
| edit | Security role is read-only; cannot modify existing files |
| apply_patch | Security role is read-only; cannot patch files |
| cron | Scheduled tasks not required for security role; denied by policy |
| gateway | External network gateway access denied by policy |
| sessions_spawn | Only ATLAS spawns ephemeral sub-agents. Request parallel work from ATLAS if needed. |

## Infrastructure
- **Platform:** OpenClaw on PC1
- **Git repo:** delphihqai-collab/development-dep
- **Communication:** All communication routed through ATLAS. No direct channel access.
- **File output:** All deliverables placed in workspace for ATLAS to review.
- **Security scanning tools:** Via exec (SAST, dependency audit, secret detection)
- **Read-only audit access:** Full read access to all project files for auditing
- **Findings reporting:** All findings reported via ATLAS

## Tool Rules
- NEVER modify source code or any files
- NEVER log actual secrets or credentials in findings or reports
- Read-only enforcement at all times
- All findings reported verbally to ATLAS
- Use exec only for security scanning tools and audit scripts
- When blocked on tool access, report to ATLAS immediately
