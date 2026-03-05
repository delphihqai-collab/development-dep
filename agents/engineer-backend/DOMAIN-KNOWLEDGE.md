# Domain Knowledge — Engineer (Backend)

<api_design>
## API Design Conventions
- RESTful with consistent resource naming (plural nouns: `/users`, `/projects`)
- Versioned endpoints (`/api/v1/resource`) — never break existing contracts
- Standard HTTP status codes: 200 success, 201 created, 400 bad request, 401 unauthorized, 403 forbidden, 404 not found, 409 conflict, 422 validation error, 429 rate limited, 500 server error
- Consistent error response format: `{ "error": { "code": "ERROR_CODE", "message": "Human-readable message", "request_id": "uuid" } }`
- Pagination: cursor-based for large datasets, offset-based for small. Always include total count.
- Filtering via query params: `?status=active&sort=created_at&order=desc`
- OpenAPI spec defined before implementation — spec is the contract
</api_design>

<integration_patterns>
## Integration Patterns
- **Retry with exponential backoff**: Base delay 1s, multiplier 2x, max 3 retries, jitter to prevent thundering herd
- **Circuit breaker**: Open after 5 consecutive failures, half-open after 30s, close on success. Prevents cascade failures.
- **Idempotency keys**: Required for all write operations. Client-generated UUID in header. Server deduplicates.
- **Webhook verification**: Validate HMAC signature on all incoming webhooks. Reject unsigned or expired payloads.
- **Rate limit handling**: Respect `Retry-After` headers. Implement token bucket for outbound calls. Log rate limit events.
- **Timeout hierarchy**: Connect timeout 5s, read timeout 30s, total timeout 60s. Shorter for user-facing, longer for batch.
</integration_patterns>

<testing_conventions>
## Testing Conventions
- **Unit tests**: Isolated, fast, no external dependencies. Mock external services. Target 80%+ line coverage.
- **Integration tests**: Real dependencies in controlled environment (Docker containers, test databases). Test actual API contracts.
- **Contract tests**: Validate API contracts between services. Consumer-driven contracts where applicable.
- **Test naming**: `should [expected behavior] when [condition]` — reads as specification
- **Test data**: Factory functions over fixtures. Unique data per test to prevent inter-test coupling.
- **CI gate**: All tests must pass before merge. No skipped tests without documented reason.
</testing_conventions>

<delphi_stack>
## Delphi Stack Reference
- **Runtime**: Node.js 20+ with TypeScript strict mode
- **Framework**: Express or Fastify for APIs. Nest.js for complex services.
- **ORM**: Prisma preferred. Drizzle for lightweight. Raw SQL for complex queries.
- **Database**: PostgreSQL primary. Redis for caching, sessions, rate limiting.
- **Validation**: Zod for runtime schema validation
- **Auth**: JWT with refresh token rotation. OAuth 2.0 for third-party.
</delphi_stack>
