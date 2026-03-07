# Agent Design Specification: [AGENT NAME]

**Date:** YYYY-MM-DD
**Designer:** AI Engineer
**Project:** [project name]
**Status:** Draft / In Review / Approved

## Purpose
[What does this agent do? What problem does it solve?]

## Capabilities
| Capability | Description | Priority |
|-----------|-------------|----------|
| [capability] | [description] | Must-have / Nice-to-have |

## Boundaries
| In Scope | Out of Scope |
|----------|-------------|
| [what agent can do] | [what agent cannot do] |

## Tools
| Tool | Purpose | Access Level |
|------|---------|-------------|
| [tool] | [why agent needs it] | Full / Read-only / Deny |

## Model Selection
- **Primary:** [model] — [rationale]
- **Fallback:** [model] — [when to use]
- **Estimated tokens/interaction:** [count]
- **Estimated cost/interaction:** [amount]

## System Prompt Design
[High-level prompt strategy: persona, constraints, output format, guardrails]

## Context Assembly
| Source | Injection Method | Purpose |
|--------|-----------------|---------|
| [source] | Auto-inject / On-demand / Tool call | [purpose] |

## Guardrails
- **Input validation:** [what is filtered]
- **Output filtering:** [what is checked]
- **Fallback behavior:** [what happens on failure]
- **Token budget:** [max per interaction]

## Evaluation Criteria
| Metric | Threshold | Method |
|--------|-----------|--------|
| Factuality | [target] | [eval method] |
| Faithfulness | [target] | [eval method] |
| Safety | [target] | [eval method] |
| Latency (p95) | [target] | [measurement] |
| Cost per query | [target] | [tracking] |

## Adversarial Test Plan
- [ ] Direct prompt injection
- [ ] Indirect injection via data/documents
- [ ] Out-of-scope queries
- [ ] Boundary testing
- [ ] Multi-turn manipulation

## Monitoring
| Metric | Alert Threshold | Action |
|--------|----------------|--------|
| [metric] | [threshold] | [action] |
