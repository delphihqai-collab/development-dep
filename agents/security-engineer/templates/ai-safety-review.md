# AI Safety Review: [FEATURE NAME]

**Date:** YYYY-MM-DD
**Reviewer:** Security Engineer
**Project:** [project name]
**Model:** [model used]
**Overall Risk:** Critical / High / Medium / Low

## AI Attack Surface

### Data Flow
[Describe: what data flows through the AI system, what users can control, what is system-controlled]

### Access Model
| Component | Who Can Access | Data Exposed |
|-----------|---------------|-------------|
| System prompt | [who] | [what] |
| User input | [who] | [what] |
| RAG sources | [who] | [what] |
| Tool calls | [who] | [what] |
| Output | [who] | [what] |

## Prompt Injection Testing

### Direct Injection
| Test | Input | Expected | Actual | Status |
|------|-------|----------|--------|--------|
| System prompt override | [input] | Rejected | [result] | PASS/FAIL |
| Role confusion | [input] | Rejected | [result] | PASS/FAIL |
| Instruction injection | [input] | Rejected | [result] | PASS/FAIL |

### Indirect Injection
| Test | Vector | Expected | Actual | Status |
|------|--------|----------|--------|--------|
| Document injection | [source] | Filtered | [result] | PASS/FAIL |
| Data poisoning | [source] | Detected | [result] | PASS/FAIL |

## Guardrail Verification
| Guardrail | Implementation | Test Result |
|-----------|---------------|------------|
| Input validation | [method] | PASS/FAIL |
| Output filtering | [method] | PASS/FAIL |
| Content safety | [method] | PASS/FAIL |
| Token budget | [limit] | PASS/FAIL |
| Fallback behavior | [method] | PASS/FAIL |

## Data Security
| Concern | Status | Notes |
|---------|--------|-------|
| PII in training data | [status] | [notes] |
| PII in conversation logs | [status] | [notes] |
| PII in RAG sources | [status] | [notes] |
| Data retention policy | [status] | [notes] |

## Findings

### [Finding ID]: [Title]
- **Risk:** Critical / High / Medium / Low
- **Description:** [vulnerability description]
- **Impact:** [what can be exploited]
- **Remediation:** [specific fix]
- **Verification:** [how to confirm fix]

## Summary
| Category | Findings | Critical | High | Medium | Low |
|----------|---------|----------|------|--------|-----|
| Prompt injection | [count] | [count] | [count] | [count] | [count] |
| Data security | [count] | [count] | [count] | [count] | [count] |
| Guardrails | [count] | [count] | [count] | [count] | [count] |

**Verdict:** PASS / CONDITIONAL PASS / FAIL
**Conditions:** [if conditional, what must be fixed before shipping]
