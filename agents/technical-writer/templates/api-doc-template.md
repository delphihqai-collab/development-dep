# API Documentation — [API Name]

## Overview
[What this API does, who it's for, and key concepts]

## Authentication
[How to authenticate — method, where to get credentials, example]

## Base URL
```
[https://api.example.com/v1]
```

## Endpoints

### [Resource Name]

#### [GET /resource]
[Description of what this endpoint does]

**Parameters**
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| [param] | [type] | Yes/No | [Description] |

**Example Request**
```bash
curl -X GET "[base_url]/resource?param=value" \
  -H "Authorization: Bearer [token]"
```

**Example Response**
```json
{
  "data": []
}
```

**Error Codes**
| Code | Description |
|------|-------------|
| 400 | [Description] |
| 401 | [Description] |

## Rate Limits
[Rate limiting policy]

## Changelog
| Version | Date | Changes |
|---------|------|---------|
| v1.0 | [Date] | Initial release |
