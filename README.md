# Delphi — Development Department

Source of truth for ATLAS (Development Director & Tech Lead) and the 10 standalone agents in Delphi's development department.

## Architecture

Built on OpenClaw multi-agent platform. Each agent has its own isolated workspace with auto-injected bootstrap files (AGENTS.md, SOUL.md, TOOLS.md, IDENTITY.md, USER.md, HEARTBEAT.md, MEMORY.md).

### Team

| Agent | Model | Role |
|---|---|---|
| **ATLAS** | sonnet | Development Director & Tech Lead |
| Solutions Architect | sonnet | Architecture, feasibility, estimates, technology evaluation |
| AI Engineer | sonnet | AI agents, LLM integration, RAG, orchestration, evaluation |
| Engineer (Backend) | sonnet | APIs, server-side logic, data pipelines, integrations |
| Engineer (Frontend) | sonnet | Interfaces, dashboards, web apps |
| QA Engineer | haiku | Testing + AI evaluation |
| DevOps Engineer | sonnet | CI/CD, infra, monitoring, performance, LLMOps |
| Security Engineer | sonnet | Security + AI safety |
| UI/UX Designer | sonnet | User research, wireframes, prototypes, AI interaction design |
| Technical Writer | haiku | Documentation, API docs, AI feature docs |
| Data Engineer | haiku | Data pipelines, ETL, data quality, RAG data prep |

### ATLAS Workspace Files (root)

| File | Purpose | Auto-injected? |
|------|---------|----------------|
| AGENTS.md | Operating instructions, workflows, delegation, evaluation, domain knowledge | Yes |
| SOUL.md | Personality, values, reasoning style | Yes |
| TOOLS.md | Available tools, infrastructure, channels | Yes |
| IDENTITY.md | Name, role, emoji, theme | Yes |
| USER.md | Boss profile, authorised users | Yes |
| HEARTBEAT.md | Periodic check-in tasks | Yes |
| MEMORY.md | Curated long-term knowledge | Yes |
| BOOT.md | Gateway startup checklist (runs on restart) | Via hook |

### Agent Workspace Files (per agent)

Each agent has: AGENTS.md, SOUL.md, TOOLS.md, IDENTITY.md, USER.md, HEARTBEAT.md, MEMORY.md, plus templates/ directory.

All governance content (guardrails, escalation policy, evaluation criteria, domain knowledge) is merged into each agent's AGENTS.md so it is auto-injected at bootstrap.

**Critical**: Standalone agents only see files in their own workspace. All critical rules are embedded in each agent's AGENTS.md.

## Setup

OpenClaw reads workspace files directly from the git repo — no deploy step needed.

### 1. Configure OpenClaw

```bash
cp openclaw.json.template ~/.openclaw/openclaw.json
# Edit ~/.openclaw/openclaw.json — set gateway auth token

# Copy agent configs (required: $include paths must be inside ~/.openclaw/)
mkdir -p ~/.openclaw/config/agents
cp config/agents/*.json5 ~/.openclaw/config/agents/

# Git hooks auto-sync config on pull/checkout:
# .git/hooks/post-merge and .git/hooks/post-checkout handle this automatically
```

### 2. Configure Anthropic Auth

Uses Anthropic Max subscription via setup-token (no API key needed):

```bash
openclaw setup-token
```

### 3. Enable Gateway Service

OpenClaw installs its own systemd service at `~/.config/systemd/user/openclaw-gateway.service`:

```bash
systemctl --user enable --now openclaw-gateway
```

### 4. Post-Setup

- Set up cron jobs: see `config/cron-jobs.md`
- Optional: configure Discord channels — see `config/discord-setup.md`
- Optional: configure GitHub webhooks — see `config/webhooks-setup.md`

### Memory Backup

```bash
chmod +x config/backup-workspaces.sh
./config/backup-workspaces.sh
```

Since workspaces point at the repo, memory files are written here directly. The backup script commits them. Recommended: daily via cron at 02:00 (see `config/cron-jobs.md`).

## Repository Structure

```
development-dep/
  AGENTS.md, SOUL.md, TOOLS.md, ...  # ATLAS workspace files (all governance merged into AGENTS.md)
  BOOT.md                             # Gateway startup checklist
  openclaw.json.template              # Gateway config template
  agents/
    {agent-id}/
      AGENTS.md, SOUL.md, TOOLS.md, ...  # Agent workspace files (all governance merged into AGENTS.md)
      templates/                           # Output templates
  skills/                              # ATLAS workflow skills
    briefing-response/
    project-kickoff/
    quality-review/
    continuous-improvement/
    incident-response/
    technology-evaluation/
  docs/                                # Department documentation
    department-handbook.md
    architecture-conventions.md
    onboarding-guide.md
    tech-radar.md
    cross-department-protocol.md
    lean-six-sigma-reference.md
  config/                              # Operational config
    agents/                            # Split agent configs ($include)
    backup-workspaces.sh               # Memory backup script
    cron-jobs.md                       # Cron job definitions
    discord-setup.md                   # Discord configuration
    webhooks-setup.md                  # GitHub webhook setup
```

## Skills

| Skill | Trigger | Purpose |
|-------|---------|---------|
| briefing-response | Briefing from Hermes | Process briefings, produce feasibility estimates |
| project-kickoff | Scope approved | Form team, sequence phases, distribute briefs |
| quality-review | Deliverable complete | Review against requirements, approve or return |
| continuous-improvement | End of project / monthly | Analyze metrics, identify improvements |
| incident-response | Production incident | Coordinate diagnosis, fix, and post-mortem |
| technology-evaluation | Novel tech decision | Research, compare, and recommend technology |

## Templates (29 total)

| Agent | Templates |
|-------|-----------|
| Solutions Architect | feasibility-assessment, architecture-decision-record, technology-evaluation |
| AI Engineer | evaluation-report, model-selection-report, agent-design-spec |
| Engineer (Backend) | api-contract, integration-spec, data-model |
| Engineer (Frontend) | component-spec, page-spec |
| QA Engineer | defect-report, ai-eval-summary, test-plan |
| DevOps Engineer | deployment-checklist, incident-report, pipeline-spec |
| Security Engineer | security-finding, threat-model, ai-safety-review |
| UI/UX Designer | design-handoff, user-research-brief, design-review |
| Technical Writer | documentation-plan, api-doc-template, ai-feature-doc |
| Data Engineer | data-contract, pipeline-spec, data-quality-report |

## Key Design Decisions

- **Agent communication**: Via OpenClaw `sessions_send` (not filesystem). ATLAS delegates by sending messages.
- **Config splitting**: Agent configs split into `config/agents/*.json5` via `$include`
- **Model strategy**: Sonnet for judgement-heavy, Haiku for structured/repeatable, Opus as fallback
- **Fallback providers**: OpenRouter as fallback when Anthropic is unavailable
- **Post-compaction**: Critical AGENTS.md sections re-injected after context compaction
- **Memory search**: Semantic vector search over all memory files (Anthropic embeddings)
- **Lean Six Sigma**: DMAIC thinking, COPQ tracking, and role-specific LSS tools in every agent
- **Browser access**: Enabled for ATLAS and Solutions Architect (research)
