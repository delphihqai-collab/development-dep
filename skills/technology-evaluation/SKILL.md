---
name: technology-evaluation
description: Evaluate and compare technology options for project decisions
trigger: Novel technology decision needed
---

# Technology Evaluation

## Workflow

### 1. DEFINE — Criteria and Weights

| Criterion | Weight | Description |
|-----------|--------|-------------|
| Capability fit | 25% | Does it meet functional requirements? |
| Integration complexity | 20% | How hard to integrate with our stack? |
| Security | 15% | Vulnerability history, auth model, compliance |
| Documentation quality | 10% | Comprehensive, accurate, maintained? |
| Community health | 10% | Active development, issue response time, contributors |
| Pricing | 10% | Total cost including scaling |
| Reliability | 5% | Uptime history, SLA, incident response |
| Longevity | 5% | Funding, adoption trend, sunset risk |

### 2. MEASURE — Research Candidates
- Identify minimum 3 candidates
- For each candidate, gather data on all criteria
- Use browser for docs, changelogs, pricing pages, community metrics
- Send research task to Solutions Architect via `sessions_send` if deep architecture analysis needed

### 3. ANALYZE — Score and Compare

| Candidate | Capability (25%) | Integration (20%) | Security (15%) | Docs (10%) | Community (10%) | Price (10%) | Reliability (5%) | Longevity (5%) | Total |
|-----------|---|----|---|----|---|----|---|----|-------|
| Option A | ? | ? | ? | ? | ? | ? | ? | ? | ? |
| Option B | ? | ? | ? | ? | ? | ? | ? | ? | ? |
| Option C | ? | ? | ? | ? | ? | ? | ? | ? | ? |

Score each 1-5, multiply by weight, sum for total.

### 4. Risk Assessment
For top 2 candidates:

| Risk | Likelihood | Impact | Mitigation |
|------|-----------|--------|------------|
| Vendor lock-in | ? | ? | ? |
| Sunset / abandonment | ? | ? | ? |
| Licensing changes | ? | ? | ? |
| Scaling limitations | ? | ? | ? |

### 5. Prototype (if feasible)
- Build minimal proof-of-concept with top 2 candidates
- Measure: integration time, developer experience, performance

### 6. Recommend
- Primary recommendation with rationale
- Runner-up with comparison
- Update docs/tech-radar.md with decision
