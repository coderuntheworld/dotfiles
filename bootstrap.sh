#!/bin/bash

Bootstrap Claude Code global config in ephemeral environments.
Usage: curl -fsSL https://raw.githubusercontent.com/coderuntheworld/dotfiles/main/bootstrap.sh | bash
set -euo pipefail

RAW="https://raw.githubusercontent.com/coderuntheworld/dotfiles/main"
CLAUDE_DIR="$HOME/.claude"

echo "Bootstrapping Claude Code global config..."
mkdir -p "$CLAUDE_DIR/commands"

fetch() { curl -fsSL "$RAW/$1" -o "$CLAUDE_DIR/$2"; echo " fetched $CLAUDE_DIR/$2"; }

fetch ".claude/CLAUDE.md" "CLAUDE.md"
fetch ".claude/settings.json" "settings.json"
fetch ".claude/stop-hook-git-check.sh" "stop-hook-git-check.sh"
fetch ".claude/commands/setup-project.md" "commands/setup-project.md"

chmod +x "$CLAUDE_DIR/stop-hook-git-check.sh"
echo ""
echo "Done."
