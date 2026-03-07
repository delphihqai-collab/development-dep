#!/bin/bash
# Commits workspace memory files written by OpenClaw agents.
# Since workspaces point directly at the git repo, memory files are already
# in the repo tree — this script just stages and commits them.
# Recommended: daily via cron at 02:00.

set -e

REPO_DIR="$(cd "$(dirname "$0")/.." && pwd)"
cd "$REPO_DIR"

echo "=== Backing up workspace memory files ==="

# Stage all memory files (ATLAS + agents)
git add memory/ MEMORY.md 2>/dev/null || true
git add agents/*/memory/ agents/*/MEMORY.md 2>/dev/null || true

if git diff --cached --quiet; then
  echo "  No memory changes to commit."
else
  git commit -m "Backup memory $(date +%Y-%m-%d)"
  echo "  Committed memory changes."
fi

echo ""
echo "=== Memory backup complete ==="
echo "To push: cd $REPO_DIR && git push"
