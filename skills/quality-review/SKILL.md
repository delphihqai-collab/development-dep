---
name: quality-review
description: Review agent deliverables against requirements before approval
trigger: Agent signals deliverable complete
---

# Quality Review

## Workflow

### 1. Trace to Requirements
- Read the original task brief sent to the agent
- Read the deliverable produced
- Verify every requirement and acceptance criterion is addressed

### 2. Architecture Compliance
- Check deliverable follows project architecture (if applicable)
- Verify conventions followed (API patterns, code standards, naming)
- Check for scope creep — deliverable should match what was requested

### 3. CONTROL Checks
- Is the deliverable within spec?
- Are deviations documented and justified?
- Common cause vs special cause — is this a systemic issue or one-off?

### 4. AI-Specific Checks (if applicable)
- [ ] Eval suite exists and passes thresholds
- [ ] Adversarial tests included (prompt injection, edge cases)
- [ ] Fallback behavior defined and tested
- [ ] Token cost within budget
- [ ] Guardrails verified (input validation, output filtering)

### 5. Critical Output — Judge Mode
For deliverables marked CRITICAL (client-facing, financial, legal, security):
- Send deliverable + original requirements to QA Engineer via `sessions_send`
- QA reviews independently (must not see original agent's reasoning)
- QA produces PASS/FAIL validation report
- ATLAS reviews QA findings before approval

### 6. Supporting Checks
- [ ] Documentation included or updated
- [ ] Security considerations addressed
- [ ] Tests pass (unit, integration, eval as applicable)

### 7. Verdict

| Verdict | Action |
|---------|--------|
| APPROVE | Post to #approvals for Boss sign-off (if required) or proceed to next phase |
| RETURN | Send specific feedback + deadline back to agent via `sessions_send` |
| ESCALATE | Critical issue found — escalate to Boss with findings |
