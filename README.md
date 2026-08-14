# mine

A Claude skill that makes the AI write as **me**, not at me.

Default AI output has two habits I don't want in my own repo: it teaches me
("you should validate the payload…") and it talks about me in the third person
("the user can configure…"). Both are wrong — I researched the thing, I built
it, I tested it. This skill flips every artifact into my first-person voice:
docs, READMEs, code comments, commit bodies, PRs, issues, changelogs, specs,
reports.

```diff
- You should validate the payload before saving.
+ I validate the payload before saving.

- This tutorial shows you how to set up the worker.
+ Here's how I set up the worker.

- // Note: this function is not thread-safe.
+ // Not thread-safe — I only call it from the setup path.
```

## Install

**Personal (all my projects):**

```bash
git clone https://github.com/broisnischal/mine.git ~/.claude/skills/mine
```

**One project only:**

```bash
git clone https://github.com/broisnischal/mine.git .claude/skills/mine
```

Then either let Claude load it on demand (it triggers on writing/editing docs,
comments, commits, PRs) or invoke it explicitly with `/mine`.

## Always on

Skills load on demand. To keep the voice rule in context for **every** turn,
import `ALWAYS.md` from your top-level memory file — `~/.claude/CLAUDE.md` for
all projects, or `./CLAUDE.md` for one repo:

```md
@~/.claude/skills/mine/ALWAYS.md
```

`install.sh` does the clone and adds that import for you:

```bash
git clone https://github.com/broisnischal/mine.git ~/.claude/skills/mine
bash ~/.claude/skills/mine/install.sh
```

It's idempotent — re-running it won't duplicate the import line.

## What's in here

| File | What it's for |
|---|---|
| `SKILL.md` | The skill: the two rules, voice per artifact, rewrites, guardrails, self-check |
| `references/rewrites.md` | Longer before/after tables per artifact type |
| `ALWAYS.md` | Ten-line version to import into `CLAUDE.md` for every-turn coverage |
| `install.sh` | Symlink/clone + `CLAUDE.md` import wiring |

## Where it deliberately stops

- **Commit subjects stay imperative.** `Add retry to token refresh`, not `I add
  retry…` — tooling and every git convention expect that mood. The body is where
  the first person goes.
- **It won't invent me.** Writing in my voice means authorship, not fabrication:
  no made-up benchmarks, history, credentials, or opinions I never expressed, and
  no absorbing someone else's contribution into "I".
- **Some text isn't mine.** Public API reference stays neutral and declarative,
  end-user UI copy stays second-person ("Enter your email"), and templates others
  fill in stay generic.

## Make it yours

Fork it and edit two things:

1. **`we` instead of `I`** — if your writing goes out under a team name, swap the
   pronoun in `SKILL.md` and `ALWAYS.md`.
2. **Your own tells** — add the phrases you personally never write to the
   self-check regex at the bottom of `SKILL.md`.

MIT.
