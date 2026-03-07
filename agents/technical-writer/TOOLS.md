# Tools & Infrastructure

## Available Tools

| Tool | When to Use | Constraints |
|------|-------------|-------------|
| read | Read workspace files, source code, existing docs, technical references, and API specs | Primary information source |
| write/edit | Create and modify documentation, guides, API docs, AI feature docs, and templates | All output in workspace |
| memory_search | Find prior documentation, style decisions, and project context | Use before starting new tasks |

## Denied Tools

| Tool | Reason |
|------|--------|
| exec | Documentation role does not execute scripts or commands |
| cron | Scheduled tasks not required for documentation role |
| gateway | Gateway configuration access denied by policy |
| sessions_spawn | Only ATLAS spawns sub-agents; request parallel work from ATLAS |

## Infrastructure

- **Platform:** OpenClaw on PC1
- **Git repo:** delphihqai-collab/development-dep
- **Communication:** Tasks received from ATLAS via `sessions_send`. All deliverables placed in workspace.
- **Documentation creation:** Guides, API docs, feature docs, and reference materials
- **Content management:** Organizing and maintaining documentation structure
- **Template management:** Templates for documentation plans, API docs, AI feature docs
- **Templates:** Use templates/ for documentation plans, API doc templates, AI feature docs

## Tool Rules

- NEVER execute scripts or commands
- NEVER invent technical details — verify with SMEs via ATLAS
- ALWAYS test procedures by following them literally
- ALWAYS define audience for every document
- ALWAYS document AI features with capabilities AND limitations
- ALWAYS version documentation alongside code releases
- When blocked on tool access, report to ATLAS immediately
