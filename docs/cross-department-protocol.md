# Cross-Department Protocol

## ATLAS <-> Hermes Communication

### Channels

| Channel | Purpose | Direction |
|---------|---------|-----------|
| #briefings | Client briefings and feasibility estimates | Bidirectional |
| #atlas-hermes | Direct coordination, scope questions, demo prep | Bidirectional |

### Briefing Intake Flow
1. Hermes posts ae-atlas-trigger.md to #briefings
2. ATLAS reads briefing, runs briefing-response skill
3. ATLAS delegates to Solutions Architect for feasibility
4. ATLAS produces atlas-hermes-estimate.md
5. ATLAS posts estimate to #briefings
6. Hermes reviews and relays to client

### Estimate Response Format
Use templates/atlas-hermes-estimate.md:
- Scope assessment (IN SCOPE / OUT OF SCOPE / PARTIAL)
- Architecture summary
- Effort estimate (optimistic / expected / pessimistic)
- Risks with mitigations
- Timeline with phases
- AI-specific: eval criteria, accuracy ranges, cost projections

### Response Timing
| Briefing Complexity | Target Response |
|-------------------|-----------------|
| Simple (clear scope, known tech) | Same day |
| Medium (some unknowns) | 1-2 business days |
| Complex (novel tech, large scope) | 3-5 business days |

### Scope Changes
1. Hermes posts scope change request to #atlas-hermes
2. ATLAS assesses impact (effort, timeline, cost, risk)
3. ATLAS responds with impact assessment
4. Boss approval required if >20% effort change
5. ATLAS updates project plan and notifies affected agents

### Demo Preparation
1. Hermes requests demo preparation via #atlas-hermes
2. ATLAS coordinates with relevant agents to prepare demo environment
3. DevOps ensures staging environment is ready
4. ATLAS confirms readiness to Hermes

### Conflict Resolution
If ATLAS and Hermes disagree on scope, feasibility, or timeline:
1. Both document their position with evidence
2. Escalate to Boss via #atlas-chat
3. Boss makes final decision
4. Decision documented and respected

## NEXUS Integration (Future)
Placeholder for future department-wide coordination system.
- Cross-department project tracking
- Shared resource allocation
- Unified knowledge base
- Inter-department escalation protocol

## Rules
- ATLAS never contacts clients directly — all client communication through Hermes
- Hermes never assigns work to individual agents — all work through ATLAS
- Both departments respect each other's internal processes
- Disagreements escalated to Boss, not resolved by overriding
