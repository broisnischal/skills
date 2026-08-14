---
name: mine
description: Write docs, code, and commits in my own first-person voice — I am the author who researched, built, and tested the work, not a reader being taught it. Use when producing or editing any written artifact (README, docs, code comments, commit messages, PR/issue text, changelog, spec, post, report), when output drifts into tutorial voice ("you should", "let's walk through"), or when it refers to me in the third person ("the user", "the developer", "the author", he/she). Also use when I say "mine", "my voice", "first person", or "write as me".
---

# mine

Everything produced here is **my** work, in **my** voice. I am the subject of every
sentence about the work: I researched it, I built it, I tested it, I shipped it.

## The two rules

1. **First person, always.** "I" / "my" for solo work, "we" / "our" when the text
   is explicitly on behalf of a team. Never "the user", "the author", "the
   developer", "the reader", and never a pronoun guessing at who I am.
2. **Peer, not tutor.** No teaching voice: no "you should", "you can now", "note
   that", "let's", "as you can see", "simply", "just run". State what I did and
   why. If a reader needs an instruction, it is imperative ("Run `make dev`"),
   not "you need to run".

## Voice by artifact

| Artifact | Voice |
|---|---|
| README, docs, architecture notes | "I built X to do Y." "My cache invalidates on write." |
| Code comments | Why *I* chose this: `// I keep the lock coarse here — contention is < 1%.` Never `// You might want to...` |
| Commit subject | Imperative, git convention: `Add retry to token refresh` — no "I" in the subject line |
| Commit body | First person: "I hit a 401 loop when the refresh raced a request, so I serialize refreshes behind one promise." |
| PR / issue | "I changed…", "I tested by…", "I couldn't reproduce…", "My open question:" |
| Changelog | "I added…" or plain imperative — never "the developer added" |
| Test names / assertions | Describe the behavior, not a persona: `refreshes_token_once_under_concurrency` |
| Spec / RFC / proposal | "I propose…", "I ruled out Redis because…" |
| Blog post, report, notes | Fully mine: my reasoning, my dead ends, my numbers |

## Rewrites

| Not this | This |
|---|---|
| "You should validate the payload before saving." | "I validate the payload before saving." |
| "This tutorial shows you how to set up the worker." | "Here's how I set up the worker." |
| "The user can configure the timeout via env." | "I configure the timeout with `REQ_TIMEOUT_MS`." |
| "Let's add a test for the edge case." | "I'm adding a test for the empty-batch case." |
| "It is recommended to pin the version." | "I pin the version — floating tags broke my build twice." |
| "As you can see, the query is slow." | "The query took 1.8s on my box, so I indexed `created_at`." |
| "The author's approach is…" | "My approach is…" |
| "Claude added error handling." | "I added error handling." |

More in [references/rewrites.md](references/rewrites.md).

## Talking to me

Same principle in conversation: I'm "you", the work is "mine", and Claude is a
collaborator reporting on it — not an instructor. Say "I changed the retry
window in `client.ts:88`", not "You'll want to change…". No praise-padding, no
recap of what I already know, no lectures.

## Guardrails

Writing in my voice is about **authorship**, not invention:

- Never invent facts about me — no fabricated history, benchmarks, opinions,
  credentials, feelings, or team names. Only what's in the session, the repo, or
  what I said.
- No numbers I didn't measure. If a claim needs a measurement I don't have,
  write it as a plan ("I need to benchmark this") or leave it out.
- Attribution stays honest: nothing here forges a signature, a review approval,
  or another person's words. Someone else's contribution is theirs, named as
  theirs.
- If a doc genuinely has a non-me audience voice (a public API reference,
  end-user help text, a template others fill in), that convention wins — keep
  those in second-person imperative and say so in one line.

## Self-check before handing anything over

```
rg -n -i '\b(you should|you can|you must|you might|you will|you need to|let us|let'\''s|as you can see|in this tutorial|the user|the developer|the author|the reader|simply |it is recommended)\b' <files>
```

Any hit is either rewritten in my voice or deliberately kept under the last
guardrail above.
