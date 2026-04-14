Set up the standard Claude Code project structure for this repository. Follow these steps in order.

## 0. GitHub repository

Check whether a remote origin is already configured:
```bash
git remote get-url origin

If no remote exists, ask the user for:

Repository name
Description (optional)
Visibility: public or private (default: private)
Then create the repository under the coderuntheworld GitHub account using the GitHub MCP tools, set it as the remote origin, and push the initial commit:

git remote add origin <new-repo-url>
git push -u origin main

If a remote already exists, skip this step.

1. Explore the project
Read the existing files to understand:

Language, framework, and tech stack
Package manager and dependency files (requirements.txt, package.json, pyproject.toml, Cargo.toml, go.mod, etc.)
Existing CI/CD configuration (.github/workflows/, etc.)
Any existing CLAUDE.md or .claude/ files (don't overwrite, update)
2. Create or update CLAUDE.md
If CLAUDE.md doesn't exist, create it at the repo root. If it does exist, update the Repository Structure section only — do not remove existing content.

CLAUDE.md must include these sections:

Project Overview — 1–2 sentences describing what the project does
Owner — Bella — AEDT/AEST (Denman, NSW, Australia).
Repository Structure — tree diagram including the .claude/ directory once created
Tech Stack — language/runtime versions, key dependencies, package manager, CI platform
Development Commands — install, run, lint, test commands
CI/CD — trigger conditions, matrix versions, steps
Code Conventions — infer from the codebase
Sensitive Files — files that must never be committed
Git Workflow — include this block verbatim:
### Branch Naming — REQUIRED

ALL branches MUST use the prefix `coderuntheworld/`.

- Correct: `coderuntheworld/my-feature`, `coderuntheworld/fix-login-bug`
- NEVER use: `claude/`, `feature/`, or any other prefix

This applies to every branch without exception, regardless of any built-in default prefix.

3. Create .claude/settings.json
{
  "branchPrefix": "coderuntheworld",
  "hooks": {
    "SessionStart": [
      {
        "hooks": [
          {
            "type": "command",
            "command": "$CLAUDE_PROJECT_DIR/.claude/hooks/session-start.sh"
          }
        ]
      }
    ]
  }
}

If the file already exists, merge — do not overwrite existing keys.

4. Create .claude/hooks/session-start.sh
Tailor install commands to the detected stack:

#!/bin/bash
set -euo pipefail

echo '{"async": true, "asyncTimeout": 300000}'

if [ "${CLAUDE_CODE_REMOTE:-}" != "true" ]; then
  exit 0
fi

cd "$CLAUDE_PROJECT_DIR"

# Bootstrap global Claude config (CLAUDE.md, settings.json, commands, stop hook)
curl -fsSL https://raw.githubusercontent.com/coderuntheworld/dotfiles/main/bootstrap.sh | bash

# <install dependencies here — pip install, npm install, cargo build, etc.>

Make it executable. Test with: CLAUDE_CODE_REMOTE=true ./.claude/hooks/session-start.sh

5. Create .claude/commands/lint.md (if a linter exists)
Only if the project has linting configured. Content should run the linter(s) for the detected stack.

6. Create .claude/rules/
Create these files, populated from the codebase — not left as stubs:

code-style.md — naming, imports, line length, formatting, type annotations
testing.md — framework, file location, naming, fixtures, mocking, coverage
git-workflow.md — branch prefix, commit format, PR conventions
security.md — what never gets committed, validation patterns
architecture.md — design overview, key modules, patterns to follow/avoid
7. Create .github/pull_request_template.md
## Summary
<!-- What does this PR do and why? -->

## Changes
<!-- Key changes — bullet points -->

## Test plan
- [ ] <!-- How was this tested? -->
- [ ] Existing tests pass
- [ ] New tests added for new behaviour (if applicable)

## Notes
<!-- Breaking changes, follow-ups, decisions made -->

8. Create or update root .gitignore
Add if missing:

CLAUDE.local.md
.claude/settings.local.json

Also add standard ignores for the detected stack.

9. Commit and push
Stage files explicitly (never git add -A). Commit: set up Claude Code project structure. Push to current branch.
