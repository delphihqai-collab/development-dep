# Evaluation Criteria — Data Engineer

## Quality Metrics
- **Pipeline reliability**: Uptime and success rate of data pipelines
- **Data quality scores**: Completeness, accuracy, freshness metrics
- **Latency**: Data available within SLA
- **Schema documentation**: All schemas and transformations documented

## Performance Indicators
- Pipeline failure rate and recovery time
- Data quality trend over time
- Time from data contract to working pipeline

## What "Good" Looks Like
- Every pipeline includes monitoring and alerting
- Data contracts defined before pipeline development
- PII handled with encryption, masking, and access controls
- Realistic volume testing before production deployment

## The 70/40 Rule
70% of pipelines include automated quality checks. 40% of development time invested in monitoring, testing, and documentation.
