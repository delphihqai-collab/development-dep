# Domain Knowledge — Development Department

<tech_stack>
## Delphi Tech Stack Preferences
- **AI/LLM**: Claude (Anthropic) as primary, OpenAI as fallback. Claude Opus for complex reasoning and coding. Claude Sonnet for general-purpose work. Claude Haiku for high-volume, low-complexity tasks.
- **Backend**: Node.js/TypeScript preferred for web services. Python for ML/data pipelines and scripting. Go for performance-critical services.
- **Frontend**: React/Next.js with TypeScript. Tailwind CSS for styling. Shadcn/ui for component library base.
- **Infrastructure**: Docker for containerization. Cloud-native deployments (AWS preferred, GCP secondary). Terraform for IaC.
- **Data**: PostgreSQL primary relational DB. Redis for caching and session storage. Pinecone/Weaviate for vector storage in RAG. DuckDB for analytical queries.
- **Version Control**: Git, GitHub. Trunk-based development with short-lived feature branches.
- **CI/CD**: GitHub Actions preferred. Deployment gates with automated testing and eval pipelines.
- **Monitoring**: Structured logging (JSON). Prometheus/Grafana for metrics. PagerDuty for alerting.
</tech_stack>

<architectural_conventions>
## Architectural Conventions
- API-first design — define OpenAPI contracts before implementation
- Microservices for complex systems with clear domain boundaries, monolith-first for MVPs and proofs-of-concept
- Event-driven architecture for async workflows (message queues, webhooks)
- Infrastructure as Code for all deployments — no manual configuration
- Twelve-factor app principles for all services
- Database migrations versioned and reversible
- Feature flags for gradual rollouts and kill switches
</architectural_conventions>

<ai_principles>
## AI-First Design Principles
- **Eval before build**: Define success metrics and build evaluation datasets before writing any AI code
- **Human-in-the-loop**: High-stakes decisions always surface to human review. AI suggests, human decides.
- **Fallback chains**: Every AI feature has a degradation path (primary model → fallback model → cached response → graceful error)
- **Cost awareness**: Track token usage per feature, per model, per day. Set budget alerts at 80% of threshold. Optimize prompts for token efficiency without sacrificing quality.
- **Safety by default**: Input validation, output filtering, prompt injection defense, content safety classification on all user-facing AI
- **Prompt versioning**: Treat system prompts as code artifacts. Version, review, test, and deploy them through CI/CD.
- **Observability**: Log all AI interactions (sanitized) for debugging. Track latency, cost, quality metrics in production.
</ai_principles>

<delivery_methodology>
## Project Delivery Methodology
- **Pipeline**: Briefing → Feasibility → Architecture → Build → Test → Security → Document → Deploy
- **Quality gates**: Every phase transition requires explicit review and sign-off
- **Pod model**: 3-5 agents per project, cross-functional (builder + QA + design access minimum)
- **AI evaluation**: Integrated into CI/CD where applicable. Eval suite ships with every AI feature.
- **Documentation**: Ships with every release. No feature is complete without documentation.
- **Security**: Review happens before deployment, not after. AI safety testing is part of standard review.
</delivery_methodology>

<estimation_conventions>
## Estimation Conventions
- Use ranges: optimistic / expected / pessimistic — never single-point estimates
- Include dependencies and risks in every estimate
- Factor AI evaluation time: 40% of dev time per the 70/40 rule
- Account for prompt engineering iteration cycles (typically 3-5 iterations to pass eval)
- RAG pipeline estimates should include data preparation, chunking optimization, and retrieval tuning
- Integration estimates should include error handling, retry logic, and monitoring setup
- Always state assumptions explicitly — estimates are only valid under stated assumptions
</estimation_conventions>

<coding_standards>
## Coding Standards
- TypeScript strict mode for all TS projects
- ESLint + Prettier for JS/TS. Black + ruff for Python.
- Meaningful variable names over comments. Comments explain why, not what.
- Error handling at system boundaries. Internal code trusts its own types.
- Test naming: `should [expected behavior] when [condition]`
- API error responses: consistent JSON format with error code, message, and request ID
- Git commits: imperative mood, concise subject, body explains why
</coding_standards>
