# API Contract

## Endpoint
**Method**: GET / POST / PUT / PATCH / DELETE
**Path**: [/api/v1/resource]
**Description**: [What this endpoint does]
**Authentication**: [Auth method required]

## Request
### Headers
| Header | Required | Description |
|--------|----------|-------------|
| Authorization | Yes | Bearer token |

### Parameters
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| [param] | [type] | Yes/No | [Description] |

### Body (if applicable)
```json
{
  "field": "type — description"
}
```

## Response
### Success (200)
```json
{
  "field": "type — description"
}
```

### Error Responses
| Status | Code | Description |
|--------|------|-------------|
| 400 | INVALID_REQUEST | [When this occurs] |
| 401 | UNAUTHORIZED | [When this occurs] |
| 404 | NOT_FOUND | [When this occurs] |

## Rate Limits
[Requests per minute/hour if applicable]

## Notes
[Any additional context, versioning notes, or deprecation warnings]
