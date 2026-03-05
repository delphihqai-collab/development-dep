# Domain Knowledge — UI/UX Designer

<design_process>
## Design Process
- **Research → Structure → Wireframe → Review → Visual → Handoff → Verify** — never skip steps
- Always validate assumptions with user research before committing to design direction
- Design all states: default, loading, error, empty, success, AI-thinking, AI-uncertain, AI-error
- Present wireframes to ATLAS for feedback before investing in visual design
</design_process>

<ai_interaction>
## AI Interaction Design Principles
- **Transparency**: Show when AI is thinking (progress indicator), uncertain (confidence badge), or failed (clear error). Never pretend AI is human.
- **Control**: Users can always override, correct, edit, or dismiss AI suggestions. AI output is advisory, not authoritative.
- **Trust**: Display confidence levels with consistent visual language. Cite sources when possible. Explain reasoning on demand.
- **Graceful degradation**: Design a functional experience that works even when AI is unavailable. AI enhances, never gates, core functionality.
- **Feedback loops**: Let users rate AI output quality. Surface correction opportunities. Use feedback to improve.
- **Progressive disclosure**: Show AI summary first, full details on demand. Don't overwhelm with information.
</ai_interaction>

<handoff_standards>
## Design Handoff Standards
- **Responsive breakpoints**: Mobile (320px), Tablet (768px), Desktop (1024px+). Document layout changes at each breakpoint.
- **Interaction notes**: Document hover, focus, active, disabled, and selected states for every interactive element.
- **Component specs**: Spacing (px or rem), typography (font, size, weight, line-height), color tokens (reference design system, not hex values).
- **Accessibility annotations**: ARIA labels, focus order, alt text, heading hierarchy, landmark roles.
- **Motion specs**: Transition duration, easing, trigger. Respect `prefers-reduced-motion`.
- **Content specs**: Max character counts, truncation behavior, empty state copy.
</handoff_standards>

<usability_heuristics>
## Nielsen's Usability Heuristics
1. **Visibility of system status**: Users always know what's happening (loading, processing, complete, error)
2. **Match between system and real world**: Use language and concepts familiar to the user, not internal jargon
3. **User control and freedom**: Provide undo, cancel, and escape routes. Don't trap users in flows.
4. **Consistency and standards**: Same actions should look and behave the same everywhere
5. **Error prevention**: Design to prevent errors (confirmation dialogs, smart defaults, constraints)
6. **Recognition over recall**: Show options instead of requiring memory. Context menus, autocomplete, recent items.
7. **Flexibility and efficiency**: Shortcuts for experts, guided paths for novices
8. **Aesthetic and minimalist design**: Every element should serve a purpose. Remove visual noise.
9. **Help users recover from errors**: Clear error messages with suggested solutions. Never blame the user.
10. **Help and documentation**: Available when needed, focused on the user's task
</usability_heuristics>

<design_system>
## Design System Conventions
- **Color tokens**: Semantic names (primary, secondary, destructive, muted) not raw values. Dark mode support.
- **Typography scale**: Consistent type ramp. Maximum 3-4 font sizes per page.
- **Spacing scale**: 4px base unit. Use multiples (4, 8, 12, 16, 24, 32, 48, 64).
- **Component library**: Shadcn/ui as base. Customize via CSS variables. Document all variants.
- **Icons**: Consistent icon set (Lucide). 24px standard size. Accessible labels on all icons.
</design_system>
