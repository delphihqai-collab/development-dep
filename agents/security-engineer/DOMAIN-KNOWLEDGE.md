# Domain Knowledge — Security Engineer

<owasp>
## OWASP Top 10 Reference
1. **Broken Access Control**: Missing authorization checks, IDOR, privilege escalation. Verify on every request, not just UI.
2. **Cryptographic Failures**: Weak algorithms, plaintext secrets, missing TLS. Use bcrypt for passwords, AES-256 for data at rest.
3. **Injection**: SQL, XSS, command injection. Parameterized queries, output encoding, input validation. Never concatenate user input into queries.
4. **Insecure Design**: Missing threat model, no abuse case testing. Security is a design concern, not a testing afterthought.
5. **Security Misconfiguration**: Default credentials, verbose errors, unnecessary features enabled. Harden all environments.
6. **Vulnerable Components**: Outdated dependencies with known CVEs. Automated dependency scanning in CI. Patch within SLA.
7. **Authentication Failures**: Weak passwords, missing MFA, session fixation. JWT with rotation, rate limiting on auth endpoints.
8. **Data Integrity Failures**: Unsigned updates, deserialization attacks, CI/CD pipeline compromise. Verify signatures, pin dependencies.
9. **Logging/Monitoring Failures**: Missing audit trail, no alerting. Log security events, alert on anomalies, retain logs per policy.
10. **Server-Side Request Forgery**: Internal network access via user-controlled URLs. Allowlist outbound destinations, validate URLs.
</owasp>

<ai_threats>
## AI Threat Taxonomy
- **Direct prompt injection**: User input manipulates model behavior to bypass instructions. Mitigate with system prompt hardening, output classification, input sanitization.
- **Indirect prompt injection**: Malicious content in retrieved documents (RAG), emails, or data sources overrides system prompt. Mitigate with content sanitization on ingestion, output monitoring.
- **Training data poisoning**: Corrupted training or fine-tuning data introduces vulnerabilities. Mitigate with data validation, provenance tracking.
- **Model extraction**: Adversarial queries designed to reverse-engineer model behavior or training data. Mitigate with rate limiting, output perturbation.
- **Excessive agency**: AI takes actions beyond intended scope — unauthorized tool use, data access, or external communication. Mitigate with tool deny lists, scope boundaries, human approval gates.
- **Data leakage**: AI reveals sensitive information from training data, system prompts, or other users' conversations. Mitigate with output filtering, PII detection.
</ai_threats>

<compliance>
## Compliance Frameworks
- **GDPR**: Data protection, right to erasure, consent management, data processing agreements, privacy by design
- **SOC 2**: Security, availability, processing integrity, confidentiality, privacy controls. Type I (point-in-time) and Type II (period).
- **EU AI Act**: Risk classification (unacceptable, high, limited, minimal). High-risk AI requires conformity assessment, transparency, human oversight.
- **NIST AI RMF**: Govern, Map, Measure, Manage framework for AI risk management
- **OWASP AI Security**: Top 10 for LLM applications — prompt injection, data poisoning, model DoS, supply chain, etc.
</compliance>

<severity_definitions>
## Security Finding Severity
- **Critical**: Active exploitation possible, immediate business impact, data breach imminent. Fix within 24 hours.
- **High**: Exploitable with moderate effort, significant impact on confidentiality/integrity/availability. Fix within 7 days.
- **Medium**: Requires specific conditions to exploit, moderate impact. Fix within 30 days.
- **Low**: Minor impact, defense-in-depth improvement. Fix in next release cycle.
- **Informational**: Best practice recommendation, no direct risk. Address when convenient.
</severity_definitions>

<security_tools>
## Security Testing Tools Reference
- **SAST**: Static analysis for code vulnerabilities (language-specific linters, semgrep)
- **SCA**: Software composition analysis for dependency vulnerabilities (npm audit, Snyk, Dependabot)
- **DAST**: Dynamic testing against running applications (OWASP ZAP, Burp Suite)
- **Secret scanning**: Detect leaked credentials in code (gitleaks, truffleHog)
- **AI-specific**: Prompt injection test suites, guardrail bypass testing, output classification validation
</security_tools>
