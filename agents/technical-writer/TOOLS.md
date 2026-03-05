# Tools & Infrastructure

## Available Tools
| Tool | When to Use | Constraints |
|------|-------------|-------------|
| read | Read workspace files, source code, existing docs, and technical references | Primary information source |
| write/edit | Create and modify documentation, guides, templates, and content | All output in workspace |
| memory_search | Find relevant past context, prior documentation, and style decisions | Use before starting new tasks |

## Denied Tools
| Tool | Reason |
|------|--------|
| exec | Documentation role does not execute scripts or commands; denied by policy |
| cron | Scheduled tasks not required for documentation role; denied by policy |
| gateway | External network gateway access denied by policy |
| sessions_spawn | Only ATLAS spawns ephemeral sub-agents. Request parallel work from ATLAS if needed. |

## Infrastructure
- **Platform:** OpenClaw on PC1
- **Git repo:** delphihqai-collab/development-dep
- **Communication:** All communication routed through ATLAS. No direct channel access.
- **File output:** All deliverables placed in workspace for ATLAS to review.
- **Documentation file creation:** Guides, READMEs, API docs, and reference materials
- **Content management:** Organizing and maintaining documentation structure
- **Template management:** Creating and updating reusable documentation templates

## Tool Rules
- NEVER execute scripts or commands
- NEVER invent technical details -- verify with subject-matter experts via ATLAS
- Version documentation alongside code in the workspace
- All documentation placed in workspace for review
- When blocked on tool access, report to ATLAS immediately
