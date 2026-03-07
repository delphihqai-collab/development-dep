---
name: continuous-improvement
description: Analyze department performance metrics and identify improvements
trigger: End of project or monthly review
---

# Continuous Improvement

## Workflow

### 1. MEASURE — Collect Metrics
Gather from memory/ and project records:

| Metric | Source | Target |
|--------|--------|--------|
| Cycle time | Task start to delivery | Decreasing trend |
| First Pass Yield (FPY) | Deliverables approved without rework | > 80% |
| Defect density | Defects per deliverable | Decreasing trend |
| COPQ (Cost of Poor Quality) | Rework time + defect resolution | < 10% of total effort |
| AI eval scores | Eval pipeline results | Above threshold per metric |
| Token cost per feature | Usage tracking | Within budget |

### 2. ANALYZE — Find Root Causes
- Compare current metrics against baselines
- Pareto analysis: identify the vital few causes (80/20)
- 5 Whys on top 3 issues
- Categorize: process issue, skill gap, tooling gap, requirement gap

### 3. IMPROVE — Define Countermeasures
For each identified issue:

| Field | Content |
|-------|---------|
| Problem statement | What is happening? |
| Root cause | Why is it happening? (from 5 Whys) |
| Countermeasure | What will fix it? |
| Expected impact | How much improvement? |
| Owner | Which agent or process? |

### 4. CONTROL — Verify and Sustain
- Define verification metric for each countermeasure
- Set timeline for measurement
- Set target threshold
- Schedule follow-up check

### 5. Update Knowledge Base
- Update MEMORY.md with key findings
- Update docs/tech-radar.md if technology decisions changed
- Post summary to #knowledge-base

## PDCA Cycle
- **Plan**: Countermeasures defined with expected impact
- **Do**: Implement changes in next project cycle
- **Check**: Measure results against targets
- **Act**: Standardize what works, adjust what doesn't
