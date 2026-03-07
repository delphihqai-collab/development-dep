# Test Plan: [FEATURE/PROJECT NAME]

**Date:** YYYY-MM-DD
**Author:** QA Engineer
**Project:** [project name]
**Version:** [version under test]

## Scope
**In scope:** [what is being tested]
**Out of scope:** [what is not being tested, with risk assessment]

## Test Strategy
| Test Type | Coverage | Priority |
|-----------|----------|----------|
| Functional | [scope] | P1 |
| Integration | [scope] | P1 |
| Regression | [scope] | P2 |
| AI Evaluation | [scope] | P1 (if AI feature) |
| Exploratory | [areas of focus] | P2 |
| Performance | [scope] | P3 |

## Requirements Traceability
| Requirement ID | Description | Test Case IDs | Status |
|---------------|-------------|---------------|--------|
| REQ-001 | [requirement] | TC-001, TC-002 | Not Started |
| [id] | [description] | [test cases] | [status] |

## Test Cases

### Functional Tests
| ID | Title | Steps | Expected Result | Priority |
|----|-------|-------|----------------|----------|
| TC-001 | [title] | [steps] | [expected] | P1/P2/P3 |

### AI Evaluation Tests (if applicable)
| ID | Category | Input | Expected Output | Metric | Threshold |
|----|----------|-------|----------------|--------|-----------|
| AI-001 | Happy path | [input] | [expected] | Factuality | 0.85 |
| AI-002 | Edge case | [input] | [expected] | Faithfulness | 0.80 |
| AI-003 | Adversarial | [input] | [expected] | Safety | 0.95 |

## Environment
- **Test environment:** [staging / local / CI]
- **Test data:** [source and setup]
- **Dependencies:** [external services, mocks]

## Entry Criteria
- [ ] Code deployed to test environment
- [ ] Test data loaded
- [ ] All dependencies available

## Exit Criteria
- [ ] All P1 test cases pass
- [ ] No Critical or High severity defects open
- [ ] AI eval metrics above thresholds (if applicable)
- [ ] Test coverage report generated

## Risks
| Risk | Likelihood | Impact | Mitigation |
|------|-----------|--------|------------|
| [risk] | H/M/L | H/M/L | [mitigation] |

## Schedule
| Activity | Start | End | Status |
|----------|-------|-----|--------|
| Test planning | [date] | [date] | [status] |
| Test execution | [date] | [date] | [status] |
| Defect resolution | [date] | [date] | [status] |
| Final report | [date] | [date] | [status] |
