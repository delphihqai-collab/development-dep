# OpenClaw Workspace Audit Report
## development-dep vs OpenClaw Source Code

**Date:** 2026-03-07
**Auditor:** Claude Opus 4.6
**Scope:** Full workspace audit against OpenClaw source (cloned locally)
**OpenClaw Version:** Latest main branch

---

## 1. CRITICAL ISSUES — Things that are wrong and will cause problems

### 1.1 BOOTSTRAP.md should be deleted after first run
**File:** `BOOTSTRAP.md`
**Issue:** OpenClaw's BOOTSTRAP.md template says "Delete this file. You don't need a bootstrap script anymore." Our BOOTSTRAP.md is a permanent file that reads like a checklist. OpenClaw only injects BOOTSTRAP.md for brand-new workspaces and expects it to be deleted after the first-run ritual.
**Impact:** Every session start wastes ~2,038 chars of context window on a file that should only exist once.
**Fix:** Rename to `BOOT.md` (which runs on gateway startup) or merge the relevant checklist items into AGENTS.md and delete BOOTSTRAP.md.

### 1.2 Non-injected governance files are invisible to the agent
**Files:** `GUARDRAILS.md`, `ESCALATION-POLICY.md`, `HANDOFF-PROTOCOL.md`, `DELEGATION-POLICY.md`, `AUDIT-LOG-POLICY.md`, `ERROR-HANDLING.md`, `EVALUATION-CRITERIA.md`, `DOMAIN-KNOWLEDGE.md`
**Issue:** OpenClaw auto-injects ONLY these files: `AGENTS.md`, `SOUL.md`, `TOOLS.md`, `IDENTITY.md`, `USER.md`, `HEARTBEAT.md`, `MEMORY.md`, `BOOTSTRAP.md`. Our 8 governance files (totaling ~26,444 chars) are NOT injected. ATLAS must explicitly `read` them — but nothing tells ATLAS to do this, and after compaction, any knowledge of these files is lost unless the agent re-reads them.
**Impact:** Critical governance rules (escalation triggers, delegation policies, guardrails) are invisible after compaction. The agent loses awareness of these policies during long sessions.
**Fix:** Consolidate essential governance rules INTO `AGENTS.md` (which IS auto-injected and re-injected after compaction via `postCompactionSections`). Keep the separate files as reference documents but embed the critical rules in AGENTS.md.

### 1.3 No `postCompactionSections` configured
**File:** `openclaw.json.template`
**Issue:** OpenClaw supports `agents.defaults.compaction.postCompactionSections` — an array of AGENTS.md H2/H3 section names that are re-injected into the context after compaction. Default is `["Session Startup", "Red Lines"]`. Our AGENTS.md uses custom section names (`<mission>`, `<priorities>`, `<rules>`, `<guardrails>`, `<escalation>`) that don't match these defaults.
**Impact:** After compaction, ATLAS loses its mission, priorities, rules, guardrails, and escalation triggers. The agent operates without governance.
**Fix:** Either (a) rename AGENTS.md sections to use H2/H3 headers matching OpenClaw's convention, or (b) configure `postCompactionSections` explicitly in openclaw.json with our section names.

### 1.4 comms/inbox and comms/outbox directories are a custom invention
**Files:** Agent workspace `comms/inbox/` and `comms/outbox/` directories
**Issue:** The delegation model using `comms/inbox/` and `comms/outbox/` directories for agent-to-agent communication is a custom pattern that does not align with OpenClaw's actual agent communication mechanism. OpenClaw provides `sessions_send` for inter-agent messaging. Our deploy.sh creates these directories, but OpenClaw has no awareness of them.
**Impact:** The entire delegation workflow described in DELEGATION-POLICY.md won't work as described. ATLAS cannot "write a task briefing to the agent's comms/inbox/ directory" because agents are isolated and don't share filesystem access.
**Fix:** Redesign delegation to use OpenClaw's `sessions_send` tool for agent-to-agent communication, or use `tools.agentToAgent` configuration.

### 1.5 Agents defined in `agents.list` won't be activated by ATLAS writing to their workspace
**File:** `openclaw.json.template`
**Issue:** All 10 agents are configured as standalone agents with separate workspaces. But the delegation model assumes ATLAS can write to agent workspaces to assign tasks. In reality, each agent's workspace is isolated. ATLAS's `exec`/`write` tools operate in ATLAS's workspace, not the agents' workspaces. Unless sandboxing is off and ATLAS uses absolute paths, this doesn't work.
**Impact:** The core orchestration pattern (ATLAS delegates to agents via file writes) is architecturally broken.
**Fix:** Use OpenClaw's `sessions_send` tool to send messages to other agents. Add `tools.agentToAgent` config. Remove the comms/ directory pattern. Rewrite DELEGATION-POLICY.md to describe the actual OpenClaw agent-to-agent communication mechanism.

### 1.6 AGENTS.md uses XML-style tags instead of Markdown headers
**File:** `AGENTS.md` (ATLAS)
**Issue:** Our AGENTS.md uses `<mission>`, `<priorities>`, `<decision_frameworks>`, `<workflows>`, `<rules>`, `<guardrails>`, `<escalation>`, `<integrity>`, `<trust>`, `<cross_department>`, `<lean_wastes>` XML-style tags. OpenClaw's `postCompactionSections` feature matches on H2/H3 Markdown headers, not XML tags. The compaction system cannot find or re-inject these sections.
**Impact:** Post-compaction section re-injection won't work. Agent loses all governance context after compaction.
**Fix:** Convert all XML-style section tags to proper Markdown `## Section Name` headers throughout AGENTS.md and all agent AGENTS.md files.

---

## 2. HIGH-PRIORITY GAPS — Features we should be using but aren't

### 2.1 No compaction configuration at all
**File:** `openclaw.json.template`
**Issue:** We have zero compaction config. OpenClaw supports `agents.defaults.compaction` with `reserveTokensFloor`, `identifierPolicy`, `postCompactionSections`, and `memoryFlush`.
**Impact:** Default compaction will summarize everything and lose governance context. No memory flush before compaction means durable notes aren't saved.
**Fix:**
```json5
agents: {
  defaults: {
    compaction: {
      reserveTokensFloor: 20000,
      identifierPolicy: "strict",
      postCompactionSections: ["Mission", "Priorities", "Rules of Engagement", "Process Guardrails", "Escalation Triggers"],
      memoryFlush: {
        enabled: true,
        softThresholdTokens: 4000,
        systemPrompt: "Session nearing compaction. Store durable memories and project state now.",
        prompt: "Write lasting notes to memory/YYYY-MM-DD.md. Reply NO_REPLY if nothing to store.",
      },
    },
  },
},
```

### 2.2 No session reset configuration
**File:** `openclaw.json.template`
**Issue:** No `session.reset` config. OpenClaw defaults to daily reset at 4:00 AM local time, which may be fine, but we should explicitly configure this for our multi-agent setup.
**Fix:**
```json5
session: {
  dmScope: "per-channel-peer",
  reset: {
    mode: "daily",
    atHour: 4,
    idleMinutes: 120,
  },
  maintenance: {
    mode: "enforce",
    pruneAfter: "30d",
    maxEntries: 500,
  },
},
```

### 2.3 No context pruning configuration
**File:** `openclaw.json.template`
**Issue:** `contextPruning` is not configured. For a multi-agent setup with potentially long sessions, context pruning would reduce costs and improve cache behavior.
**Fix:**
```json5
agents: {
  defaults: {
    contextPruning: {
      mode: "cache-ttl",
      ttl: "5m",
      keepLastAssistants: 3,
    },
  },
},
```

### 2.4 No memory search configured
**File:** `openclaw.json.template`
**Issue:** OpenClaw supports vector-indexed semantic memory search over MEMORY.md and memory/*.md files. We're not using it. ATLAS accumulates daily notes that should be semantically searchable.
**Fix:**
```json5
agents: {
  defaults: {
    memorySearch: {
      enabled: true,
      provider: "openai",  // or "gemini" — whichever API key is available
      model: "text-embedding-3-small",
      query: {
        hybrid: {
          enabled: true,
          vectorWeight: 0.7,
          textWeight: 0.3,
          temporalDecay: { enabled: true, halfLifeDays: 30 },
        },
      },
    },
  },
},
```

### 2.5 No auth profiles configured
**File:** `openclaw.json.template`
**Issue:** OpenClaw supports multiple auth profiles with priority ordering (OAuth subscription, API key). We have none configured — no model provider API keys, no fallback rotation.
**Fix:** Configure `models.providers` with API keys or auth profile references for Anthropic and any fallback providers.

### 2.6 No `tools.agentToAgent` configuration
**File:** `openclaw.json.template`
**Issue:** OpenClaw has `tools.agentToAgent` for inter-agent messaging. Since our entire architecture depends on ATLAS coordinating with 10 agents, this should be enabled.
**Fix:**
```json5
tools: {
  agentToAgent: {
    enabled: true,
    allow: ["atlas", "solutions-architect", "ai-engineer", "engineer-backend", "engineer-frontend", "qa-engineer", "devops-engineer", "security-engineer", "ui-ux-designer", "technical-writer", "data-engineer"],
  },
},
```

### 2.7 No `session.dmScope` configured for multi-agent setup
**File:** `openclaw.json.template`
**Issue:** Default `dmScope` is `"main"` (all DMs share one session). For a multi-agent setup with multiple users (Pedro and Filipe), this means all their DMs share the same session context — a security risk.
**Fix:** Set `session.dmScope: "per-channel-peer"`.

### 2.8 No cron jobs defined for heartbeats
**File:** `openclaw.json.template`
**Issue:** HEARTBEAT.md defines morning (09:00), midday (13:00), and EOD (18:00) checks, but there are no cron jobs configured to execute these. The `heartbeat.every: "30m"` config will trigger heartbeats every 30 minutes, but it's undirected — it just reads HEARTBEAT.md. The HEARTBEAT.md itself has no way to know which time-based section to execute.
**Fix:** Create cron jobs for structured heartbeats:
```json5
cron: {
  enabled: true,
  maxConcurrentRuns: 1,
  sessionRetention: "24h",
},
```
Then use `openclaw cron add` to create morning/midday/EOD jobs targeting the right sections.

### 2.9 No `bindings` configured — all messages go to ATLAS
**File:** `openclaw.json.template`
**Issue:** The `bindings` section is an empty placeholder. Without bindings, ALL inbound messages route to the default agent (ATLAS). If we want specific Discord channels to route to specific agents (e.g., a #qa-reports channel to QA Engineer), we need bindings.
**Recommendation:** For the coordinator pattern (everything through ATLAS), this is actually correct. But we should add peer bindings if specific channels should bypass ATLAS. Document the decision either way.

### 2.10 No hooks enabled
**File:** `openclaw.json.template`
**Issue:** OpenClaw has 4 bundled hooks: `session-memory`, `bootstrap-extra-files`, `command-logger`, `boot-md`. We're using none.
**Fix:**
```json5
hooks: {
  internal: {
    enabled: true,
    entries: {
      "session-memory": { enabled: true },
      "command-logger": { enabled: true },
      "boot-md": { enabled: true },
    },
  },
},
```

---

## 3. MEDIUM-PRIORITY IMPROVEMENTS

### 3.1 Context window budget analysis (ATLAS)
**Injected files and their sizes:**
| File | Chars | Injected? |
|------|-------|-----------|
| AGENTS.md | 10,609 | Yes (auto) |
| SOUL.md | 3,543 | Yes (auto) |
| TOOLS.md | 1,990 | Yes (auto) |
| IDENTITY.md | 347 | Yes (auto) |
| USER.md | 480 | Yes (auto) |
| HEARTBEAT.md | 956 | Yes (auto) |
| MEMORY.md | 583 | Yes (auto) |
| BOOTSTRAP.md | 2,038 | Yes (auto) — should be deleted |
| **Total injected** | **20,546** | ~5,137 tokens |

Non-injected governance files: 26,444 chars — wasted since they're never seen.
**Verdict:** ATLAS is at ~20.5K chars of 20K bootstrapMaxChars limit. AGENTS.md alone is 10.6K. After removing BOOTSTRAP.md, we're at 18.5K — within budget but tight. Consider trimming AGENTS.md or increasing `bootstrapMaxChars`.

### 3.2 Agent workspace files are bloated
Each of the 10 agent workspaces has ~15 files, many of which are NOT auto-injected:
- `DOMAIN-KNOWLEDGE.md`, `ESCALATION-POLICY.md`, `EVALUATION-CRITERIA.md`, `GUARDRAILS.md` — NOT injected
- Only `AGENTS.md`, `SOUL.md`, `TOOLS.md`, `IDENTITY.md`, `USER.md`, `HEARTBEAT.md`, `MEMORY.md` are injected

**Fix:** Consolidate essential content from non-injected files into AGENTS.md for each agent. Keep separate files only as reference docs that agents can `read` when needed.

### 3.3 `tools.exec.host: "sandbox"` may be too restrictive
**File:** `openclaw.json.template`
**Issue:** `tools.exec.host` is set to `"sandbox"` which means exec runs in sandbox even for main sessions. For ATLAS who needs to coordinate deployments and run system commands, this is limiting.
**Fix:** Consider `tools.exec.host: "main"` for ATLAS (main session on host, non-main in sandbox), or set per-agent.

### 3.4 QA Engineer and Security Engineer can't write reports
**File:** `openclaw.json.template`
**Issue:** QA Engineer and Security Engineer have `write`, `edit`, `apply_patch` denied. They're supposed to produce defect reports and security findings — but they can't write files.
**Impact:** These agents cannot produce deliverables in their own workspaces.
**Fix:** Remove `write` and `edit` from their deny lists. They need to write reports. If read-only is desired for code review, use sandbox with `workspaceAccess: "ro"` on the project code, but allow writes to their own workspace.

### 3.5 No `thinking` mode configured for any agent
**File:** `openclaw.json.template`
**Issue:** Claude 4.6 models default to `adaptive` thinking, but we're not explicitly configuring this. For complex reasoning roles (Solutions Architect, Security Engineer), we should explicitly enable thinking.
**Fix:** Add `thinkingDefault: "adaptive"` to `agents.defaults`, or per-agent for specific roles that need deeper reasoning.

### 3.6 No model catalog / allowlist configured
**File:** `openclaw.json.template`
**Issue:** `agents.defaults.models` is not set. This means no model aliases, no `/model` switching, and no model catalog for the agents.
**Fix:**
```json5
agents: {
  defaults: {
    models: {
      "anthropic/claude-opus-4-6": { alias: "opus" },
      "anthropic/claude-sonnet-4-6": { alias: "sonnet" },
      "anthropic/claude-haiku-4-5-20251001": { alias: "haiku" },
    },
  },
},
```

### 3.7 No BOOT.md for gateway startup
**Issue:** OpenClaw supports `BOOT.md` — an optional startup checklist executed on gateway restart (requires `hooks.internal.enabled` + `boot-md` hook). We don't have one.
**Fix:** Create `BOOT.md` with startup tasks:
```markdown
# BOOT.md
1. Read MEMORY.md for recent context
2. Check memory/ for yesterday's daily log
3. Post startup message to #atlas-logs via Discord
4. Check #briefings for pending requests
```

### 3.8 Heartbeat model should be sonnet, not haiku
**File:** `openclaw.json.template` line 22
**Issue:** `heartbeat.model: "anthropic/claude-haiku-4-5"` — the heartbeat model string is incomplete (missing date suffix). Valid model ID is `anthropic/claude-haiku-4-5-20251001`.
**Fix:** Change to `"anthropic/claude-haiku-4-5-20251001"` or use sonnet for heartbeats since ATLAS's heartbeat tasks require reading project status, making decisions, and posting updates.

### 3.9 `maxConcurrent` not set — defaults to 1
**File:** `openclaw.json.template`
**Issue:** `agents.defaults.maxConcurrent` defaults to 1, meaning only one agent run can happen at a time across all sessions. For 11 agents, this is a bottleneck.
**Fix:** Set `agents.defaults.maxConcurrent: 3` or higher.

### 3.10 No `workspaceAccess` configured per agent
**Issue:** For security-sensitive agents (QA, Security), we should configure `workspaceAccess: "ro"` on project directories while allowing writes to their own workspace.

### 3.11 UI/UX Designer and Technical Writer denied `exec`
**File:** `openclaw.json.template`
**Issue:** These agents can't run any commands. UI/UX Designer may need to run design tools, preview servers, etc. Technical Writer may need to build docs or run linters.
**Recommendation:** Evaluate whether `exec` denial is appropriate. Consider allowing `exec` with sandbox restrictions instead.

---

## 4. LOW-PRIORITY / FUTURE CONSIDERATIONS

### 4.1 Browser tool not enabled for any agent
ATLAS and Solutions Architect would benefit from browser access for research (checking API docs, comparing tools, verifying documentation). Enable with `browser: { enabled: true }` in config.

### 4.2 No Discord channel configuration
We reference 8 Discord channels but have no Discord channel config in openclaw.json. Need to configure `channels.discord` with bot token, guild IDs, and channel allowlists.

### 4.3 No webhook configuration for GitHub events
Could set up webhooks for PR merged, deployment completed, CI failures to trigger automated responses from ATLAS or DevOps Engineer.

### 4.4 No MCP servers configured
OpenClaw supports MCP. Could add GitHub MCP server for code access, or other integrations. Currently empty placeholder.

### 4.5 No skills defined
`skills/` directory is empty. Could create workspace skills for common department workflows (briefing intake, code review checklist, deployment checklist).

### 4.6 `docs/` directory is empty
Should contain department documentation, architecture references, or link to relevant resources.

### 4.7 No gateway daemon / systemd service
No configuration for surviving reboots. Should set up `openclaw onboard --install-daemon` or create a systemd user service.

### 4.8 No backup strategy for workspaces
OpenClaw recommends treating workspace as a private git repo. Our development-dep repo IS the source of truth, but the deployed workspaces (~/.openclaw/workspace*) are not backed up.

### 4.9 No fallback providers configured
If Anthropic API goes down, there are no fallback providers. Consider adding OpenAI or OpenRouter as fallbacks.

### 4.10 No usage tracking / cost monitoring
Should configure usage tracking to monitor token costs per agent.

### 4.11 No Hermes workspace comparison possible
Cannot access Hermes workspace to compare cross-department alignment.

### 4.12 Polls feature unused
OpenClaw supports polls — could be useful for team decision-making or priority voting.

### 4.13 No `$include` used for config splitting
For 11 agents, the config is getting large. Could use `$include` to split agent configs into separate files.

---

## 5. WHAT WE GOT RIGHT

### 5.1 Multi-agent architecture is sound
- 11 agents (ATLAS + 10 specialists) with separate workspaces is the correct pattern for OpenClaw
- `agents.list` correctly defines each agent with its own workspace and identity
- The coordinator pattern (ATLAS as default, delegates to specialists) aligns with OpenClaw's multi-agent routing

### 5.2 Model assignments are reasonable
- Opus as ATLAS fallback for complex reasoning
- Sonnet for most agents (appropriate for reasoning-heavy tasks)
- Haiku for QA, Technical Writer, Data Engineer (appropriate for structured, lower-complexity tasks)

### 5.3 Tool deny lists are mostly correct
- All agents correctly deny `gateway` (prevents config changes)
- All standalone agents deny `sessions_spawn` (only ATLAS can spawn)
- DevOps correctly keeps `cron` access (needs deployment scheduling)

### 5.4 Gateway config is correct
- Port 18789 matches OpenClaw default
- `bind: "loopback"` is secure
- `auth: { mode: "token" }` is correct
- `reload: { mode: "hybrid" }` enables hot-reload (good practice)

### 5.5 Sandbox config is appropriate
- `mode: "non-main"` sandboxes group/channel sessions
- `scope: "agent"` gives each agent its own sandbox

### 5.6 Subagent config is well-thought-out
- `maxConcurrent: 8` reasonable for parallel research
- `maxSpawnDepth: 2` appropriate (ATLAS → child → no grandchildren in practice)
- `runTimeoutSeconds: 600` generous but safe
- `archiveAfterMinutes: 60` cleans up old children

### 5.7 Identity files are correctly formatted
- IDENTITY.md has name, emoji, theme — matches OpenClaw expectations
- USER.md has name and communication preferences — good

### 5.8 SOUL.md is well-crafted
- Good persona definition without being bloated
- Clear values, boundaries, communication style
- Within reasonable size (~3.5K chars)

### 5.9 HEARTBEAT.md is compact and useful
- Three time-based sections (morning/midday/EOD)
- Actionable items for each check
- Under 1K chars — low context overhead

### 5.10 DOMAIN-KNOWLEDGE.md is comprehensive
- Covers tech stack, architectural conventions, AI principles, delivery methodology
- Well-structured with clear sections
- Correct technical recommendations

---

## 6. SPECIFIC NEXT STEPS — Ordered by priority

### Step 1: Fix AGENTS.md section format (CRITICAL)
**File:** `AGENTS.md` (ATLAS) + all 10 agent `AGENTS.md` files
**Change:** Replace all XML-style tags (`<mission>`, `<priorities>`, etc.) with Markdown H2 headers (`## Mission`, `## Priorities`, etc.)
**Why:** Enables `postCompactionSections` to work. Without this, governance context is lost after compaction.

### Step 2: Consolidate governance into AGENTS.md (CRITICAL)
**File:** `AGENTS.md` (ATLAS)
**Change:** Move essential rules from GUARDRAILS.md, ESCALATION-POLICY.md, and DELEGATION-POLICY.md into AGENTS.md. These files are NOT auto-injected, so their content is invisible to the agent.
**Keep separate:** The detailed reference files can remain for ATLAS to `read` on demand, but the critical rules must be in AGENTS.md.

### Step 3: Delete BOOTSTRAP.md or convert to BOOT.md (CRITICAL)
**File:** `BOOTSTRAP.md`
**Change:** Delete it (it's a one-time file) or rename to `BOOT.md` and enable the `boot-md` hook.

### Step 4: Add compaction config to openclaw.json.template (HIGH)
**File:** `openclaw.json.template`
**Change:** Add the `compaction` block from section 2.1 above.

### Step 5: Add sessions_send-based delegation (HIGH)
**Files:** `DELEGATION-POLICY.md`, `TOOLS.md`, `openclaw.json.template`
**Change:** Replace comms/inbox/outbox pattern with `sessions_send` + `tools.agentToAgent` config. Update deploy.sh to stop creating comms/ directories.

### Step 6: Fix heartbeat model ID (HIGH)
**File:** `openclaw.json.template` line 22
**Change:** `"anthropic/claude-haiku-4-5"` → `"anthropic/claude-haiku-4-5-20251001"`

### Step 7: Add session config (HIGH)
**File:** `openclaw.json.template`
**Change:** Add session reset, dmScope, and maintenance config from section 2.2.

### Step 8: Add context pruning config (HIGH)
**File:** `openclaw.json.template`
**Change:** Add contextPruning block from section 2.3.

### Step 9: Fix QA/Security tool denials (MEDIUM)
**File:** `openclaw.json.template`
**Change:** Remove `write` and `edit` from QA Engineer and Security Engineer deny lists. They need to write reports and findings.

### Step 10: Enable hooks (MEDIUM)
**File:** `openclaw.json.template`
**Change:** Add hooks config from section 2.10.

### Step 11: Add model catalog (MEDIUM)
**File:** `openclaw.json.template`
**Change:** Add `agents.defaults.models` with aliases for opus, sonnet, haiku.

### Step 12: Add maxConcurrent setting (MEDIUM)
**File:** `openclaw.json.template`
**Change:** Add `agents.defaults.maxConcurrent: 3`

### Step 13: Configure memory search (MEDIUM)
**File:** `openclaw.json.template`
**Change:** Add memorySearch config from section 2.4.

### Step 14: Create BOOT.md (LOW)
**File:** New `BOOT.md`
**Change:** Create gateway startup checklist.

### Step 15: Configure Discord channel (LOW)
**File:** `openclaw.json.template`
**Change:** Add `channels.discord` configuration with bot token and guild/channel allowlists.

### Step 16: Set up cron jobs for structured heartbeats (LOW)
**Change:** Use `openclaw cron add` to create morning/midday/EOD cron jobs instead of relying on undirected 30-minute heartbeats.

### Step 17: Add browser tool for research agents (LOW)
**File:** `openclaw.json.template`
**Change:** Enable browser for ATLAS and Solutions Architect.

### Step 18: Run openclaw doctor (LOW)
**Change:** After applying fixes, run `openclaw doctor` to verify configuration.

---

## Appendix A: OpenClaw File Injection Order

Files injected into agent context on every turn (from source code analysis):

1. `AGENTS.md` — operating instructions (injected for main AND sub-agent sessions)
2. `SOUL.md` — persona (main sessions only)
3. `TOOLS.md` — tool notes (injected for main AND sub-agent sessions)
4. `IDENTITY.md` — agent identity (main sessions only)
5. `USER.md` — user profile (main sessions only)
6. `HEARTBEAT.md` — heartbeat checklist (main sessions only)
7. `MEMORY.md` — long-term memory (main sessions only)
8. `BOOTSTRAP.md` — first-run only, brand-new workspaces

Sub-agents ONLY get: `AGENTS.md` + `TOOLS.md`

Per-file max: `bootstrapMaxChars` = 20,000 chars
Total max: `bootstrapTotalMaxChars` = 150,000 chars

## Appendix B: Key Config Options We're Missing

| Config Key | Default | Our Value | Recommended |
|-----------|---------|-----------|-------------|
| `agents.defaults.compaction` | minimal defaults | not set | configure fully |
| `agents.defaults.contextPruning` | off | not set | cache-ttl, 5m |
| `agents.defaults.memorySearch` | auto-detect | not set | openai provider |
| `agents.defaults.maxConcurrent` | 1 | not set | 3 |
| `agents.defaults.thinkingDefault` | varies by model | not set | "adaptive" |
| `agents.defaults.models` | none | not set | add catalog |
| `session.dmScope` | "main" | not set | "per-channel-peer" |
| `session.reset` | daily at 4am | not set | explicit config |
| `session.maintenance` | warn mode | not set | enforce mode |
| `tools.agentToAgent` | disabled | not set | enabled |
| `hooks.internal` | disabled | not set | enabled |
| `cron` | enabled but empty | not set | configure |
