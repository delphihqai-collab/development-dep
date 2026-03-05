# Deployment Checklist

## Deployment
**Project**: [Project name]
**Version**: [Version/commit]
**Date**: [Deployment date]
**Engineer**: DevOps Engineer
**Approver**: [ATLAS / Boss]

## Pre-Deployment
- [ ] ATLAS/Boss approval received
- [ ] All tests passing in CI
- [ ] Staging deployment successful
- [ ] Health checks passing in staging
- [ ] Rollback plan documented
- [ ] Monitoring and alerting configured
- [ ] Database migrations tested (if applicable)
- [ ] Environment variables verified

## Deployment Steps
1. [ ] Deploy to staging → verify
2. [ ] Run smoke tests in staging
3. [ ] Deploy to production (incremental rollout)
4. [ ] Verify health checks in production
5. [ ] Run smoke tests in production
6. [ ] Monitor metrics for 30 minutes

## Post-Deployment
- [ ] All health checks passing
- [ ] Error rates within baseline
- [ ] Performance metrics within baseline
- [ ] AI metrics within baseline (if applicable)
- [ ] Deployment logged in memory/

## Rollback Plan
**Trigger**: [Conditions that trigger rollback]
**Steps**: [How to rollback]
**Estimated time**: [Minutes to complete rollback]
