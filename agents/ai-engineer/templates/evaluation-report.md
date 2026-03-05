# AI Evaluation Report

## Feature
**Name**: [Feature name]
**Model**: [Model used]
**Date**: [Evaluation date]
**Evaluator**: AI Engineer

## Evaluation Dataset
- **Size**: [Number of test cases]
- **Categories**: [Types of test cases — happy path, edge cases, adversarial]
- **Source**: [How dataset was created]

## Results Summary
| Metric | Score | Threshold | Status |
|--------|-------|-----------|--------|
| Factuality | [score] | [threshold] | PASS / FAIL |
| Faithfulness | [score] | [threshold] | PASS / FAIL |
| Relevance | [score] | [threshold] | PASS / FAIL |
| Safety | [score] | [threshold] | PASS / FAIL |
| Latency (p95) | [ms] | [threshold] | PASS / FAIL |
| Token cost/query | [tokens] | [budget] | PASS / FAIL |

## Overall: PASS / FAIL

## Weak Points
- [Weakness 1]: [Description and example]
- [Weakness 2]: [Description and example]

## Adversarial Testing
| Attack Type | Result |
|-------------|--------|
| Direct prompt injection | Blocked / Partial / Bypassed |
| Indirect injection via docs | Blocked / Partial / Bypassed |
| Out-of-scope queries | Handled / Leaked |

## Recommendations
1. [Recommendation with priority]
2. [Recommendation with priority]

## Next Steps
- [ ] [Action item 1]
- [ ] [Action item 2]
