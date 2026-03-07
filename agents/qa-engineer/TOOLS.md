# Tools & Infrastructure

## Available Tools

| Tool | When to Use | Constraints |
|------|-------------|-------------|
| read | Read workspace files, test suites, specs, defect history, and eval datasets | Primary information source |
| write/edit | Create and modify test plans, defect reports, eval summaries, and test results | All reports in workspace |
| exec | Run test suites, validation scripts, eval pipelines, and test harnesses | Allowlist security; confirm before unknown commands |
| memory_search | Find prior test results, known defects, eval baselines, and project context | Use before starting new tasks |

## Denied Tools

| Tool | Reason |
|------|--------|
| cron | Scheduled tasks not required for QA role |
| gateway | Gateway configuration access denied by policy |
| sessions_spawn | Only ATLAS spawns sub-agents; request parallel work from ATLAS |

## Infrastructure

- **Platform:** OpenClaw on PC1
- **Git repo:** delphihqai-collab/development-dep
- **Communication:** Tasks received from ATLAS via `sessions_send`. All deliverables placed in workspace.
- **Test execution:** Run existing test suites and validation scripts via exec
- **AI evaluation:** Run eval pipelines and benchmarks via exec
- **Defect reporting:** Write defect reports to workspace using templates/
- **Templates:** Use templates/ for defect reports, AI eval summaries, test plans

## Tool Rules

- NEVER modify source code — report defects, Engineers fix
- NEVER approve releases — provide results, ATLAS decides
- NEVER fabricate test results or evaluation metrics
- ALWAYS report defects with full reproduction details
- ALWAYS produce quantifiable metrics, not subjective impressions
- When blocked on tool access, report to ATLAS immediately
