# Domain Knowledge — DevOps Engineer

<deployment>
## Deployment Checklist Conventions
- **Pre-deploy**: Approval verified, staging passed, rollback plan documented, monitoring configured, database migrations tested
- **Deploy**: Incremental rollout (canary → 10% → 50% → 100%), health checks at each stage, automated rollback on failure
- **Post-deploy**: Monitor 30 minutes for anomalies, verify metrics within baseline, confirm no error rate spike
- **Rollback**: Automated trigger on health check failure. Manual trigger available for ATLAS/Boss. Target rollback time < 5 minutes.
- **Documentation**: Every deployment logged with who/what/when/outcome/approver in memory/
</deployment>

<monitoring>
## Monitoring Patterns
- **Health checks**: HTTP 200 from `/health` endpoint. Include dependency health (DB, cache, external APIs). Fail open on non-critical deps.
- **Metrics**: Latency p50/p95/p99, error rate (4xx and 5xx separately), throughput (requests/second), saturation (CPU, memory, connections)
- **Alerts**: Error rate >1% for 5 minutes, latency p95 >2s, availability <99.9%, disk >85%, memory >90%
- **AI-specific**: Token cost per hour/day, model latency per provider, fallback trigger rate, eval score drift
- **Dashboards**: One dashboard per service. Overview dashboard for department-wide health. AI cost dashboard.
- **On-call**: Runbooks for every alert. Escalation path defined. Post-incident review for every SEV1/SEV2.
</monitoring>

<incident_severity>
## Incident Severity Levels
- **SEV1**: Complete outage, all users affected. Immediate response. All hands. Communicate every 15 minutes.
- **SEV2**: Major degradation, most users affected. Response within 30 minutes. Dedicated responder.
- **SEV3**: Partial degradation, some users affected. Response within 2 hours. Normal priority.
- **SEV4**: Minor issue, few users affected. Next business day. Track and fix.

## Incident Response Protocol
1. Detect → 2. Assess severity → 3. Mitigate (restore service) → 4. Diagnose (root cause) → 5. Fix → 6. Document → 7. Review (prevention)
</incident_severity>

<llmops>
## LLMOps Patterns
- **Prompt versioning**: Treat prompts as code artifacts with git versioning. Tag deployments. Enable rollback to previous prompt version.
- **Token cost tracking**: Per-feature, per-model, per-day granularity. Budget alerts at 80% of threshold. Weekly cost reports.
- **Model fallback chains**: Primary → secondary → cached response → graceful degradation. Each level independently monitored.
- **Eval-in-CI**: Run evaluation suite on every prompt or model change. Block deployment if scores drop below threshold.
- **A/B testing**: Route percentage of traffic to new prompt/model version. Compare metrics before full rollout.
</llmops>

<delphi_infra>
## Delphi Infrastructure Reference
- **Containers**: Docker with multi-stage builds. Minimal base images (Alpine/distroless).
- **Cloud**: AWS preferred (ECS/Fargate for containers, RDS for PostgreSQL, ElastiCache for Redis, S3 for storage)
- **IaC**: Terraform for infrastructure provisioning. Version controlled, peer reviewed.
- **CI/CD**: GitHub Actions. Separate workflows for test, build, deploy. Environment-specific secrets.
- **Secrets**: AWS Secrets Manager or Parameter Store. Never in code, env files, or logs.
</delphi_infra>
