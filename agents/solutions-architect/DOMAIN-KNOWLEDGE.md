# Domain Knowledge — Solutions Architect

<architecture_patterns>
## Architecture Patterns
- **API-first**: Define OpenAPI contracts before implementation. Contracts are the source of truth.
- **Monolith-first**: Start monolithic for MVPs and proofs-of-concept. Extract microservices only when domain boundaries are proven.
- **Microservices**: For complex systems with clear domain boundaries. Each service owns its data. Communication via API or message queue.
- **Event-driven**: For async workflows, decoupled systems, and real-time requirements. Message queues for reliability, webhooks for simplicity.
- **CQRS**: For read-heavy systems with complex write logic. Separate read and write models when query patterns diverge significantly.
- **Serverless**: For event-triggered, low-volume, or bursty workloads. Avoid for latency-sensitive or long-running processes.
</architecture_patterns>

<estimation_heuristics>
## Estimation Heuristics
- Use ranges: optimistic / expected / pessimistic — never single-point estimates
- Factor 40% for AI evaluation time (70/40 rule)
- Include dependency and integration risk buffers (add 20-30% for external API integrations)
- Account for prompt engineering iteration cycles (typically 3-5 iterations to pass eval thresholds)
- RAG pipeline estimates: add 30-50% for data preparation, chunking optimization, and retrieval tuning
- Frontend estimates: add 20% for accessibility, responsive testing, and cross-browser verification
- Security review buffer: 2-3 days for standard projects, 5+ days for AI/data-sensitive projects
- Always state assumptions explicitly — estimates are only valid under stated assumptions
</estimation_heuristics>

<adr_conventions>
## ADR Conventions
- **Title**: Short decision statement (e.g., "Use PostgreSQL for primary data store")
- **Status**: Proposed → Accepted → Deprecated → Superseded by ADR-XXX
- **Context**: What forces are at play? What problem or opportunity prompted this decision?
- **Decision**: What was decided and why. Reference evaluation criteria and comparison data.
- **Alternatives**: What else was considered? Why were they rejected?
- **Consequences**: Positive, negative, and neutral outcomes. Include trade-offs accepted.
- **Compliance**: Security, performance, and cost implications.
</adr_conventions>

<technology_evaluation>
## Technology Evaluation Criteria
- **Capability fit**: Does it solve the actual problem? Evaluate against concrete requirements, not feature lists.
- **Integration complexity**: How much glue code? What's the learning curve? SDK quality?
- **Documentation quality**: Official docs, tutorials, API reference completeness
- **Community health**: GitHub activity, Stack Overflow presence, release cadence, maintainer responsiveness
- **Security posture**: CVE history, security audit results, dependency chain risk
- **Pricing model**: Free tier limits, scaling costs, hidden charges (egress, storage, API calls)
- **Reliability**: Uptime SLA, incident history, status page transparency
- **Vendor lock-in**: Data portability, API standards compliance, exit strategy feasibility
- **Sunset risk**: Company stability, competing products, technology trajectory
</technology_evaluation>

<delphi_stack>
## Delphi Stack Quick Reference
- **AI/LLM**: Claude (Anthropic) primary, OpenAI fallback
- **Backend**: Node.js/TypeScript, Python for ML/data
- **Frontend**: React/Next.js, Tailwind, Shadcn/ui
- **Data**: PostgreSQL, Redis, Pinecone/Weaviate for vectors
- **Infra**: Docker, AWS preferred, Terraform for IaC
- **CI/CD**: GitHub Actions
</delphi_stack>
