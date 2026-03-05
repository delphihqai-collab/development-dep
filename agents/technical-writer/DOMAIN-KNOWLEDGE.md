# Domain Knowledge — Technical Writer

<doc_types>
## Documentation Types
- **User guides**: Task-oriented, step-by-step. Organized by what users want to accomplish, not by system structure. Include prerequisites, expected outcomes, troubleshooting.
- **API docs**: Endpoint reference with request/response examples for every endpoint. Include authentication, error codes, rate limits, SDKs. Tested and runnable examples.
- **Architecture docs**: Decision records (ADRs), system diagrams, component relationships. Audience: engineers who maintain the system.
- **Runbooks**: Operational procedures with troubleshooting trees. If/then structure. Include rollback steps. Test by following literally.
- **AI feature docs**: Capabilities AND limitations. Confidence level interpretation. When to trust vs verify output. Known edge cases. Failure modes and fallbacks.
- **Changelogs**: What changed, why, migration steps if needed. Audience-appropriate (user-facing vs developer-facing).
</doc_types>

<writing_standards>
## Writing Standards
- **Audience-first**: Identify reader and their goal before writing. A user guide for end-users reads differently from an API reference for developers.
- **Task-oriented**: Organize by what users do, not system structure. "How to create a project" not "The Project module."
- **Testable**: Every procedure should be followable literally by someone unfamiliar with the system. If it fails, the doc is wrong.
- **Versioned**: Docs ship with code releases. Never let docs drift from implementation.
- **Scannable**: Headers, bullet points, tables, code blocks. Users scan before they read. Put the answer first.
- **DRY**: Single source of truth. Reference other docs rather than duplicating content.
</writing_standards>

<ai_documentation>
## AI Documentation Requirements
- State what the AI can and cannot do — specific capabilities, not marketing language
- Explain confidence levels: what each level means, how to interpret, when to seek human verification
- Document known limitations: input types that perform poorly, edge cases, failure modes
- Provide guidance on when to trust vs verify AI output — decision framework for the user
- Include data handling: what data is sent to AI, what is stored, privacy implications
- Version documentation with model changes — different model = potentially different behavior
</ai_documentation>

<style_conventions>
## Style Conventions
- Active voice, present tense ("Click Submit" not "The Submit button should be clicked")
- Short sentences, one idea per paragraph. Maximum 25 words per sentence as a guideline.
- Code examples for every API endpoint — copy-pasteable, tested, with expected output shown
- Screenshots only when text cannot convey the concept. Annotate screenshots with callouts.
- Consistent terminology — create a glossary for project-specific terms. Use the same word for the same concept everywhere.
- Avoid jargon with end-user audiences. Define technical terms when they first appear.
- Number sequential steps. Use bullets for unordered lists. Use tables for structured comparisons.
</style_conventions>

<doc_quality>
## Documentation Quality Checklist
- [ ] Audience identified and appropriate for content
- [ ] All procedures tested by following literally
- [ ] AI features document capabilities AND limitations
- [ ] Code examples are runnable and produce shown output
- [ ] No stale references to deprecated features
- [ ] Reviewed by relevant technical agent + ATLAS
- [ ] Versioned alongside code release
</doc_quality>
