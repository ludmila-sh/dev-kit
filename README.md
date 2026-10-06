# dev-kit

Personal starter kit for new projects: my working rules for AI coding agents plus project scaffolds. The kit is not a working repository. New projects are copied out of it, and the kit itself stays untouched.

## What is where

```
CLAUDE.md             personal layer: who I am, how to work with me, code rules
CLAUDE.template.md    interview that builds a personal CLAUDE.md (Russian, for sharing)
rules/DEV_RULES.md    general engineering rules, imported by CLAUDE.md
dispatcher/           task dispatcher prompt, imported by CLAUDE.md
handoff/              HANDOFF.md (for the client), LAUNCH_CHECKLIST.md (internal), NEW_CHAT.md
scaffolds/            python/, frontend/, research/ starting points
bootstrap.ps1         create a project (Windows)
bootstrap.sh          create a project (Linux/macOS)
```

## New project

1. Run the script with the project type and a new, empty target folder:
   - Windows: `.\bootstrap.ps1 -Type python -Target D:\projects\my-project`
   - Linux/macOS: `./bootstrap.sh python ~/projects/my-project`
2. `cd` into it and `git init`.
3. Fill in the Project section of `CLAUDE.md` and `ROADMAP.md`. If there is a `.env.example`, copy it to `.env`.
4. Open the folder in Claude Code and run `/memory` to check that the instruction files are loaded.

The script refuses to run if the target is not empty or is inside dev-kit. It never changes dev-kit and does not touch git.

## What a new project gets

- The scaffold files for the chosen type (code skeleton, `.gitignore`, `.claude/settings.json`, pre-commit config, README, ROADMAP, STATUS).
- `CLAUDE.md` (the scaffold's project part) that imports `PERSONAL.md` (a copy of the personal layer). `PERSONAL.md` imports `rules/DEV_RULES.md` and `dispatcher/DISPATCHER.md`.
- `docs/HANDOFF.md`, the client handoff template.

The internal files (`LAUNCH_CHECKLIST.md`, `NEW_CHAT.md`) stay in dev-kit.

## Notes

- Changes in dev-kit do not reach projects that already exist. Copy a changed file by hand if you need it there.
- To switch the dispatcher off in a project, remove its import line from `PERSONAL.md`.
- Each scaffold denies the agent reading `.env` and key files and has a gitleaks hook against committed secrets. A read denial does not stop a script that opens files by itself; OS-level sandboxing is the next layer.
