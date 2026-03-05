# Domain Knowledge — Engineer (Frontend)

<component_patterns>
## Component Patterns
- **Atomic design**: Atoms → Molecules → Organisms → Templates → Pages. Build small, compose up.
- **Component isolation**: Test each component individually before composing into pages. Storybook or similar for visual testing.
- **State management**: Local state first (useState/useReducer). Lift state only when shared. Global state (Zustand/Jotai) only for truly app-wide concerns.
- **Server components**: Prefer React Server Components for data-fetching and static content. Client components only for interactivity.
- **Composition over inheritance**: Use children, render props, and hooks. Avoid deeply nested component hierarchies.
</component_patterns>

<ai_interfaces>
## AI Interface Patterns
- **Streaming responses**: Progressive display with typing indicator. Show partial output as it arrives. Use Server-Sent Events or WebSocket.
- **Confidence indicators**: Visual cue for AI certainty level — color, icon, or text label. Low confidence triggers user verification prompt.
- **Override controls**: User can always correct, edit, or dismiss AI suggestions. AI output is a suggestion, never a locked decision.
- **Error states**: Clear messaging when AI is unavailable, slow, or uncertain. Never show raw error messages. Offer retry or fallback.
- **Loading states**: Skeleton screens for structure, spinner for short waits, progress bar for long operations. Avoid blank screens.
- **Source attribution**: When showing AI-generated content from RAG, display source references. Allow users to verify.
</ai_interfaces>

<performance>
## Performance Targets
- **Core Web Vitals**: LCP < 2.5s, FID < 100ms, CLS < 0.1
- **Bundle size**: Monitor per-route bundle size. Code splitting for routes and heavy components. Tree-shake unused imports.
- **Images**: Next.js Image component for automatic optimization. WebP/AVIF formats. Lazy loading below the fold.
- **Caching**: Static assets with immutable cache headers. API responses with appropriate cache-control. SWR/React Query for client-side caching.
</performance>

<accessibility>
## Accessibility Standards
- **WCAG AA minimum**: All projects must meet AA compliance
- **Keyboard navigation**: All interactive elements reachable and operable via keyboard. Visible focus indicators.
- **Screen reader**: Semantic HTML first. ARIA labels only when semantic HTML is insufficient. Test with actual screen readers.
- **Color contrast**: 4.5:1 for normal text, 3:1 for large text. Never rely on color alone to convey information.
- **Motion**: Respect `prefers-reduced-motion`. Disable animations for users who request it.
- **Forms**: Associated labels, error messages linked to fields, required field indicators, validation feedback.
</accessibility>

<delphi_stack>
## Delphi Stack Reference
- **Framework**: Next.js 14+ with App Router
- **Language**: TypeScript strict mode
- **Styling**: Tailwind CSS. Shadcn/ui for component library base.
- **State**: Zustand for global state. React Query/SWR for server state.
- **Testing**: Vitest for unit tests. Playwright for E2E. Testing Library for component tests.
- **Linting**: ESLint + Prettier. Strict TypeScript config.
</delphi_stack>
