# Data Quality Report: [DATASET/PIPELINE NAME]

**Date:** YYYY-MM-DD
**Author:** Data Engineer
**Project:** [project name]
**Data Source:** [source system]
**Records Analyzed:** [count]

## Quality Dimensions

| Dimension | Score | Threshold | Status | Notes |
|-----------|-------|-----------|--------|-------|
| Completeness | [%] | [target %] | PASS/FAIL | [missing fields, null rates] |
| Accuracy | [%] | [target %] | PASS/FAIL | [validation method] |
| Consistency | [%] | [target %] | PASS/FAIL | [cross-field checks] |
| Timeliness | [metric] | [target] | PASS/FAIL | [freshness, latency] |
| Uniqueness | [%] | [target %] | PASS/FAIL | [duplicate rate] |
| Validity | [%] | [target %] | PASS/FAIL | [format, range checks] |

## Field-Level Analysis

| Field | Type | Null % | Distinct | Min | Max | Issues |
|-------|------|--------|----------|-----|-----|--------|
| [field] | [type] | [%] | [count] | [min] | [max] | [issues] |

## Anomalies Detected

| ID | Field | Type | Description | Severity | Count |
|----|-------|------|-------------|----------|-------|
| DQ-001 | [field] | Outlier / Missing / Format / Duplicate | [description] | High/Medium/Low | [count] |

## Data Contract Compliance

| Contract Rule | Status | Details |
|--------------|--------|---------|
| Schema matches contract | PASS/FAIL | [deviations] |
| All required fields present | PASS/FAIL | [missing fields] |
| Value ranges within spec | PASS/FAIL | [out-of-range fields] |
| Referential integrity | PASS/FAIL | [orphaned records] |

## Pipeline Health

| Metric | Value | Threshold | Status |
|--------|-------|-----------|--------|
| Records processed | [count] | [expected] | OK / WARN |
| Processing time | [duration] | [target] | OK / WARN |
| Error rate | [%] | [target %] | OK / WARN |
| Throughput | [records/sec] | [target] | OK / WARN |

## Recommendations

| Priority | Issue | Recommendation | Impact |
|----------|-------|---------------|--------|
| P1 | [issue] | [fix] | [impact] |

## Overall Verdict
**Quality Score:** [aggregate score]
**Status:** PASS / CONDITIONAL PASS / FAIL
**Conditions:** [what must be fixed if conditional]
