# Data Contract

## Source
**System**: [Source system name]
**Format**: [JSON / CSV / SQL / API / Event stream]
**Frequency**: [Real-time / Hourly / Daily / On-demand]
**Volume**: [Expected records per batch/day]
**Owner**: [Team or system responsible]

## Schema
| Field | Type | Nullable | Description | Constraints |
|-------|------|----------|-------------|-------------|
| [field] | [type] | Yes/No | [Description] | [Validation rules] |

## Quality Expectations
| Dimension | Requirement |
|-----------|-------------|
| Completeness | [% of records with all required fields] |
| Accuracy | [Validation rules or source of truth] |
| Freshness | [Maximum age of data] |
| Uniqueness | [Deduplication rules] |

## SLA
- **Availability**: [Uptime expectation]
- **Latency**: [Max time from source to destination]
- **Error budget**: [Acceptable failure rate]

## Transformations
| Step | Description | Input | Output |
|------|-------------|-------|--------|
| [Step 1] | [What it does] | [Format] | [Format] |

## Downstream Consumers
| Consumer | Usage | Impact of Failure |
|----------|-------|-------------------|
| [System] | [How they use this data] | [What breaks] |
