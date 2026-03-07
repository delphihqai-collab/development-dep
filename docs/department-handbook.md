# Delphi Development Department Handbook

## Mission

Build, test, secure, and deliver AI-powered software systems. Every deliverable passes evaluation, runs within budget, and behaves safely in production.

## Team Roster

| ID | Agent | Model | Specialization |
|----|-------|-------|----------------|
| atlas | ATLAS | sonnet | Development Director & Tech Lead. Coordinates all work, reviews deliverables, manages cross-department communication. |
| solutions-architect | Solutions Architect | sonnet | Architecture design, feasibility assessment, technology evaluation, effort estimation |
| ai-engineer | AI Engineer | sonnet | AI agents, LLM integration, RAG pipelines, eval suites, prompt engineering |
| engineer-backend | Engineer (Backend) | sonnet | APIs, server-side logic, integrations, data pipelines, backend testing |
| engineer-frontend | Engineer (Frontend) | sonnet | UI implementation, component development, accessibility, performance |
| qa-engineer | QA Engineer | haiku | Functional/integration/regression testing, AI evaluation, defect reporting |
| devops-engineer | DevOps Engineer | sonnet | CI/CD, deployment, monitoring, infrastructure, LLMOps, cost tracking |
| security-engineer | Security Engineer | sonnet | Security review, AI safety testing, vulnerability assessment, compliance |
| ui-ux-designer | UI/UX Designer | sonnet | User research, wireframes, design systems, AI interaction design |
| technical-writer | Technical Writer | haiku | User guides, API docs, AI feature docs, runbooks |
| data-engineer | Data Engineer | haiku | ETL/ELT pipelines, data quality, schema design, RAG data preparation |

## Cross-Department Protocol

### Channel Routing

| Channel | Direction | Content |
|---------|-----------|---------|
| #briefings | Hermes -> ATLAS, ATLAS -> Hermes | Client briefings, feasibility estimates |
| #atlas-hermes | ATLAS <-> Hermes | Direct coordination, scope questions |
| #atlas-chat | Boss <-> ATLAS | Strategic direction, approvals, escalations |
| #approvals | ATLAS -> Boss | Deployment approvals, scope changes, budget approvals |
| #critical-alerts | ATLAS -> All | SEV1/2 incidents, security findings |
| #daily-standup | ATLAS -> All | Daily status updates |
| #atlas-logs | ATLAS -> All | Heartbeat results, system events |
| #knowledge-base | ATLAS -> All | Technical learnings, post-mortems |

### Hermes Interface
- Briefings arrive as ae-atlas-trigger.md via #briefings
- Estimates returned as atlas-hermes-estimate.md via #briefings
- Scope changes coordinated via #atlas-hermes
- Demo preparation via #atlas-hermes

## Project Lifecycle (DMAIC)

| Phase | DMAIC | Activities | Agents |
|-------|-------|-----------|--------|
| Intake | Define | Extract requirements, set CTQs, SMART goals | ATLAS, Solutions Architect |
| Design | Define/Measure | Architecture, UI/UX design, baselines | Solutions Architect, UI/UX Designer |
| Build | Improve | Implementation, integration, AI development | Engineers, AI Engineer, Data Engineer |
| Test | Measure/Analyze | Testing, AI evaluation, security review | QA Engineer, Security Engineer |
| Document | Control | User docs, API docs, runbooks | Technical Writer |
| Deploy | Control | Staging, production, monitoring | DevOps Engineer |
| Review | Control | Metrics, lessons learned, improvements | ATLAS |

## Pod Compositions

| Type | Core Agents | Supporting |
|------|-------------|-----------|
| AI-heavy | AI Engineer, Backend | QA, Security, Tech Writer |
| Frontend-heavy | UI/UX Designer, Frontend, Backend | QA, Tech Writer |
| Integration-heavy | Solutions Architect, Backend, DevOps | QA, Security |
| Data-heavy | Data Engineer, AI Engineer, Backend | QA, Tech Writer |
| Full-stack | All agents per phase | — |

## Quality Standards

### Definition of Done
- [ ] All acceptance criteria met
- [ ] Tests pass (unit, integration, eval as applicable)
- [ ] Security review passed (for production code)
- [ ] Documentation complete
- [ ] ATLAS quality review passed
- [ ] No Critical or High defects open

### Approval Chain
1. Agent self-review
2. ATLAS quality review
3. QA validation (for critical outputs)
4. Security review (for production deployments)
5. Boss approval (for external-facing deliverables)

## Progressive Trust Model

| Phase | Autonomy Level | Approval Required |
|-------|---------------|-------------------|
| Phase 1 (New project) | Low | ATLAS approves all deliverables |
| Phase 2 (Established) | Medium | ATLAS approves critical deliverables only |
| Phase 3 (Mature) | High | Agents deliver directly, ATLAS spot-checks |

## Lean Six Sigma Integration

- DMAIC thinking embedded in every agent's Process Guardrails
- COPQ tracked across projects
- Continuous improvement cycle: monthly metrics review
- Role-specific LSS tools in each agent's SOUL.md
- TIMWOODS waste identification in ATLAS workflows
