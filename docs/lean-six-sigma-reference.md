# Lean Six Sigma Reference

## DMAIC Applied to Development

| Phase | Development Application | Key Questions |
|-------|------------------------|---------------|
| Define | Requirements extraction, SMART goals, CTQs, scope boundary | What does success look like? What are the customer's critical requirements? |
| Measure | Baseline metrics, current capability, data collection | Where are we now? What data supports our approach? |
| Analyze | Root cause analysis, Pareto, 5 Whys, statistical thinking | Why is the problem happening? What are the vital few causes? |
| Improve | Solution design, implementation, pilot testing | What changes will address root causes? |
| Control | Monitoring, standardization, sustaining gains | How do we verify and maintain improvements? |

### Example: Improving API Response Time
1. **Define**: API p95 latency is 2.5s, target is <1s. CTQ: user perceives fast response.
2. **Measure**: Baseline p95=2.5s, p50=800ms. 73% of slow responses from 2 endpoints.
3. **Analyze**: Pareto shows `/search` (45%) and `/reports` (28%) dominate. 5 Whys: unindexed DB queries.
4. **Improve**: Add indexes, implement caching, optimize query plans.
5. **Control**: Monitoring alert if p95 >1.2s. Weekly review of latency trends.

## Eight Wastes (TIMWOODS) in Development

| Waste | Development Context | Example |
|-------|-------------------|---------|
| Transport | Unnecessary handoffs between agents | Routing work through agents who don't add value |
| Inventory | Work in progress (WIP) pileup | Too many tasks started, none finished |
| Motion | Context switching, searching for information | Agent re-reading docs because memory wasn't saved |
| Waiting | Blocked on dependencies, approvals, responses | Agent idle waiting for ATLAS review |
| Overproduction | Building features not requested | Gold-plating, premature optimization |
| Over-processing | Unnecessary complexity, over-engineering | Abstraction layer for a one-time operation |
| Defects | Bugs, rework, failed evaluations | Code that fails QA and returns for rework |
| Skills | Underutilizing agent capabilities | Using Opus for tasks Haiku can handle |

## Key Metrics

| Metric | Formula | Target | Frequency |
|--------|---------|--------|-----------|
| First Pass Yield (FPY) | Deliverables approved without rework / total | > 80% | Per project |
| Cycle Time | Task assignment to delivery | Decreasing | Per task |
| Throughput Yield | Product of all step FPYs | > 70% | Per project |
| DPMO | Defects per million opportunities | < 66,800 (3 sigma) | Monthly |
| COPQ | Rework cost / total effort | < 10% | Monthly |
| WIP | Active tasks across all agents | < 2x agent count | Continuous |

## Core Principles

### Y = f(x)
Every outcome (Y) is a function of its input variables (x). Focus on controlling inputs to improve outputs.
- Y: On-time, high-quality delivery
- x: Clear requirements, correct architecture, adequate testing, proper tooling

### Q x A = E
Quality of solution (Q) times Acceptance by team (A) equals Effectiveness (E). A perfect solution nobody follows is worthless.

### Statistical Thinking
- All work is a process
- All processes have variation
- Understanding variation is key to improvement
- Common cause (systemic) vs special cause (one-off)

## PDCA Cycle

| Phase | Action | Development Application |
|-------|--------|------------------------|
| Plan | Define improvement, predict results | Countermeasure with expected impact |
| Do | Implement on small scale | Apply in next sprint/project |
| Check | Measure results vs prediction | Compare metrics to targets |
| Act | Standardize or adjust | Update processes, docs, tools |

## Control Chart Basics
- Center line: process mean
- UCL/LCL: Upper/Lower control limits (typically 3 sigma)
- Points within limits: common cause variation (normal)
- Points outside limits: special cause variation (investigate)
- Western Electric rules: patterns indicating process shift

## LSS Tools by Role

| Role | Primary Tools |
|------|--------------|
| ATLAS | DMAIC, PDCA, COPQ, TIMWOODS, Y=f(x) |
| Solutions Architect | SIPOC, CTQ trees, Pugh Matrix, FMEA, QFD |
| AI Engineer | SPC, FMEA, DOE, process capability, DPMO |
| QA Engineer | MSA, hypothesis testing, control charts, acceptance sampling, Cp/Cpk |
| DevOps Engineer | VSM, takt time, 5S, Kanban, SPC, Little's Law |
| Security Engineer | FMEA, Pareto, 5 Whys, Ishikawa, RPN |
| Backend Engineer | Poka-Yoke, First Pass Yield, cycle time, standard work |
| Frontend Engineer | VOC/CTQ, A3 thinking, First Pass Yield, Poka-Yoke |
| UI/UX Designer | Kano Model, VOC, QFD, A3 thinking |
| Technical Writer | Standard Work, Rolled Throughput Yield, PDCA |
| Data Engineer | MSA, process capability (Cpk), Little's Law, control charts |
