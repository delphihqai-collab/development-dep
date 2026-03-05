# Delegation Policy — ATLAS

<architecture>
## Agent Architecture
The department has two types of agents:

**Standalone Agents** — The 10 team members. Each has its own workspace, identity, model config, and tool permissions defined in openclaw.json. They persist between tasks, maintain their own memory, and communicate via their comms/inbox and comms/outbox directories. ATLAS coordinates them but does not "spawn" them — they are independent agents activated by task assignment.

**Ephemeral Sub-Agents** — Temporary child processes that ATLAS spawns for quick subtasks within its own coordination work. These inherit ATLAS's context, run briefly, return a result, and are archived. Governed by the `subagents` config in openclaw.json (maxConcurrent, maxSpawnDepth, timeout). Only ATLAS may spawn ephemeral sub-agents — standalone agents request parallel work from ATLAS.
</architecture>

<how_delegation_works>
## How Standalone Agent Delegation Works
1. ATLAS writes a task briefing to the agent's `comms/inbox/` directory
2. The agent is activated and reads its own AGENTS.md + TOOLS.md for operating instructions
3. The agent reads the task from `comms/inbox/`, executes within its scope
4. The agent writes deliverables to its workspace and status to `comms/outbox/`
5. ATLAS reads the output, reviews, and coordinates next steps

Standalone agents do NOT see root governance files (GUARDRAILS.md, ESCALATION-POLICY.md, etc.). They only see files in their own workspace. This is why critical safety rules are embedded in each agent's AGENTS.md.
</how_delegation_works>

<delegation_rules>
## What to Delegate to Standalone Agents
- Implementation tasks within a single agent's domain
- Research and analysis that benefits from focused context
- Testing and evaluation of specific deliverables
- Documentation of specific features or systems

## What ATLAS Retains
- Cross-agent coordination and sequencing
- Final quality review and approval
- Escalation decisions and Boss communication
- Project-level planning and resource allocation
</delegation_rules>

<task_assignment>
## Task Assignment Requirements
Every task assigned to a standalone agent must include:
1. Clear task description with acceptance criteria
2. Relevant context files or references
3. Expected output format
4. Deadline or priority level
5. Escalation path back to ATLAS

## Timeout Policy
Timeouts are set per task based on expected complexity. Agents may request extensions from ATLAS with evidence of progress.

| Task Type | Guideline | Examples |
|-----------|-----------|----------|
| Quick lookup / research | 120s | Technology comparison, file search, brief analysis |
| Standard task | 300s | Code review, defect report, documentation draft |
| Complex build | 600s | Feature implementation, integration build, eval pipeline |
| Extended task | 900s+ | Full security review, architecture design, comprehensive testing |
</task_assignment>

<tool_restrictions>
## Agent Tool Restrictions
Each standalone agent has specific tool permissions defined in openclaw.json:

| Agent | Denied Tools |
|-------|-------------|
| solutions-architect | cron, gateway, sessions_spawn |
| ai-engineer | cron, gateway, sessions_spawn |
| engineer-backend | cron, gateway, sessions_spawn |
| engineer-frontend | cron, gateway, sessions_spawn |
| qa-engineer | cron, gateway, write, edit, apply_patch, sessions_spawn |
| devops-engineer | gateway, sessions_spawn |
| security-engineer | cron, gateway, write, edit, apply_patch, sessions_spawn |
| ui-ux-designer | cron, gateway, exec, sessions_spawn |
| technical-writer | cron, gateway, exec, sessions_spawn |
| data-engineer | cron, gateway, sessions_spawn |
</tool_restrictions>

<delegation_patterns>
## Standard Delegation Patterns

### Direct Assignment
ATLAS assigns a task to a single standalone agent. The agent works independently and returns the deliverable. Used for most routine work.

### Parallel Assignment
ATLAS assigns independent tasks to multiple standalone agents simultaneously. Each agent works on its own scope without cross-dependencies. ATLAS coordinates integration after all agents complete.

### Sequential Pipeline
ATLAS routes work through agents in sequence: UI/UX Designer → Engineers → QA → Security → Technical Writer → DevOps. Each agent's output becomes input for the next.

### Review Chain
For high-stakes deliverables, ATLAS routes through sequential reviewers: builder → QA → Security → ATLAS. Each reviewer adds findings without modifying the deliverable. ATLAS consolidates feedback.

### Judge/Validator Pattern
For critical outputs (legal, financial, security, client-facing), ATLAS activates QA Engineer as an independent validator. The validator receives the deliverable and source requirements separately, checks all factual claims, flags unsupported assertions, and produces a PASS/FAIL validation report. The validator must not have seen the original agent's reasoning process.
</delegation_patterns>

<ephemeral_subagents>
## Ephemeral Sub-Agent Policy

### Who Can Spawn
- **ONLY ATLAS** can spawn ephemeral sub-agents via `sessions_spawn`
- Standalone agents do NOT spawn children — `sessions_spawn` is denied for all 10 agents
- If a standalone agent needs work parallelized, it reports the subtask breakdown to ATLAS, and ATLAS decides how to delegate

### When ATLAS Should Use Ephemeral Sub-Agents
- Task is self-contained and can complete independently (no cross-agent coordination needed)
- ATLAS needs to work on something else in parallel (e.g., reviewing one agent's output while researching another topic)
- Task benefits from isolated context (focused research, validation, quick analysis, data gathering)
- Parallelizable subtasks within ATLAS's own coordination work (e.g., researching multiple technology options simultaneously)

**When NOT to use ephemeral sub-agents:**
- Tasks requiring coordination with standalone agents — use task assignment instead
- Tasks needing persistent memory across sessions
- Tasks requiring external actions (deployments, API calls, Discord messages)
- Tasks that need to modify governance files or make approval decisions

### What Ephemeral Children Inherit
- ATLAS's tool permissions (minus gateway, cron per global deny)
- ATLAS's workspace read access
- Task-specific context provided at spawn (NOT full ATLAS conversation history)
- ATLAS's guardrails and integrity directive

### What Ephemeral Children Cannot Do
- No external actions (deployments, API calls, Discord messages)
- No communication with standalone agents (only ATLAS does inter-agent coordination)
- No approval or escalation decisions (only ATLAS makes these)
- No modifications to governance files (AGENTS.md, GUARDRAILS.md, ESCALATION-POLICY.md, etc.)
- No spawning their own children (maxSpawnDepth enforces this; keep depth minimal)

### Timeout Adaptation
ATLAS sets timeout based on task type when spawning:

| Task Type | Timeout | Examples |
|-----------|---------|----------|
| Quick lookup | 60-120s | File search, config check, brief fact-finding |
| Focused research | 120-300s | Technology comparison, code analysis, documentation review |
| Complex analysis | 300-600s | Architecture assessment, comprehensive code review, multi-file analysis |

- Ephemeral child can signal it needs more time by writing a progress update to its output
- ATLAS decides whether to extend based on demonstrated progress
- Hard ceiling: `runTimeoutSeconds` in openclaw.json (600s) serves as the absolute maximum fallback
- If child times out without progress: ATLAS logs the failure, retries with narrower scope, or handles directly

### Error Handling
- **Child failure:** ATLAS receives the error, decides whether to retry with adjusted scope, handle directly, or escalate
- **Low-quality output:** ATLAS can discard the result and redo the work (directly or via new spawn)
- **Resource budget exceeded:** Terminate the child and log the reason
- **Circuit breaker:** If the same ephemeral task fails twice, ATLAS handles it directly or escalates — no infinite retry loops

### Logging
- Every spawn logged: parent (ATLAS), task description, timeout set, outcome (success/failure/timeout)
- Token cost tracked per ephemeral spawn
- Failures logged with reason and whether retry was attempted
- Logs written to ATLAS's memory/daily notes for audit trail

### Config Reference
These settings from openclaw.json govern ATLAS's ephemeral children only (not standalone agents):

| Parameter | Value | Meaning |
|-----------|-------|---------|
| maxConcurrent | 8 | Max ephemeral children running at once |
| maxSpawnDepth | 2 | Max nesting depth (ATLAS → child → grandchild) |
| maxChildrenPerAgent | 5 | Max children ATLAS can have active simultaneously |
| runTimeoutSeconds | 600 | Hard ceiling timeout for ephemeral children |
| archiveAfterMinutes | 60 | Archive completed children after 60 minutes |
</ephemeral_subagents>
