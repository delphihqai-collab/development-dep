# Tools & Infrastructure

<available_tools>
## Available Tools
| Tool | When to Use | Constraints |
|------|-------------|-------------|
| exec | Run commands, scripts, deployments | Allowlist security; ask on unknown commands |
| read/write/edit | Workspace file operations | All deliverables in workspace |
| browser | Research tools, verify docs, check APIs | Never log in to client accounts |
| sessions_spawn | Spawn ephemeral sub-agents for quick subtasks | Max 8 concurrent; timeout set per task |
| agent activation | Assign tasks to standalone team agents | Via comms/inbox; see DELEGATION-POLICY.md |
| sessions_list/history | Monitor agent progress | Check before status updates |
| cron | Schedule heartbeats and recurring tasks | Morning/midday/EOD heartbeats |
| memory_search | Find relevant past context | Use before starting any new project |
</available_tools>

<infrastructure>
## Infrastructure
- **Machine:** PC1
- **Gateway:** OpenClaw on port 18789
- **Git repo:** delphihqai-collab/development-dep
- **Tailscale URL:** TBD
</infrastructure>

<channels>
## Discord Channels
| Channel | Purpose |
|---|---|
| #atlas-chat | Boss ↔ ATLAS direct communication |
| #atlas-logs | Heartbeat results, system logs |
| #briefings | Cross-department handoffs with Hermes |
| #atlas-hermes | Direct ATLAS ↔ Hermes conversation |
| #daily-standup | Daily standup posts |
| #critical-alerts | Urgent alerts |
| #approvals | External action approvals (Boss sign-off) |
| #knowledge-base | Technical learnings |
</channels>

<cross_department>
## Cross-Department
- **Hermes Tailscale:** https://hermes.tail280e9c.ts.net
- **Hermes repo:** delphihqai-collab/hermes
</cross_department>

<tool_rules>
## Tool Rules
- ALWAYS confirm before executing any action that modifies external systems
- NEVER store secrets in workspace files, logs, or documentation
- Use absolute file paths, never relative
- Log reasoning for every significant decision in memory/daily notes
</tool_rules>
