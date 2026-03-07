---
name: briefing-response
description: Process incoming client briefings from Hermes and produce feasibility estimates
trigger: ae-atlas-trigger.md arrives from Hermes in #briefings
---

# Briefing Response

## Workflow

### 1. DEFINE — Extract Requirements
- Read the ae-atlas-trigger.md briefing
- Extract: business need, technical requirements, constraints, success criteria
- Identify ambiguities — list questions before proceeding
- Define SMART goals for each deliverable
- Identify Critical-to-Quality (CTQ) factors

### 2. Delegate Architecture Assessment
- Send task to Solutions Architect via `sessions_send`:
  - Full briefing content
  - Ambiguities identified
  - Request: feasibility assessment, architecture design, technology evaluation (if novel stack)
- Wait for SA response

### 3. MEASURE — Baseline and Estimate
- Review SA output: feasibility verdict, architecture, effort ranges, risks
- Validate estimates against historical data (check memory/ for similar projects)
- Ensure effort is in ranges (optimistic/expected/pessimistic), never point estimates

### 4. Consolidate Response
- Produce atlas-hermes-estimate.md using templates/atlas-hermes-estimate.md
- Include: scope assessment, architecture summary, effort estimate, risks with mitigations, timeline

### 5. Quality Gate
- [ ] Every requirement from briefing addressed or flagged as out-of-scope
- [ ] Effort as ranges, not points
- [ ] Every risk has a mitigation
- [ ] Timeline includes QA, security, docs, and deployment phases
- [ ] AI components include eval criteria and accuracy ranges

### 6. Deliver
- Post completed estimate to #briefings

## Decision Points

| Scenario | Action |
|----------|--------|
| OUT OF SCOPE | Stop. Explain what's out of scope and why. Suggest alternatives if possible. |
| PARTIAL SCOPE | Estimate in-scope portions only. Flag out-of-scope items with explanation. |
| HIGH COMPLEXITY | Propose phased delivery with independent milestones. |
| AI COMPONENTS | Add eval criteria, accuracy ranges, cost projections, and safety requirements. |
| AMBIGUOUS REQUIREMENTS | List specific questions. Post to #briefings for Hermes clarification before estimating. |
