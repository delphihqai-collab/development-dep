# Tools & Infrastructure

## Available Tools

| Tool | When to Use | Constraints |
|------|-------------|-------------|
| read | Read workspace files, model configs, prompt templates, eval datasets, and code | Primary information source |
| write/edit | Create and modify prompts, model configs, eval harnesses, agent specs, and code | All output in workspace |
| exec | Run eval pipelines, model testing, token cost scripts, experiments, and benchmarks | Allowlist security; confirm before unknown commands |
| memory_search | Find prior eval results, prompt versions, model comparisons, and project context | Use before starting new tasks |

## Denied Tools

| Tool | Reason |
|------|--------|
| cron | Scheduled tasks not required for AI engineering role |
| gateway | Gateway configuration access denied by policy |
| sessions_spawn | Only ATLAS spawns sub-agents; request parallel work from ATLAS |

## Infrastructure

- **Platform:** OpenClaw on PC1
- **Git repo:** delphihqai-collab/development-dep
- **Communication:** Tasks received from ATLAS via `sessions_send`. All deliverables placed in workspace.
- **Model API access:** For testing and evaluation via exec
- **Eval framework:** Run evaluation suites and benchmarks via exec
- **Token cost monitoring:** Scripts for tracking model interaction costs
- **Templates:** Use templates/ for eval reports, model selection reports, agent design specs

## Tool Rules

- NEVER store secrets or API keys in files, logs, or documentation
- ALWAYS track token costs for every model interaction
- ALWAYS version all prompts as files in the workspace
- Use exec for eval pipelines and model testing
- When blocked on tool access, report to ATLAS immediately
