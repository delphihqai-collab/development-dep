# Architecture Conventions

## Architecture Decision Records (ADRs)

### When to Write an ADR
- Technology selection (framework, database, service, model)
- Architecture pattern choice (monolith vs microservices, sync vs async)
- Integration approach (REST vs GraphQL vs gRPC)
- AI model selection or switching
- Any decision with significant cost, timeline, or reversibility implications

### ADR Format
Use templates/architecture-decision-record.md. Key fields:
- **Status**: Proposed / Accepted / Deprecated / Superseded
- **Context**: What is the issue?
- **Decision**: What did we decide?
- **Alternatives considered**: Minimum 2 alternatives with comparison
- **Consequences**: What are the trade-offs?

## API Conventions

### REST Standards
- Versioned: `/api/v1/resource`
- Plural nouns: `/api/v1/users` not `/api/v1/user`
- HTTP methods: GET (read), POST (create), PUT (full update), PATCH (partial update), DELETE
- Pagination: `?page=1&limit=20` with `Link` header
- Filtering: query parameters `?status=active&type=admin`
- Response envelope: `{ data: ..., meta: { page, limit, total } }`

### Error Format
```json
{
  "error": {
    "code": "VALIDATION_ERROR",
    "message": "Human-readable message",
    "details": [{ "field": "email", "issue": "invalid format" }]
  }
}
```

### Status Codes
- 200 OK, 201 Created, 204 No Content
- 400 Bad Request, 401 Unauthorized, 403 Forbidden, 404 Not Found, 409 Conflict, 422 Unprocessable Entity, 429 Too Many Requests
- 500 Internal Server Error, 503 Service Unavailable

## Code Conventions

### Git
- Branch naming: `feature/description`, `fix/description`, `hotfix/description`
- Commits: imperative mood, explain why not what ("Add auth middleware for JWT validation")
- PRs: description, test plan, breaking changes noted
- No secrets in repos — ever

### Code Quality
- Tests for all code (unit + integration)
- Error handling for all expected failure modes
- No commented-out code in production
- Self-documenting code; comments only where intent is non-obvious

## AI Conventions

### Eval-Before-Ship
- No AI feature ships without an evaluation suite
- Minimum metrics: factuality, faithfulness, relevance, safety
- Adversarial testing required: prompt injection, edge cases, out-of-scope

### Prompt Versioning
- System prompts versioned as files in workspace
- Changes tracked with rationale
- A/B testing via eval suite before switching

### Fallback Behavior
- Every model integration has a fallback chain
- Graceful degradation: if AI fails, user gets a useful response (not a crash)
- Circuit breaker pattern for repeated failures

### Guardrails
- Input validation on all user-provided content
- Output filtering for sensitive content
- Token budget enforcement per request

### Cost Tracking
- Token usage tracked per feature and per agent
- Cost projections in feasibility assessments
- Alert on cost spikes (>150% of expected)

## Integration Conventions

### Idempotency
- All write operations must be idempotent
- Use idempotency keys for payment and critical operations
- Duplicate messages produce the same result

### Monitoring
- Health check endpoint for every service
- RED metrics: Rate, Errors, Duration
- Alerts before users notice

### Data Contracts
- Schema defined before implementation
- Breaking changes require versioning
- Contract tests between producer and consumer

## Security Conventions

- OWASP Top 10 addressed in every review
- Secrets in environment variables or secret manager — never in code
- Least-privilege access for all services
- AI-specific: prompt injection testing, data access audit
- Dependency scanning in CI pipeline

## Documentation Conventions

- Every feature has user-facing documentation
- API endpoints have request/response examples
- AI features document capabilities AND limitations
- Runbooks for operational procedures
- Docs version alongside code releases
