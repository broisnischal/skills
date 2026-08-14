<!-- ai-tells: ignore-file (quotes the banned phrases as examples) -->

# me

A Claude skill that makes the AI write as **me**, not at me.

Default AI output has three habits I don't want in my own repo. It teaches me
("you should validate the payload..."). It talks about me in the third person
("the user can configure..."). And it signs its own name to my work, either
literally (`Co-Authored-By: Claude`, "Generated with Claude Code") or through the
handover frame where my own file gets presented back to me as a gift ("here's
your new component, feel free to modify it").

All three are wrong. I researched the thing, I built it, I tested it. This skill
flips every artifact into my first-person voice: docs, READMEs, code comments,
commit bodies, PRs, issues, changelogs, specs, reports.

```diff
- You should validate the payload before saving.
+ I validate the payload before saving.

- I've created a retry helper for you. Feel free to modify it.
+ I added a retry helper in auth/refresh.ts.

- This tutorial shows you how to set up the worker.
+ Here's how I set up the worker.

- // Note: this function is not thread-safe.
+ // Not thread-safe. I only call it from the setup path.
```

## Install

This skill lives in my [skills](https://github.com/broisnischal/skills)
collection. Clone it anywhere, then run the installer. It symlinks the skill
into place and wires the always-on import below:

```bash
git clone https://github.com/broisnischal/skills.git ~/src/claude-skills
bash ~/src/claude-skills/me/install.sh            # personal: ~/.claude
bash ~/src/claude-skills/me/install.sh --project  # or just this repo
```

It's idempotent, re-running it won't duplicate anything. By hand instead:

```bash
ln -s ~/src/claude-skills/me ~/.claude/skills/me   # or .claude/skills/me
```

Then either let Claude load it on demand (it triggers on writing/editing docs,
comments, commits, PRs) or invoke it explicitly with `/me`.

## Always on

Skills load on demand. To keep the voice rule in context for **every** turn,
import `ALWAYS.md` from your top-level memory file: `~/.claude/CLAUDE.md` for
all projects, or `./CLAUDE.md` for one repo:

```md
@~/.claude/skills/me/ALWAYS.md
```

`install.sh` appends that line for you (and skips it if it's already there).

## What's in here

| File | What it's for |
|---|---|
| `SKILL.md` | The skill: the three rules, voice per artifact, rewrites, guardrails, self-check |
| `references/rewrites.md` | Longer before/after tables per artifact type |
| `ALWAYS.md` | Ten-line version to import into `CLAUDE.md` for every-turn coverage |
| `install.sh` | Symlink/clone + `CLAUDE.md` import wiring |

## Where it deliberately stops

- **Commit subjects stay imperative.** `Add retry to token refresh`, not `I add
  retry...`. Tooling and every git convention expect that mood. The body is where
  the first person goes.
- **It won't invent me.** Writing in my voice means authorship, not fabrication:
  no made-up benchmarks, history, credentials, or opinions I never expressed, and
  no absorbing someone else's contribution into "I".
- **Some text isn't mine.** Public API reference stays neutral and declarative,
  end-user UI copy stays second-person ("Enter your email"), and templates others
  fill in stay generic.

## Make it yours

Fork it and edit two things:

1. **`we` instead of `I`**: if your writing goes out under a team name, swap the
   pronoun in `SKILL.md` and `ALWAYS.md`.
2. **Your own tells**: add the phrases you personally never write to the
   self-check regex at the bottom of `SKILL.md`.

## Pairs with [write-as-bro](../write-as-bro/)

Different jobs. `me` settles whose voice it is. `write-as-bro` settles whether
the prose reads human: no em dashes, none of the AI vocabulary, none of the even
paragraph rhythm. Install both and they stack.

MIT.
