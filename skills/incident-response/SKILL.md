---
name: incident-response
description: Coordinate response to production incidents
trigger: Production incident reported
---

# Incident Response

## Severity Definitions

| Severity | Description | Response Time | Update Cadence |
|----------|-------------|---------------|----------------|
| SEV1 | Service down, data loss, security breach | Immediate | #critical-alerts every 30min |
| SEV2 | Major feature broken, significant user impact | < 30min | #critical-alerts every 30min |
| SEV3 | Minor feature broken, workaround available | < 2hr | #atlas-logs on status change |
| SEV4 | Cosmetic issue, no user impact | Next business day | memory/ only |

## Workflow

### 1. DEFINE — Assess and Classify
- Determine severity (SEV1-4)
- Document: what is broken, who is affected, when it started
- Identify affected systems and dependencies

### 2. MEASURE — Establish Timeline
- Record incident start time
- Document symptoms and observed behavior
- Capture relevant logs, metrics, error messages

### 3. ANALYZE — Diagnose
- Send diagnostic task to DevOps Engineer via `sessions_send`: infrastructure and deployment check
- Send diagnostic task to Security Engineer via `sessions_send`: if security-related indicators
- Correlate with recent changes (deployments, config changes, external factors)

### 4. IMPROVE — Fix
- Coordinate fix with relevant Engineers via `sessions_send`
- Options in priority order:
  1. Rollback (if recent deployment caused it)
  2. Hotfix (if root cause is clear and fix is small)
  3. Workaround (if fix requires more time)
  4. Escalate to Boss (if beyond team capability)

### 5. CONTROL — Verify and Monitor
- Verify fix resolves the issue
- Monitor for recurrence (30min for SEV1/2, 2hr for SEV3)
- Confirm with affected users/systems

### 6. Post-Incident Report
- Timeline of events
- Root cause (5 Whys analysis)
- What worked, what didn't
- Prevention measures
- Update ERROR-HANDLING.md and MEMORY.md

## Communication Protocol

| Severity | Channel | Frequency |
|----------|---------|-----------|
| SEV1/2 | #critical-alerts | Every 30 minutes until resolved |
| SEV3 | #atlas-logs | On status change |
| SEV4 | memory/ | End of day summary |
