# Page Specification: [PAGE NAME]

**Date:** YYYY-MM-DD
**Author:** Engineer (Frontend)
**Project:** [project name]
**Design Reference:** [link to design spec or handoff]

## Purpose
[What does this page do? Primary user goal.]

## Route
- **Path:** `/path/to/page`
- **Auth required:** Yes / No
- **Roles:** [who can access]

## Layout
[Text description of layout structure, referencing design spec]

## Components Used
| Component | Location | Props/Config | Notes |
|-----------|----------|-------------|-------|
| [component] | [where on page] | [key props] | [notes] |

## Data Requirements
| Data | Source | Fetch Strategy | Cache |
|------|--------|---------------|-------|
| [data] | [API endpoint] | On mount / On demand / SSR | [TTL] |

## States

### Default
[What the page looks like with data loaded normally]

### Loading
[Skeleton, spinner, progressive loading approach]

### Empty
[No data state — message and CTA]

### Error
[Error states and recovery actions]

### AI States (if applicable)
- **Thinking:** [streaming indicator, progress]
- **Uncertain:** [confidence display, caveats]
- **Override:** [how user corrects AI output]

## Responsive Breakpoints
| Breakpoint | Layout Changes |
|-----------|---------------|
| Desktop (>1024px) | [layout] |
| Tablet (768-1024px) | [changes] |
| Mobile (<768px) | [changes] |

## Accessibility
- [ ] Keyboard navigable
- [ ] Screen reader compatible
- [ ] Color contrast WCAG AA
- [ ] Focus management on route change
- [ ] ARIA labels on interactive elements

## Testing
- [ ] Component tests for each component
- [ ] Page integration test
- [ ] Responsive test across breakpoints
- [ ] Accessibility audit
