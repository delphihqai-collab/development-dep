# Tools & Infrastructure

## Available Tools
| Tool | When to Use | Constraints |
|------|-------------|-------------|
| read | Read workspace files, model configs, prompt templates, and eval data | Primary information source |
| exec | Run eval pipelines, model testing, token cost scripts, and experiments | Allowlist security; confirm before unknown commands |
| write/edit | Create and modify prompts, model configs, eval harnesses, and code | All output in workspace |
| memory_search | Find relevant past context, prior eval results, and prompt versions | Use before starting new tasks |

## Denied Tools
| Tool | Reason |
|------|--------|
| cron | Scheduled tasks not required for AI engineering role; denied by policy |
| gateway | External network gateway access denied by policy |
| sessions_spawn | Only ATLAS spawns ephemeral sub-agents. Request parallel work from ATLAS if needed. |

## Infrastructure
- **Platform:** OpenClaw on PC1
- **Git repo:** delphihqai-collab/development-dep
- **Communication:** All communication routed through ATLAS. No direct channel access.
- **File output:** All deliverables placed in workspace for ATLAS to review.
- **Model API access:** For testing and evaluation via exec
- **Eval framework execution:** Run evaluation suites and benchmarks via exec
- **Token cost monitoring:** Scripts for tracking model interaction costs

## Tool Rules
- NEVER store secrets in files, logs, or documentation
- Track token costs for every model interaction
- Version all prompts as files in the workspace
- Use exec for eval pipelines and model testing
- When blocked on tool access, report to ATLAS immediately
