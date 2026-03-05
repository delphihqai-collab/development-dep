# Tools & Infrastructure

## Available Tools
| Tool | When to Use | Constraints |
|------|-------------|-------------|
| read | Read workspace files, component specs, design tokens, and project docs | Primary information source |
| exec | Run build, test, lint, browser testing, and performance profiling | Allowlist security; confirm before unknown commands |
| write/edit | Create and modify frontend components, styles, configs, and tests | All output in workspace |
| memory_search | Find relevant past context, prior component designs, and UI patterns | Use before starting new tasks |

## Denied Tools
| Tool | Reason |
|------|--------|
| cron | Scheduled tasks not required for frontend engineering role; denied by policy |
| gateway | External network gateway access denied by policy |
| sessions_spawn | Only ATLAS spawns ephemeral sub-agents. Request parallel work from ATLAS if needed. |

## Infrastructure
- **Platform:** OpenClaw on PC1
- **Git repo:** delphihqai-collab/development-dep
- **Communication:** All communication routed through ATLAS. No direct channel access.
- **File output:** All deliverables placed in workspace for ATLAS to review.
- **Browser testing:** Via exec for headless browser and component testing
- **Component dev server:** Local development server via exec
- **Performance profiling:** Lighthouse, bundle analysis, and profiling tools via exec

## Tool Rules
- NEVER store secrets in files, logs, or documentation
- Use exec for build, test, and lint workflows
- Component testing before page composition
- Performance profiling before submission
- When blocked on tool access, report to ATLAS immediately
