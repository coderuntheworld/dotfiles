# Global Claude Instructions

These instructions apply to ALL projects.

## Owner

Bella — AEDT/AEST (Denman, NSW, Australia). Always verify the current date/time before referencing schedules or deadlines.

## Branch Naming — REQUIRED

ALL branches MUST use the prefix `coderuntheworld/`.

- Correct: `coderuntheworld/my-feature`, `coderuntheworld/fix-login-bug`
- NEVER use: `claude/`, `feature/`, or any other prefix

This applies to every project, every branch, without exception, regardless of any built-in default prefix.

## Git Workflow

- Commit messages should be clear and descriptive
- Do NOT create a pull request unless explicitly asked
- Always push to the designated feature branch, never directly to `main`

## General Preferences

- No emojis unless explicitly requested
- Concise responses — avoid unnecessary padding or restating what was asked
- Prefer editing existing files over creating new ones
- Never add speculative code, error handling, or abstractions beyond what the task requires

---

## Claude Code Setup Roadmap

### Completed
- [x] `branchPrefix: "coderuntheworld"` in project-level `.claude/settings.json`
- [x] Global `CLAUDE.md` with branch naming, owner, preferences
- [x] Global `/user:setup-project` command — scaffolds full `.claude/` structure for any new repo
- [x] `session-start.sh` hook — installs deps automatically in web sessions
- [x] `/project:lint` command — runs both flake8 passes
- [x] Root `.gitignore` — excludes `CLAUDE.local.md`, `settings.local.json`

### Phase 2 — PR Review Automation
- [ ] GitHub Actions workflow: trigger Claude Code review on every PR, post inline comments
- [ ] Auto-merge when all CI checks pass
- [ ] PR template (`.github/pull_request_template.md`) — consistent PR structure
- [ ] Branch protection rules on `main` — require CI + review before merge
- [ ] Update `/user:setup-project` to include GitHub Actions review workflow and PR template

### Phase 3 — GitHub + Discord
- [ ] GitHub → Discord webhook notifications (PR open/merge/close, CI pass/fail, releases)
  - Implemented as a GitHub Actions step — no bot required
  - Needs: Discord webhook URL stored as GitHub secret `DISCORD_WEBHOOK_URL`
- [ ] Claude Code Channels integration — trigger Claude sessions from Discord messages
  - Requires Channels feature enabled on Anthropic account
  - Enables: drop a bug report in Discord, get back a PR

### Phase 4 — Scheduled Tasks
- [ ] Nightly: run tests, post results summary to Discord
- [ ] Weekly: dependency audit, flag outdated/vulnerable packages
- [ ] On PR merge: auto-generate changelog entry
- [ ] Set up via cloud scheduled tasks (run even when machine is off)

### For the Next Large Project
- [ ] Populate `.claude/rules/` files with project-specific content after scaffolding:
  - `code-style.md` — naming, formatting, imports, type hints
  - `testing.md` — framework, patterns, coverage expectations
  - `git-workflow.md` — commit format, PR conventions
  - `security.md` — what never gets committed, auth patterns
  - `architecture.md` — design decisions, patterns to follow/avoid
- [ ] Wire `.mcp.json` for GitHub MCP server (commit to repo for team sharing)
- [ ] Add Linear or Jira MCP server if using issue tracking
