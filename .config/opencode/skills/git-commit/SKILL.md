---
name: git-commit
description: Context-aware conventional commit messages with AI analysis
compatibility: opencode
metadata:
  audience: maintainers, contributors
  platform: github, gitea
---

## Workflow

1. Gather: `git diff --staged --no-color && git status --short`
2. Analyze: infer type from file patterns and code changes
3. Draft: build Angular-style commit message
4. Confirm: user accepts or edits

## Type Inference

| Changes match                   | Type     |
| ------------------------------- | -------- |
| `*.md`, README, CHANGELOG       | docs     |
| New function, class, export     | feat     |
| Bug fix, `fix:` or `bug:`       | fix      |
| `test/`, `*.test.*`, `*.spec.*` | test     |
| `*.yml`, `*.json`, `*.toml`     | chore    |
| Formatting, linting only        | style    |
| Code only, no behavior change   | refactor |
| Performance improvement         | perf     |
| `.github/`, `.gitlab-ci.yml`    | ci       |
| `package-lock`, `yarn.lock`     | build    |
| Revert previous commit          | revert   |

## Breaking Changes

Detect: removed exports, changed signatures, deleted fields.  
If detected, ask: "Add BREAKING CHANGE footer?"

## Format

```
<type>(<scope>): <subject>

<body>

<footer>
```

- Types: feat, fix, docs, refactor, test, perf, style, chore, ci, build, revert
- Subject: ≤50 chars, imperative, no period
- Body: ≤72 chars per line, omit if empty
- Scope: optional, lowercase, usually directory/module name
- Footer: BREAKING CHANGE: or Closes #123

## Output

Return only the final commit message.
Split into multiple commits if the changes cover multiple concerns.
If body or footer is needed, add a blank line after the subject:
