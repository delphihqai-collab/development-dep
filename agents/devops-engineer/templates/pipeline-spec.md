# Pipeline Specification: [PIPELINE NAME]

**Date:** YYYY-MM-DD
**Author:** DevOps Engineer
**Project:** [project name]
**Type:** CI / CD / CI+CD

## Overview
[What this pipeline does and when it runs]

## Trigger
| Event | Branch/Tag | Conditions |
|-------|-----------|------------|
| [push / PR / tag / manual / schedule] | [branch pattern] | [path filters, conditions] |

## Stages

### 1. [Stage Name]
- **Runner:** [environment]
- **Steps:**
  1. [step description]
  2. [step description]
- **Artifacts:** [what is produced]
- **Failure action:** [block / warn / skip]

### 2. [Stage Name]
[same structure]

## Environment Variables
| Variable | Source | Required | Description |
|----------|--------|----------|-------------|
| [var] | Secret / Config / Computed | Yes/No | [description] |

## Dependencies
| Dependency | Version | Source |
|-----------|---------|--------|
| [dependency] | [version] | [registry] |

## Health Checks
| Check | Endpoint | Expected | Timeout |
|-------|----------|----------|---------|
| [service] | [url] | [response] | [seconds] |

## Rollback Plan
1. [how to detect failure]
2. [how to rollback]
3. [how to verify rollback succeeded]

## Monitoring
| Metric | Alert Threshold | Channel |
|--------|----------------|---------|
| Build duration | > [time] | #atlas-logs |
| Failure rate | > [percentage] | #critical-alerts |
| Deploy frequency | < [frequency] | #atlas-logs |

## Security
- [ ] Secrets not exposed in logs
- [ ] Dependencies scanned for vulnerabilities
- [ ] Container images scanned
- [ ] Least-privilege access for pipeline service account
