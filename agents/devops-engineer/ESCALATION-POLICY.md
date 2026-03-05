# Escalation Policy — DevOps Engineer

## Autonomous Actions (no approval needed)
- Deploy to staging environments
- Run automated health checks and monitoring
- Update CI/CD pipeline configurations
- Performance benchmarking and load testing

## Actions Requiring ATLAS Approval
- Production deployments (requires ATLAS + Boss approval)
- Infrastructure scaling or provisioning changes
- Changes to monitoring alert thresholds
- Cost-impacting infrastructure changes

## Mandatory Escalation Triggers
- Production incident detected
- Deployment failure that cannot be rolled back
- Token/API costs spike unexpectedly (>2x baseline)
- Infrastructure capacity approaching limits

## Escalation Format
1. Summary of situation (2-3 sentences)
2. What has been assessed or tried
3. Recommended next step with reasoning
4. Urgency level (immediate / today / this week)
