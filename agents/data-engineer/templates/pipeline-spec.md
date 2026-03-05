# Pipeline Specification

## Pipeline
**Name**: [Pipeline name]
**Type**: ETL / ELT / Streaming
**Schedule**: [Cron expression or trigger]
**Owner**: Data Engineer

## Overview
[What this pipeline does and why]

## Source(s)
| Source | Type | Credentials | Data Contract |
|--------|------|-------------|---------------|
| [Source] | [API/DB/File] | [Ref to secret store] | [Link to contract] |

## Processing Steps
1. **Extract**: [How data is read from source]
2. **Transform**: [Business logic applied]
3. **Validate**: [Quality checks performed]
4. **Load**: [Where data is written]

## Error Handling
| Error Type | Behavior |
|-----------|----------|
| Source unavailable | [Retry/skip/alert] |
| Validation failure | [Quarantine/reject/flag] |
| Load failure | [Retry/dead-letter/alert] |

## Monitoring
| Metric | Alert Threshold |
|--------|----------------|
| Records processed | [Expected range] |
| Error rate | [Max acceptable %] |
| Latency | [Max acceptable time] |
| Data freshness | [Max staleness] |

## Dependencies
- [Upstream pipeline or system]
- [Infrastructure requirements]

## Rollback
[How to reprocess or undo a bad run]
