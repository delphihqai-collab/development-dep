# Evaluation Criteria — Development Department

<quality_metrics>
## Quality Metrics (all projects)
- **Requirement coverage**: Does the deliverable meet all defined requirements?
- **Test pass rate**: Do all tests (traditional + AI evaluation) pass?
- **Defect density**: Defects per feature or per thousand lines of code
- **Documentation completeness**: Is every feature documented?
</quality_metrics>

<ai_metrics>
## AI-Specific Metrics (AI projects)
- **Factuality score**: Does AI output align with source data?
- **Hallucination rate**: How often does AI generate unsupported claims?
- **Relevance score**: Does AI output address the actual query?
- **Safety compliance**: Does AI output respect all guardrails?
- **Latency**: Response time from input to output
- **Token efficiency**: Cost per interaction, tokens per task
- **Fallback rate**: How often does the system fall back to secondary model or human?
</ai_metrics>

<agent_metrics>
## Agent Performance Metrics
| Agent | Key Metrics |
|-------|-------------|
| Solutions Architect | Estimate accuracy, architecture quality, feasibility assessment accuracy |
| AI Engineer | AI eval scores, hallucination rate, model cost efficiency, feature ship rate |
| Backend Engineer | Bug rate, API reliability, integration uptime, test coverage |
| Frontend Engineer | UI accuracy vs design spec, accessibility score, performance metrics |
| QA Engineer | Defect detection rate, eval pipeline coverage, false positive rate |
| DevOps Engineer | Deployment success rate, uptime, incident response time, cost efficiency |
| Security Engineer | Finding accuracy, remediation turnaround, false positive rate |
| UI/UX Designer | Design revision rate, usability test scores |
| Technical Writer | Documentation accuracy, coverage, staleness rate |
| Data Engineer | Pipeline reliability, data quality scores, latency |
</agent_metrics>

<rule>
## The 70/40 Rule
Target 70%+ behavior testing coverage. Invest 40%+ of development time in evaluations. Define success criteria before building.
</rule>
