#!/usr/bin/env bash
# Flag AI tells in prose: banned dash characters, machine vocabulary, filler
# phrases. Fenced code blocks are skipped, so dashes inside code are safe.
#
#   bash ai-tells.sh README.md docs/
#
# Opt out: put "ai-tells: ignore-file" anywhere in a file to skip it entirely,
# or "ai-tells: ignore" on a single line to skip that line.
#
# Exit 0 = clean, 1 = tells found, 2 = bad usage.

set -uo pipefail

if [[ $# -eq 0 ]]; then
  echo "usage: ai-tells.sh <file-or-dir>..." >&2
  exit 2
fi

DASHES='(—|–|―|‐|‑|‒|…)'

WORDS='\b(delve|delving|leverages?|leveraging|utiliz(e|es|ing|ation)|facilitat(e|es|ing)|harness(es|ing)?|unlock(s|ing)?|elevat(e|es|ing)|seamless(ly)?|robust|myriad|plethora|testament|tapestry|realm|holistic|pivotal|crucial|vital|meticulous(ly)?|intricate|paradigm|synerg(y|ies)|resonates?|embark(s|ing)?|unleash(es|ing)?|bolster(s|ing)?|streamlin(e|es|ing)|cutting.edge|game.chang(er|ing)|ever.evolving|treasure trove)\b'

# AI fingerprints: machine bylines and the handover frame. See mine/SKILL.md.
PRINTS="co.authored.by: *(claude|chatgpt|copilot|gpt)|generated (with|by) (claude|ai|chatgpt|copilot)|written (with|by) (ai|claude|chatgpt)|built with ai|powered by claude|as an ai|as your (ai )?assistant|i've (created|built|added|generated|put together).*for you|i have (created|built|added).*for you|here('s| is) your (new )?|feel free to (modify|customize|adjust|tweak)|let me know if you('d| would) like|if you have any (other )?questions|do not edit.*generated|🤖"

PHRASES="it's not just|it is not just|in today's|fast.paced world|ever.evolving landscape|at the end of the day|it's worth noting|it is worth noting|it is important to note|that being said|in conclusion|let's dive|lets dive|let's explore|whether you're a|key takeaway|plays a (crucial|vital|key) role|stands as a|is a testament to|when it comes to|i hope this helps|great question|rest assured|look no further|unlock the power|dive deeper into|in the world of"

status=0
files=()

for arg in "$@"; do
  if [[ -d "$arg" ]]; then
    while IFS= read -r f; do files+=("$f"); done < <(
      find "$arg" -type f \( -name '*.md' -o -name '*.mdx' -o -name '*.txt' -o -name '*.rst' \) \
        -not -path '*/.git/*' -not -path '*/node_modules/*'
    )
  elif [[ -f "$arg" ]]; then
    files+=("$arg")
  else
    echo "ai-tells: no such file: $arg" >&2
    status=2
  fi
done

[[ ${#files[@]} -eq 0 ]] && exit "$status"

# Emit FILE:LINE:TEXT for prose lines only (outside ``` fences, not opted out).
prose() {
  for f in "${files[@]}"; do
    grep -qi 'ai-tells: ignore-file' "$f" && continue
    awk -v f="$f" '
      /^[[:space:]]*```/ { fence = !fence; next }
      fence { next }
      /ai-tells: ignore/ { next }
      { print f ":" NR ":" $0 }
    ' "$f"
  done
}

hits=$(prose | grep -E -i "$DASHES|$WORDS|$PHRASES|$PRINTS")

if [[ -n "$hits" ]]; then
  echo "$hits" | grep -E -i --color=auto "$DASHES|$WORDS|$PHRASES|$PRINTS"
  echo
  echo "ai-tells: $(printf '%s\n' "$hits" | wc -l) line(s) to fix. See SKILL.md sections 1-4." >&2
  exit 1
fi

echo "ai-tells: clean (${#files[@]} file(s))"
exit "$status"
