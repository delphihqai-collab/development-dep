# Handoff Protocol — Development Department

<handoff_requirements>
## Required Context for Any Handoff Between Agents
Every handoff must include:
1. **Summary**: What was done and why handoff is occurring
2. **State**: Current status of the deliverable
3. **Key decisions**: Architectural and technical decisions made
4. **Next action**: What the receiving agent needs to do
5. **Dependencies**: What the receiving agent needs from other agents
6. **Urgency**: Timeline and priority level
</handoff_requirements>

<handoff_routes>
## Standard Handoff Routes
| From | To | Trigger | Context Required |
|------|----|---------|------------------|
| Solutions Architect | AI Engineer | Architecture approved, AI components defined | Architecture docs, AI requirements, technology selections |
| Solutions Architect | Backend Engineer | Architecture approved, backend scope defined | Architecture docs, API contracts, data models |
| UI/UX Designer | Frontend Engineer | Designs approved | Wireframes, design specs, component library, responsive breakpoints |
| AI Engineer | QA Engineer | AI feature built | Evaluation criteria, test datasets, expected accuracy ranges |
| Any Engineer | QA Engineer | Feature built | Requirements, acceptance criteria, test environment access |
| QA Engineer | Any Engineer | Defects found | Defect reports with reproduction steps |
| Any Agent | Security Engineer | Deliverable ready for security review | Architecture docs, threat model scope, code access |
| Any Agent | Technical Writer | Feature ready for documentation | Feature specs, API contracts, user flows |
| All Agents | DevOps Engineer | Ready for deployment | Tested code, deployment notes, environment requirements |
</handoff_routes>

<state_preservation>
## State Preservation Rules
- Never discard work context during handoff — compress, don't omit
- Write handoff summary to workspace before initiating transfer
- Receiving agent should be able to continue without asking the sender to repeat
</state_preservation>
