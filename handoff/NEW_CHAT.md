# Starting a new session

The project remembers where you stopped in two files: `CLAUDE.md` (rules) and `STATUS.md` (current state). A new session reads both, so you do not need to write a summary by hand.

## End of a session
Ask: "Update STATUS.md: what works, what is not done, what is next."

## Start of a new session
Paste:

```
Continue from STATUS.md.
Task: [one concrete task]
If STATUS.md looks stale, ask me before starting.
```

## Handy Claude Code commands
- `claude --continue` resumes the last session in this folder; `claude --resume` lets you pick one.
- `/clear` starts fresh in the same project (it still reads `CLAUDE.md`).
