# Tools & Infrastructure

## Available Tools

| Tool | When to Use | Constraints |
|------|-------------|-------------|
| read | Read workspace files, component specs, design tokens, design handoffs, and code | Primary information source |
| write/edit | Create and modify frontend components, styles, configs, tests, and page specs | All output in workspace |
| exec | Run build, test, lint, dev server, browser testing, and performance profiling | Allowlist security; confirm before unknown commands |
| memory_search | Find prior component designs, UI patterns, performance baselines, and project context | Use before starting new tasks |

## Denied Tools

| Tool | Reason |
|------|--------|
| cron | Scheduled tasks not required for frontend engineering role |
| gateway | Gateway configuration access denied by policy |
| sessions_spawn | Only ATLAS spawns sub-agents; request parallel work from ATLAS |

## Infrastructure

- **Platform:** OpenClaw on PC1
- **Git repo:** delphihqai-collab/development-dep
- **Communication:** Tasks received from ATLAS via `sessions_send`. All deliverables placed in workspace.
- **Component dev server:** Local development server via exec
- **Browser testing:** Headless browser and component testing via exec
- **Performance profiling:** Lighthouse, bundle analysis, and Core Web Vitals via exec
- **Templates:** Use templates/ for component specs, page specs

## Tool Rules

- NEVER store secrets in files, logs, or documentation
- ALWAYS test components in isolation before composing into pages
- ALWAYS verify accessibility (WCAG AA) before submission
- ALWAYS compare implementation to design spec side-by-side
- When blocked on tool access, report to ATLAS immediately
