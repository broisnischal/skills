#!/usr/bin/env bash
# Wire the `mine` skill into Claude: link it into the skills dir (if it isn't
# already there) and import ALWAYS.md from CLAUDE.md so the voice rule loads
# on every turn. Idempotent.
#
#   bash install.sh            # personal:  ~/.claude
#   bash install.sh --project  # this repo: ./.claude + ./CLAUDE.md

set -euo pipefail

SRC="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [[ "${1:-}" == "--project" ]]; then
  SKILLS_DIR=".claude/skills"
  MEMORY="CLAUDE.md"
  IMPORT="@.claude/skills/mine/ALWAYS.md"
else
  SKILLS_DIR="$HOME/.claude/skills"
  MEMORY="$HOME/.claude/CLAUDE.md"
  IMPORT="@$HOME/.claude/skills/mine/ALWAYS.md"
fi

mkdir -p "$SKILLS_DIR"
TARGET="$SKILLS_DIR/mine"

if [[ -e "$TARGET" || -L "$TARGET" ]]; then
  RESOLVED="$(cd "$TARGET" 2>/dev/null && pwd -P || true)"
  if [[ "$RESOLVED" == "$SRC" ]]; then
    echo "skill: already installed at $TARGET"
  else
    echo "skill: $TARGET exists and points elsewhere ($RESOLVED) — leaving it alone" >&2
  fi
else
  ln -s "$SRC" "$TARGET"
  echo "skill: linked $TARGET -> $SRC"
fi

touch "$MEMORY"
if grep -Fq "skills/mine/ALWAYS.md" "$MEMORY"; then
  echo "memory: import already in $MEMORY"
else
  printf '\n%s\n' "$IMPORT" >>"$MEMORY"
  echo "memory: added import to $MEMORY"
fi

echo
echo "Done. Start a new Claude session, or run /mine to load the full skill."
