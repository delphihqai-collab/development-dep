# Delphi — Development Department

Source of truth for ATLAS (Development Director & Tech Lead) and the 10 standalone agents in Delphi's development department.

## Architecture

Built following OpenClaw multi-agent best practices and expert agent design patterns from Anthropic's research. Each agent has the complete file set recommended for production-grade agents.

### ATLAS Workspace Files (root)
| File | Purpose | Injected? |
|------|---------|-----------|
| SOUL.md | Who ATLAS is — personality, values, reasoning style | Main sessions |
| AGENTS.md | Operating instructions, workflows, decision frameworks | All sessions |
| IDENTITY.md | Name, role, emoji, theme | Main sessions |
| USER.md | Boss profile, authorised users | Main sessions |
| TOOLS.md | Available tools, infrastructure, constraints | All sessions |
| HEARTBEAT.md | Scheduled check-in tasks | Main sessions |
| MEMORY.md | Curated long-term knowledge | On reference |
| GUARDRAILS.md | Safety constraints, prohibited actions | Reference |
| ESCALATION-POLICY.md | Approval chains, human-in-the-loop gates | Reference |
| HANDOFF-PROTOCOL.md | Inter-agent transfer procedures | Reference |
| ERROR-HANDLING.md | Failure modes, retry policies | Reference |
| EVALUATION-CRITERIA.md | Success metrics per agent and project type | Reference |

### Agent Files (per agent in agents/)
Each agent has: SOUL.md, AGENTS.md, IDENTITY.md, USER.md, TOOLS.md

**Critical insight**: Sub-agents only receive AGENTS.md and TOOLS.md. All operational logic must be self-sufficient in those two files.

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

## Deployment
```bash
chmod +x deploy.sh
./deploy.sh
```

## Key Design Decisions
- **Consolidated 3 roles**: Integration Specialist → Backend, Performance Engineer → DevOps, Tool Scout → Solutions Architect
- **Added 3 roles**: AI Engineer (core), UI/UX Designer (essential), Data Engineer (per-project)
- **Expanded 3 roles**: QA → AI evaluation, DevOps → LLMOps, Security → AI safety
- **Model strategy**: Sonnet for judgement-heavy roles, Haiku for structured/repeatable, heartbeats on Haiku to save costs
- **Sub-agent config**: maxSpawnDepth: 2, maxConcurrent: 4, adaptive thinking, 5-min timeout
