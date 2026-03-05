#!/bin/bash
# deploy.sh — Deploy development department agent workspaces to OpenClaw paths
# Run this on PC1 after cloning the repo.

set -e

OPENCLAW_DIR="$HOME/.openclaw"
REPO_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "=== Delphi Development Department — Deploy ==="
echo "Repo: $REPO_DIR"
echo "OpenClaw: $OPENCLAW_DIR"
echo ""

# 1. Deploy ATLAS (main agent) workspace
ATLAS_WS="$OPENCLAW_DIR/workspace"
echo "[1/3] Deploying ATLAS workspace → $ATLAS_WS"
mkdir -p "$ATLAS_WS/memory"

for f in AGENTS.md SOUL.md IDENTITY.md USER.md TOOLS.md HEARTBEAT.md MEMORY.md; do
  if [ -f "$REPO_DIR/$f" ]; then
    cp "$REPO_DIR/$f" "$ATLAS_WS/$f"
    echo "  ✓ $f"
  fi
done

# Copy memory files
if [ -d "$REPO_DIR/memory" ]; then
  cp -r "$REPO_DIR/memory/"* "$ATLAS_WS/memory/" 2>/dev/null || true
  echo "  ✓ memory/"
fi

# Copy skills
if [ -d "$REPO_DIR/skills" ] && [ "$(ls -A "$REPO_DIR/skills" 2>/dev/null)" ]; then
  mkdir -p "$ATLAS_WS/skills"
  cp -r "$REPO_DIR/skills/"* "$ATLAS_WS/skills/" 2>/dev/null || true
  echo "  ✓ skills/"
fi

# Copy templates (ATLAS needs access to templates for cross-department handoffs)
if [ -d "$REPO_DIR/templates" ]; then
  mkdir -p "$ATLAS_WS/templates"
  cp -r "$REPO_DIR/templates/"* "$ATLAS_WS/templates/" 2>/dev/null || true
  echo "  ✓ templates/"
fi

echo ""

# 2. Deploy each standalone agent workspace
echo "[2/3] Deploying standalone agent workspaces"

AGENTS="solutions-architect tool-scout engineer-backend engineer-frontend integration-specialist qa-engineer security-engineer performance-engineer devops-engineer technical-writer"

for agent in $AGENTS; do
  AGENT_WS="$OPENCLAW_DIR/workspace-$agent"
  if [ -d "$REPO_DIR/agents/$agent" ]; then
    mkdir -p "$AGENT_WS"
    cp "$REPO_DIR/agents/$agent/"*.md "$AGENT_WS/" 2>/dev/null || true
    echo "  ✓ $agent → $AGENT_WS"
  else
    echo "  ✗ $agent — source not found in agents/"
  fi
done

echo ""

# 3. Copy openclaw.json template if no config exists
echo "[3/3] Checking openclaw.json"
if [ ! -f "$OPENCLAW_DIR/openclaw.json" ]; then
  if [ -f "$REPO_DIR/openclaw.json.template" ]; then
    cp "$REPO_DIR/openclaw.json.template" "$OPENCLAW_DIR/openclaw.json"
    echo "  ✓ Created openclaw.json from template"
    echo "  ⚠ IMPORTANT: Edit $OPENCLAW_DIR/openclaw.json and replace REPLACE_WITH_GENERATED_TOKEN"
  fi
else
  echo "  ○ openclaw.json already exists — not overwriting"
fi

echo ""
echo "=== Deploy complete ==="
echo ""
echo "Next steps:"
echo "  1. Edit ~/.openclaw/openclaw.json — set gateway auth token and Discord bot token"
echo "  2. Run: openclaw gateway --port 18789"
echo "  3. Verify: openclaw agents list"
