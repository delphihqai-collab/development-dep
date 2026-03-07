# Webhook Configuration — Future Setup

## GitHub -> OpenClaw

Set up GitHub webhooks to notify ATLAS of repo events.

### GitHub Configuration
1. In GitHub repo settings -> Webhooks -> Add webhook
2. Payload URL: `https://<tailscale-url>/hooks/github`
3. Content type: `application/json`
4. Secret: Generate a shared secret for signature verification
5. Events: Push, Pull Request, Deployment status, Issues

### OpenClaw Configuration

Add to openclaw.json when ready:

```json5
hooks: {
  // ... existing internal hooks ...
  webhooks: {
    enabled: true,
    token: "<generate-a-shared-secret>",
    path: "/hooks",
    mappings: [
      {
        match: { path: "github" },
        action: "agent",
        agentId: "atlas",
        deliver: true,
      },
    ],
  },
},
```

This routes GitHub events to ATLAS, who can then delegate to DevOps or relevant Engineers.

## Useful Events

| Event | Use Case |
|-------|----------|
| Push to main | Trigger deployment pipeline review |
| Pull Request opened | Assign code review |
| Deployment status | Monitor deployment outcomes |
| Issues opened | Track bug reports |
| CI failure | Alert for build problems |
