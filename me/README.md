<!-- ai-tells: ignore-file (this file documents the tells, so it quotes them) -->

# me

A Claude skill that takes the AI sound out of my writing. It starts with the
punctuation mark that gives every model away, the em dash, and goes through the
vocabulary, the filler phrases, and the paragraph rhythm that make text read as
machine generated.

```diff
- The cache is simple — a map with a TTL — but it handles the load.
+ The cache is simple: a map with a TTL. It handles the load fine.

- In today's fast-paced landscape, it's worth noting that robust caching plays
- a crucial role in delivering a seamless experience.
+ I added a cache because the dashboard fired 40 queries per page load.

- This is not just a refactor, it's a rethinking of how we model state.
+ I moved state out of the component and into a store.
```

## What it bans

**Characters.** Em dash `—`, en dash `–`, horizontal bar `―`, the unicode
hyphen variants, and the ellipsis character `…`. ASCII hyphens stay legal for
compound words, CLI flags, and identifiers. Dashes inside code, paths, URLs,
versions, and quoted material are never touched.

**Words.** delve, leverage, utilize, facilitate, seamless, robust, myriad,
testament, tapestry, realm, pivotal, crucial, holistic, cutting edge, unlock,
elevate, embark, journey, ever evolving, and the rest of the list.

**Phrases.** "In today's fast paced world", "It's worth noting that", "That
being said", "In conclusion", "Let's dive in", "It's not just X, it's Y", "I
hope this helps", "Great question".

**Rhythm.** The part grep cannot catch: sentences that all run 15 to 25 words,
lists that always have exactly three items, a windup before every point, a
summary that repeats the section, bolded whole sentences, hedge stacking, and
sections of suspiciously equal length.

## Install

```bash
git clone https://github.com/broisnischal/skills.git ~/src/claude-skills
bash ~/src/claude-skills/me/install.sh            # personal: ~/.claude
bash ~/src/claude-skills/me/install.sh --project  # or just this repo
```

The installer symlinks the skill into `~/.claude/skills/me` and adds
`@~/.claude/skills/me/ALWAYS.md` to `CLAUDE.md`, so the dash ban is in context
on every turn instead of only when the skill loads. Re-running it changes
nothing.

Invoke the full skill with `/me`, or let it trigger on its own when I say a
draft sounds like AI.

## The checker

```bash
bash ~/.claude/skills/me/scripts/ai-tells.sh README.md docs/
```

Greps prose for the banned characters, the vocabulary, and the phrases, skipping
fenced code blocks. Exit 1 means there is still something to fix. A file
containing `ai-tells: ignore-file` is skipped, and a line containing
`ai-tells: ignore` is skipped, which is how this README survives its own check.

Wire it into a pre-commit hook if the writing matters:

```bash
bash ~/.claude/skills/me/scripts/ai-tells.sh $(git diff --cached --name-only --diff-filter=ACM -- '*.md')
```

## What's in here

| File | What it's for |
|---|---|
| `SKILL.md` | The rules: dash ban with fixes, vocabulary, phrases, structure, final check |
| `references/tells.md` | Long before and after tables, plus what actually reads human |
| `ALWAYS.md` | Short version to import into `CLAUDE.md` for every turn coverage |
| `scripts/ai-tells.sh` | The grep based checker |

## Pairs with [mine](../mine/)

Different jobs. `mine` decides whose voice it is, first person, I built this,
not a tutorial teaching me. `me` decides whether the prose sounds like a human
wrote it. Install both and they stack: my voice, and it reads like mine.

MIT.
