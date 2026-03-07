# Onboarding Guide

## Workspace Structure

### Auto-Injected Files
These files are loaded into agent context on every session turn:

| File | Purpose | Sub-agents get? |
|------|---------|-----------------|
| AGENTS.md | Operating instructions, workflows, rules | Yes |
| SOUL.md | Personality, values, reasoning style | No (main only) |
| TOOLS.md | Available tools and constraints | Yes |
| IDENTITY.md | Name, role, emoji | No (main only) |
| USER.md | Boss profile, authorized users | No (main only) |
| HEARTBEAT.md | Periodic check-in tasks | No (main only) |
| MEMORY.md | Curated long-term knowledge | No (main only) |

**Critical**: Sub-agents (ephemeral children) only receive AGENTS.md + TOOLS.md. All essential rules must be in AGENTS.md.

### Reference Files (not auto-injected)
These exist in the workspace but must be explicitly `read` when needed:
- GUARDRAILS.md, ESCALATION-POLICY.md, DELEGATION-POLICY.md
- ERROR-HANDLING.md, EVALUATION-CRITERIA.md, DOMAIN-KNOWLEDGE.md
- docs/, templates/, skills/

### Post-Compaction
After context compaction, only sections listed in `postCompactionSections` are re-injected from AGENTS.md. Current sections: Mission, Priorities, Rules of Engagement, Process Guardrails, Escalation Triggers/Policy.

## OpenClaw Fundamentals

### Platform
- Gateway runs on PC1, port 18789
- Config: `~/.openclaw/openclaw.json` (deployed from `openclaw.json.template`)
- Each agent has isolated workspace: `~/.openclaw/workspace-{agent-id}/`

### Agent Communication
- ATLAS sends tasks to agents via `sessions_send`
- Agents respond via `sessions_send` back to ATLAS
- No filesystem-based communication (agents cannot access each other's workspaces)
- Agent-to-agent messaging enabled via `tools.agentToAgent` config

### Sessions
- DM scope: `per-channel-peer` (each user gets isolated sessions)
- Daily reset at 4:00 AM Lisbon time
- Idle timeout: 120 minutes
- Context pruning: cache-ttl mode, 5 minute TTL

## Task Flow

1. ATLAS receives work (from Boss, Hermes, or cron job)
2. ATLAS sends task brief to agent via `sessions_send`
3. Agent reads brief, executes within scope defined by AGENTS.md
4. Agent writes deliverables to its workspace
5. Agent responds to ATLAS with completion status
6. ATLAS reviews deliverable (quality-review skill)
7. ATLAS approves or returns with feedback

## Output Standards

- All deliverables written to agent workspace as files
- Use templates from templates/ directory
- Include all required sections per template
- Quantifiable metrics, not subjective impressions
- Trace every output to the original requirement

## Escalation Protocol

Escalate to ATLAS immediately when:
- Confidence drops below 80%
- Requirements are ambiguous or contradictory
- Blocked by dependency on another agent
- Estimated effort exceeds original by >50%
- Critical defect or security finding

## Memory System

- MEMORY.md: curated long-term knowledge (auto-injected)
- memory/*.md: detailed notes by topic or date
- Memory search: semantic vector search over all memory files
- Memory flush: automatic before compaction (saves durable notes)

## Common Mistakes

| Mistake | Correct Approach |
|---------|-----------------|
| Writing to another agent's workspace | Use `sessions_send` |
| Putting critical rules only in SOUL.md | Put in AGENTS.md (sub-agents only get AGENTS.md) |
| Using XML tags for AGENTS.md sections | Use H2 Markdown headers (required for postCompactionSections) |
| Skipping eval for AI features | Eval-before-ship is mandatory |
| Point estimates for effort | Always use ranges (optimistic/expected/pessimistic) |
| Fixing bugs found during review | Report bugs (Engineers fix); QA/Security don't fix |
| Contacting clients directly | All external communication through Hermes |
