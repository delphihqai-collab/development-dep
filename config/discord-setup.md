# Discord Configuration — Manual Setup

After obtaining the Discord bot token, add to openclaw.json:

```json5
channels: {
  discord: {
    botToken: { source: "env", provider: "default", id: "DISCORD_BOT_TOKEN" },
    guild: "1477047853720404179",
    allowChannels: [
      "atlas-chat",
      "atlas-logs",
      "briefings",
      "approvals",
      "daily-standup",
      "critical-alerts",
      "knowledge-base",
      "atlas-hermes",
    ],
  },
},
```

## Environment Setup

Set `DISCORD_BOT_TOKEN` in one of:
- Environment variable: `export DISCORD_BOT_TOKEN=your_token`
- Credentials file: `~/.openclaw/credentials/discord`
- systemd service: `Environment=DISCORD_BOT_TOKEN=your_token`

## Reference IDs

- **Bot ID:** 1477646928840888331
- **Guild ID:** 1477047853720404179

## Channel Purposes

| Channel | Purpose | Who Posts |
|---------|---------|----------|
| atlas-chat | Boss <-> ATLAS direct | Boss, ATLAS |
| atlas-logs | System events, heartbeats | ATLAS |
| briefings | Client briefings, estimates | Hermes, ATLAS |
| approvals | Deployment and scope approvals | ATLAS, Boss |
| daily-standup | Daily status updates | ATLAS |
| critical-alerts | SEV1/2 incidents | ATLAS |
| knowledge-base | Technical learnings | ATLAS |
| atlas-hermes | Cross-department coordination | ATLAS, Hermes |
