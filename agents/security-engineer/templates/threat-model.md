# Threat Model

## System
**Name**: [System name]
**Date**: [Assessment date]
**Assessor**: Security Engineer

## System Overview
[Brief description of the system and its purpose]

## Assets
| Asset | Sensitivity | Description |
|-------|-----------|-------------|
| [Asset 1] | High/Med/Low | [What it is and why it matters] |

## Attack Surface
| Surface | Exposure | Controls |
|---------|----------|----------|
| [API endpoints] | External | [Authentication, rate limiting] |
| [AI model input] | External | [Input validation, guardrails] |
| [Data storage] | Internal | [Encryption, access control] |

## Threat Actors
| Actor | Motivation | Capability |
|-------|-----------|------------|
| [External attacker] | [Motivation] | [Skill level] |
| [Malicious user] | [Motivation] | [Skill level] |

## Threats (STRIDE)
| Threat | Category | Likelihood | Impact | Mitigation |
|--------|----------|-----------|--------|------------|
| [Threat 1] | Spoofing/Tampering/etc | High/Med/Low | High/Med/Low | [Control] |

## AI-Specific Threats
| Threat | Description | Mitigation |
|--------|-------------|------------|
| Prompt injection | [How it could occur] | [Guardrails in place] |
| Data poisoning | [How it could occur] | [Data validation controls] |

## Risk Summary
[Overall risk posture and priority recommendations]
