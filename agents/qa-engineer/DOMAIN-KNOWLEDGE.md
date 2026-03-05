# Domain Knowledge — QA Engineer

<test_strategy>
## Test Strategy Patterns
- **Test pyramid**: Unit (many, fast) → Integration (moderate) → Contract (API boundaries) → E2E (few, slow) → Exploratory (human judgment)
- **Risk-based testing**: Prioritize by business impact and change frequency. New code and critical paths get deepest coverage.
- **Boundary value analysis**: Test at exact boundaries (min, min+1, max-1, max) and just outside (min-1, max+1)
- **Equivalence partitioning**: Divide input space into classes that should behave identically. Test one representative per class.
- **State transition testing**: Map valid state transitions. Test each transition and invalid transitions.
- **Regression testing**: Re-run after every change. Automate to prevent regression debt. Prioritize by past failure frequency.
</test_strategy>

<defect_severity>
## Defect Severity Definitions
- **Critical**: System unusable, data loss, security breach, production outage. Immediate fix required.
- **High**: Major feature broken, no workaround available. Fix before next release.
- **Medium**: Feature partially broken, workaround exists but impacts productivity. Fix in current sprint.
- **Low**: Minor issue, cosmetic, edge case with minimal user impact. Fix when convenient.

## Defect Report Requirements
Every defect report must include: title, severity, expected behavior, actual behavior, steps to reproduce, environment details, evidence (logs/screenshots). Ambiguous reports waste engineering time.
</defect_severity>

<ai_eval_glossary>
## AI Evaluation Glossary
- **Eval dataset**: Curated test cases with known-good answers. Should cover happy path, edge cases, and adversarial inputs. Minimum 50 cases for meaningful statistical analysis.
- **LLM-as-judge**: Using a language model (often a stronger one) to evaluate another model's output against criteria. Calibrate with human-labeled samples first.
- **Pass/fail threshold**: Minimum acceptable score for deployment. Set before evaluation, not after seeing results. Typically 0.80-0.95 depending on metric and use case.
- **Adversarial testing**: Inputs designed to break or manipulate AI behavior — prompt injection, jailbreak attempts, out-of-scope queries, edge case inputs.
- **Regression eval**: Re-running full eval suite after prompt changes, model updates, or data changes. Compare scores to baseline. Flag any degradation.
- **Inter-rater reliability**: Agreement between multiple judges (human or LLM). Cohen's kappa > 0.6 indicates acceptable agreement.
</ai_eval_glossary>

<the_rule>
## The 70/40 Rule Applied
- Target 70%+ behavior testing coverage for AI features (not just line coverage — test actual behaviors and edge cases)
- Invest 40%+ of development time in evaluation design, dataset creation, and execution
- Define success criteria before any testing begins — never reverse-engineer thresholds from results
- Eval datasets are living artifacts — update with new failure cases discovered in production
</the_rule>

<judge_mode>
## Output Validation (Judge Mode) Reference
When activated as validator by ATLAS:
1. Treat the deliverable as untrusted — verify independently
2. Cross-reference every factual claim against provided sources
3. Check numerical accuracy (calculations, metrics, estimates, dates)
4. Flag logical gaps, unsupported assertions, and internal contradictions
5. Produce structured PASS/FAIL report with specific findings and confidence score
</judge_mode>
