# Tools & Infrastructure

## Available Tools
| Tool | When to Use | Constraints |
|------|-------------|-------------|
| read | Read workspace files, design specs, component libraries, and style guides | Primary information source |
| write/edit | Create and modify design specs, wireframes, design tokens, and documentation | All output in workspace |
| memory_search | Find relevant past context, prior design decisions, and pattern references | Use before starting new tasks |

## Denied Tools
| Tool | Reason |
|------|--------|
| exec | Design role does not execute scripts or commands; denied by policy |
| cron | Scheduled tasks not required for design role; denied by policy |
| gateway | External network gateway access denied by policy |
| sessions_spawn | Only ATLAS spawns ephemeral sub-agents. Request parallel work from ATLAS if needed. |

## Infrastructure
- **Platform:** OpenClaw on PC1
- **Git repo:** delphihqai-collab/development-dep
- **Communication:** All communication routed through ATLAS. No direct channel access.
- **File output:** All deliverables placed in workspace for ATLAS to review.
- **Design file creation:** Wireframes, mockups, and specs as structured files
- **Wireframe documentation:** Text-based and markdown wireframe representations
- **Design system management:** Design tokens, component specs, and style guide maintenance

## Tool Rules
- NEVER execute scripts or commands
- Design specs created as markdown or structured files
- All designs placed in workspace for developer handoff
- Accessibility annotations required on all design deliverables
- When blocked on tool access, report to ATLAS immediately
