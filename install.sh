#!/bin/bash

Installs Claude Code global config by symlinking from this repo into ~/.claude/
Safe to re-run — existing symlinks are updated, other files are not touched.
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CLAUDE_DIR="$HOME/.claude"

echo "Installing Claude Code dotfiles from $DOTFILES_DIR"

mkdir -p "$CLAUDE_DIR/commands"

symlink() {
local src="$DOTFILES_DIR/$1"
local dst="$CLAUDE_DIR/$2"
ln -sf "$src" "$dst"
echo " linked $dst"
}

symlink ".claude/CLAUDE.md" "CLAUDE.md"
symlink ".claude/settings.json" "settings.json"
symlink ".claude/stop-hook-git-check.sh" "stop-hook-git-check.sh"
symlink ".claude/commands/setup-project.md" "commands/setup-project.md"

chmod +x "$CLAUDE_DIR/stop-hook-git-check.sh"

echo ""
echo "Done. Claude Code global config is active."
echo "Restart any open Claude Code sessions to pick up changes."
