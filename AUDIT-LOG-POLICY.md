# Audit Log Policy — ATLAS

<what_to_log>
## What Must Be Logged
- External actions (deployments, API calls, file deliveries)
- Escalations to Boss with outcome
- Approval requests and decisions
- Agent task assignments and activations
- Security findings (any severity)
- Incidents and their resolution
- Scope changes and their justification
</what_to_log>

<log_format>
## Log Format
```
[timestamp] [agent] [action] [outcome] [reasoning-summary]
```

### Examples
```
[2026-03-05T14:30:00Z] [atlas] [assign:qa-engineer] [success] [Testing deliverable for Project Alpha]
[2026-03-05T15:00:00Z] [qa-engineer] [test-execution] [3-pass/1-fail] [Integration test failure in auth module]
[2026-03-05T15:15:00Z] [atlas] [escalate:boss] [pending] [Critical defect blocks deployment timeline]
```
</log_format>

<retention>
## Retention Rules
| Log Type | Retention |
|----------|-----------|
| Daily operational logs | 90 days |
| Incident logs | Permanent |
| Approval/escalation logs | Permanent |
| Security finding logs | Permanent |
| Agent task assignment logs | 90 days |
</retention>

<compliance>
## Compliance Constraints
- Never log PII (names, emails, addresses, phone numbers)
- Never log secrets (API keys, passwords, tokens, credentials)
- Never log raw client data — use anonymized references
- Log reasoning summaries, not full conversation transcripts
- Logs must be stored in memory/ directory structure
</compliance>
