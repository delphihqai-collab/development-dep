# Integration Specification

## Integration
**Name**: [Integration name]
**External System**: [System/API name]
**Type**: REST API / Webhook / Event / File Transfer
**Direction**: Inbound / Outbound / Bidirectional

## Authentication
**Method**: [API key / OAuth / JWT / etc.]
**Credentials**: [Reference to secure credential storage — never include actual values]

## Data Contract
### Outbound (we send)
```json
{
  "field": "type — description"
}
```

### Inbound (we receive)
```json
{
  "field": "type — description"
}
```

## Error Handling
| Scenario | Behavior |
|----------|----------|
| Timeout (>Xs) | [Retry strategy] |
| Rate limited (429) | [Backoff strategy] |
| Auth failure (401) | [Re-auth or escalate] |
| Server error (5xx) | [Retry or circuit break] |

## Monitoring
- Health check endpoint: [URL or method]
- Key metrics: [What to monitor]
- Alert thresholds: [When to alert]

## Testing
- Sandbox/staging environment: [URL or config]
- Test credentials: [Reference — never actual values]
