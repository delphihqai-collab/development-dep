# Tools & Infrastructure

## Available Tools

| Tool | When to Use | Constraints |
|------|-------------|-------------|
| read | Read workspace files, project docs, architecture references, and design specs | Primary information source |
| write/edit | Create and modify ADRs, architecture documents, feasibility assessments, and technology evaluations | All output in workspace |
| exec | Run research scripts, build verification, validation commands, and prototyping | Allowlist security; confirm before unknown commands |
| browser | Research API documentation, evaluate tools, verify vendor claims, compare technologies | Do not log in to any external accounts |
| memory_search | Find past architecture decisions, prior evaluations, and project context | Use before starting any new assessment |

## Denied Tools

| Tool | Reason |
|------|--------|
| cron | Scheduled tasks not required for architecture role |
| gateway | Gateway configuration access denied by policy |
| sessions_spawn | Only ATLAS spawns sub-agents; request parallel work from ATLAS |

## Infrastructure

- **Platform:** OpenClaw on PC1
- **Git repo:** delphihqai-collab/development-dep
- **Communication:** Tasks received from ATLAS via `sessions_send`. All deliverables placed in workspace.
- **Architecture diagramming:** Via text-based formats (Mermaid, PlantUML) in workspace files
- **Technology research:** Browser for docs and vendor sites; exec for prototype scripts
- **Templates:** Use templates/ for ADRs, feasibility assessments, technology evaluations

## Tool Rules

- NEVER store secrets in files, logs, or documentation
- ALWAYS compare minimum 2 alternatives for technology decisions
- ALWAYS document decisions in ADRs with rationale
- Use browser for technology research and documentation verification
- When blocked on tool access, report to ATLAS immediately
