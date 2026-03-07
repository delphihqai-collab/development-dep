# Cron Jobs — Set up after gateway is running

Run these commands on PC1 after the gateway starts.

## Morning Standup (09:00 Lisbon time)

```bash
openclaw cron add \
  --schedule "0 9 * * *" \
  --timezone "Europe/Lisbon" \
  --agentId "atlas" \
  --payload '{"kind": "agentTurn", "message": "Morning standup. Check #briefings for new requests. Review active projects for blockers. Post status update to #daily-standup."}' \
  --delivery announce \
  --channel discord
```

## Midday Check (13:00 Lisbon time)

```bash
openclaw cron add \
  --schedule "0 13 * * *" \
  --timezone "Europe/Lisbon" \
  --agentId "atlas" \
  --payload '{"kind": "agentTurn", "message": "Midday check. Review work in progress. Check for blocked agents. Verify deadlines. Post update to #atlas-logs if anything needs attention."}' \
  --delivery none
```

## EOD Summary (18:00 Lisbon time)

```bash
openclaw cron add \
  --schedule "0 18 * * *" \
  --timezone "Europe/Lisbon" \
  --agentId "atlas" \
  --payload '{"kind": "agentTurn", "message": "End of day. Write daily summary to memory. Log completed work, open items, blockers. Post EOD summary to #daily-standup."}' \
  --delivery announce \
  --channel discord
```

## Weekly Tech Radar Review (Friday 16:00)

```bash
openclaw cron add \
  --schedule "0 16 * * 5" \
  --timezone "Europe/Lisbon" \
  --agentId "atlas" \
  --payload '{"kind": "agentTurn", "message": "Weekly review. Check docs/tech-radar.md for updates needed. Review this weeks lessons learned. Update MEMORY.md with key insights. Post summary to #knowledge-base."}' \
  --delivery announce \
  --channel discord
```

## Memory Backup (daily 02:00)

```bash
openclaw cron add \
  --schedule "0 2 * * *" \
  --timezone "Europe/Lisbon" \
  --agentId "atlas" \
  --payload '{"kind": "agentTurn", "message": "Run memory backup. Execute: bash config/backup-workspaces.sh"}' \
  --delivery none
```
