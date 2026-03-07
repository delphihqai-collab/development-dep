---
name: project-kickoff
description: Initialize a project after scope approval — form team, sequence phases, distribute briefs
trigger: Boss approves scope in #approvals
---

# Project Kickoff

## Workflow

### 1. DEFINE — Objectives and Boundaries
- Read approved scope from #approvals
- Define SMART objectives for the project
- Set explicit scope boundary (in-scope / out-of-scope / deferred)
- Identify key deliverables and acceptance criteria

### 2. Form Pod
Select agents based on project type:

| Project Type | Pod Composition |
|-------------|-----------------|
| AI-heavy | AI Engineer, Engineer (Backend), QA Engineer, Security Engineer, Technical Writer |
| Frontend-heavy | UI/UX Designer, Engineer (Frontend), Engineer (Backend), QA Engineer, Technical Writer |
| Integration-heavy | Solutions Architect, Engineer (Backend), DevOps Engineer, QA Engineer, Security Engineer |
| Data-heavy | Data Engineer, AI Engineer, Engineer (Backend), QA Engineer, Technical Writer |
| Full-stack | All agents as needed per phase |

### 3. MEASURE — Baselines and Targets
- Set baseline metrics: expected cycle time, quality targets, cost budget
- Define Definition of Done for each phase
- Identify dependencies between agents

### 4. Sequence Phases
Standard pipeline (adjust per project):
1. Design (UI/UX Designer + Solutions Architect)
2. Build (Engineers + AI Engineer + Data Engineer)
3. QA (QA Engineer — testing + AI evaluation)
4. Security (Security Engineer — review + AI safety)
5. Documentation (Technical Writer)
6. Deploy (DevOps Engineer)

### 5. Distribute Briefs
- Send task brief to each pod agent via `sessions_send`
- Each brief includes: objectives, their deliverables, acceptance criteria, dependencies, timeline
- Log project kickoff in memory/

### 6. Announce
- Post kickoff summary to #atlas-logs
- Include: project name, pod composition, phases, key dates
