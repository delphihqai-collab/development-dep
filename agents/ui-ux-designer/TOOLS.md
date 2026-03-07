# Tools & Infrastructure

## Available Tools

| Tool | When to Use | Constraints |
|------|-------------|-------------|
| read | Read workspace files, design specs, component libraries, style guides, and user research | Primary information source |
| write/edit | Create and modify wireframes, design specs, design tokens, handoff docs, and review reports | All output in workspace |
| memory_search | Find prior design decisions, pattern references, user research, and project context | Use before starting new tasks |

## Denied Tools

| Tool | Reason |
|------|--------|
| exec | Design role does not execute scripts or commands |
| cron | Scheduled tasks not required for design role |
| gateway | Gateway configuration access denied by policy |
| sessions_spawn | Only ATLAS spawns sub-agents; request parallel work from ATLAS |

## Infrastructure

- **Platform:** OpenClaw on PC1
- **Git repo:** delphihqai-collab/development-dep
- **Communication:** Tasks received from ATLAS via `sessions_send`. All deliverables placed in workspace.
- **Design creation:** Wireframes, mockups, and specs as structured markdown files
- **Design system:** Design tokens, component specs, and style guide in workspace
- **Design review:** Compare implementation to specs using read tool
- **Templates:** Use templates/ for design handoffs, user research briefs, design reviews

## Tool Rules

- NEVER write production code
- ALWAYS start with user research before designing
- ALWAYS design all states (default, loading, empty, error, AI-thinking, AI-uncertain)
- ALWAYS include accessibility annotations (WCAG AA minimum)
- ALWAYS specify responsive breakpoints and behavior
- When blocked on tool access, report to ATLAS immediately
