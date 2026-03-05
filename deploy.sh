#!/bin/bash
set -e

OPENCLAW_DIR="$HOME/.openclaw"
REPO_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "=== Delphi Development Department — Deploy ==="
echo "Repo: $REPO_DIR"
echo "OpenClaw: $OPENCLAW_DIR"
echo ""

# 1. Deploy ATLAS workspace
ATLAS_WS="$OPENCLAW_DIR/workspace"
echo "[1/3] Deploying ATLAS workspace → $ATLAS_WS"
mkdir -p "$ATLAS_WS/memory" "$ATLAS_WS/templates" "$ATLAS_WS/docs" "$ATLAS_WS/skills"

for f in AGENTS.md SOUL.md IDENTITY.md USER.md TOOLS.md HEARTBEAT.md MEMORY.md GUARDRAILS.md ESCALATION-POLICY.md HANDOFF-PROTOCOL.md ERROR-HANDLING.md EVALUATION-CRITERIA.md; do
  if [ -f "$REPO_DIR/$f" ]; then
    cp "$REPO_DIR/$f" "$ATLAS_WS/$f"
    echo "  ✓ $f"
  fi
done

cp -r "$REPO_DIR/memory/"* "$ATLAS_WS/memory/" 2>/dev/null && echo "  ✓ memory/" || true
cp -r "$REPO_DIR/templates/"* "$ATLAS_WS/templates/" 2>/dev/null && echo "  ✓ templates/" || true
cp -r "$REPO_DIR/docs/"* "$ATLAS_WS/docs/" 2>/dev/null && echo "  ✓ docs/" || true
cp -r "$REPO_DIR/skills/"* "$ATLAS_WS/skills/" 2>/dev/null && echo "  ✓ skills/" || true

echo ""

# 2. Deploy standalone agents
echo "[2/3] Deploying standalone agent workspaces"
AGENTS="solutions-architect ai-engineer engineer-backend engineer-frontend qa-engineer devops-engineer security-engineer ui-ux-designer technical-writer data-engineer"

for agent in $AGENTS; do
  AGENT_WS="$OPENCLAW_DIR/workspace-$agent"
  if [ -d "$REPO_DIR/agents/$agent" ]; then
    mkdir -p "$AGENT_WS"
    cp "$REPO_DIR/agents/$agent/"*.md "$AGENT_WS/" 2>/dev/null || true
    echo "  ✓ $agent → $AGENT_WS"
  fi
done

echo ""

# 3. Config
echo "[3/3] Checking openclaw.json"
if [ ! -f "$OPENCLAW_DIR/openclaw.json" ]; then
  if [ -f "$REPO_DIR/openclaw.json.template" ]; then
    cp "$REPO_DIR/openclaw.json.template" "$OPENCLAW_DIR/openclaw.json"
    echo "  ✓ Created openclaw.json from template"
    echo "  ⚠ EDIT $OPENCLAW_DIR/openclaw.json — replace REPLACE_WITH_GENERATED_TOKEN"
  fi
else
  echo "  ○ openclaw.json exists — not overwriting"
fi

echo ""
echo "=== Deploy complete ==="
echo "Team: ATLAS + 10 agents"
echo "Next: edit openclaw.json, then: openclaw gateway --port 18789"
