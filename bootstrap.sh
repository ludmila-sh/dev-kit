#!/usr/bin/env bash
# Create a new project folder from a dev-kit scaffold. Files are copied out; dev-kit is never modified.
# Usage: ./bootstrap.sh <python|frontend|research> <target-dir>
set -euo pipefail

usage() { echo "Usage: $0 <python|frontend|research> <target-dir>" >&2; exit 1; }

type="${1:-}"
target="${2:-}"
[ -n "$target" ] || usage
case "$type" in python | frontend | research) ;; *) usage ;; esac

kit="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
scaffold="$kit/scaffolds/$type"
[ -d "$scaffold" ] || { echo "Scaffold not found: $scaffold" >&2; exit 1; }

if [ -e "$target" ] && [ -n "$(ls -A "$target" 2>/dev/null)" ]; then
    echo "Target exists and is not empty: $target" >&2
    exit 1
fi

mkdir -p "$target"
target="$(cd "$target" && pwd)"
case "$target/" in
    "$kit/"*)
        rmdir "$target"
        echo "Target must be outside dev-kit: $target" >&2
        exit 1
        ;;
esac

# 1. Scaffold files (including dotfiles) go to the project root
cp -a "$scaffold/." "$target/"

# 2. Personal layer, general rules, dispatcher, client handoff template
mkdir -p "$target/rules" "$target/dispatcher" "$target/docs"
cp "$kit/CLAUDE.md" "$target/PERSONAL.md"
cp "$kit/rules/DEV_RULES.md" "$target/rules/"
cp "$kit/dispatcher/DISPATCHER.md" "$target/dispatcher/"
cp "$kit/handoff/HANDOFF.md" "$target/docs/"

# 3. Project CLAUDE.md = scaffold CLAUDE.md with the personal layer imported first
{ printf '@PERSONAL.md\n\n'; cat "$scaffold/CLAUDE.md"; } > "$target/CLAUDE.md"

echo "Created $type project at $target"
echo "Next:"
echo "  1. cd $target && git init"
echo "  2. Fill in the Project section of CLAUDE.md and ROADMAP.md"
echo "  3. If there is a .env.example: copy it to .env and fill in the values"
echo "  4. Open the folder in Claude Code and run /memory to check that CLAUDE.md, PERSONAL.md,"
echo "     rules/DEV_RULES.md and dispatcher/DISPATCHER.md are loaded"
