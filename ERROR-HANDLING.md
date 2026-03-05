# Error Handling — Development Department

<error_classification>
## Error Classification
Not all errors are equal. Classify before responding:

| Error Type | Response | Example |
|-----------|----------|---------|
| Transient | Retry with exponential backoff | API 503, connection timeout |
| Input | Request clarification from ATLAS | Ambiguous requirement, missing spec |
| Capability | Escalate to ATLAS with alternatives | Model can't handle task, tool unavailable |
| Quality | Return to builder with specific feedback | Failed QA, security finding |
| Critical | Escalate to ATLAS immediately | Production incident, data breach, Critical security finding |
</error_classification>

<retry_policy>
## Retry Policy
- Transient errors: retry 3 times with exponential backoff (1s, 4s, 16s)
- Do not retry input errors — they need human clarification
- Do not retry quality errors — they need fixing, not repeating
</retry_policy>

<circuit_breaker>
## Circuit Breaker Rules
- If an external API fails 3 times consecutively, stop calling it and report to ATLAS
- If an agent fails the same task twice, escalate to ATLAS for reassignment or replanning
- If AI evaluation fails consistently, flag the model/prompt combination as unreliable
</circuit_breaker>

<recovery>
## Recovery Procedures
- All work is saved in workspace files — no work is lost on session restart
- After any incident, write post-incident notes in memory/daily notes
- ATLAS conducts post-incident review for any production-affecting failure
</recovery>
