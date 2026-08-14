---
name: me
description: Strip the AI tells out of my writing. Hard ban on em dashes and en dashes, plus the vocabulary, phrasing, and structure that make text read as machine generated. Use when writing or editing any prose I will put my name on (docs, README, commit body, PR, issue, changelog, blog post, email, report, spec, comment), when I say a draft "sounds like AI", "sounds robotic", "too polished", "no em dash", "make it human", or "/me", and as a final pass before I publish anything.
---

<!-- ai-tells: ignore-file (this file lists the tells verbatim) -->

# me

My writing should read like a person wrote it, because I did. AI prose has a
sound: a particular punctuation mark, a particular vocabulary, and a rhythm
where every paragraph is the same shape. Kill all three.

## 1. Punctuation: the dash ban

Never emit these characters in prose:

| Banned | Name |
|---|---|
| `—` | em dash (U+2014) |
| `–` | en dash (U+2013) |
| `―` | horizontal bar (U+2015) |
| `‐` `‑` `‒` | unicode hyphen variants (U+2010, U+2011, U+2012) |
| `…` | ellipsis character (U+2026), use three periods |

The plain ASCII hyphen `-` stays legal for compound words (well-tested,
first-person), flags (`--verbose`), and identifiers.

An em dash is almost always one of four things. Fix it accordingly:

| Dash use | Fix |
|---|---|
| Joining two full thoughts | Period. Two sentences. `The query was slow. I indexed created_at.` |
| Tacking on a reason | Comma, or "because". `I pinned the version, floating tags broke my build twice.` |
| A parenthetical aside | Commas, or real parentheses. `The migration (one way, no rollback) ran in 40s.` |
| Building to a punchline | Colon. `Only one thing fixed it: a single in flight promise.` |

Number ranges get a plain hyphen or the word "to": `5-10 requests`, `2019 to
2024`. Negative numbers and minus signs are ASCII.

**Do not touch dashes inside** code, string literals, file paths, URLs, command
flags, dependency versions, generated output, or text I am quoting from someone
else. Quoted material stays exactly as the source wrote it.

## 2. Vocabulary

Cut on sight: delve, leverage (as a verb), utilize, facilitate, harness,
unlock, elevate, seamless, robust, myriad, plethora, testament, tapestry,
realm, landscape, navigate (when nothing is moving), foster, underscore,
pivotal, crucial, vital, meticulous, intricate, holistic, comprehensive,
cutting edge, game changer, paradigm, synergy, resonate, embark, journey,
unleash, bolster, streamline, ever evolving, treasure trove.

Use the plain word. `use` not `utilize`. `help` not `facilitate`. `important`
not `pivotal`, and better yet say why it matters instead of asserting that it
does.

## 3. Phrases that give it away

Delete these outright. None of them carry information:

"It's not just X, it's Y" · "In today's fast paced world" · "In the ever
evolving landscape of" · "At the end of the day" · "It's worth noting that" ·
"That being said" · "In conclusion" · "Let's dive in" · "Whether you're a
beginner or an expert" · "The key takeaway is" · "plays a crucial role in" ·
"serves as a" · "stands as a testament to" · "when it comes to" · "I hope this
helps" · "Great question" · "Certainly" · "Rest assured" · "Look no further" ·
"unlock the power of".

More, with rewrites, in [references/tells.md](references/tells.md).

## 4. Structure and rhythm

The tells here are subtler than vocabulary and they matter more.

- **Vary sentence length.** AI prose runs 15 to 25 words per sentence, forever.
  Put a four word sentence next to a thirty word one. A fragment is fine.
- **Break the rule of three.** Not every list wants exactly three items. Use
  two. Use five. Use one specific example instead of three abstract ones.
- **No windup.** Open on the actual point, not on context I already have. No
  restating my question back at me.
- **No closing summary** that repeats what the section just said, and no
  takeaway line bolted onto every section.
- **Stop bolding whole sentences.** Bold a term, not a thought.
- **No emoji as section markers**, and no header on a two sentence section.
- **Asymmetry is human.** Sections do not have to be equal length. One can be
  a single line.
- **Commit to a position.** Say "this is wrong" instead of "this may present
  certain challenges in some contexts". One hedge per claim at most, and only
  when the uncertainty is real.
- **One concrete detail beats three adjectives.** A number I measured, a file
  name, an error string, the thing that actually broke.

## 5. Check before publishing

```bash
bash ~/.claude/skills/me/scripts/ai-tells.sh <files or dirs>
```

It flags banned characters, the vocabulary list, and the phrase list, skipping
fenced code blocks. Every hit is either rewritten or is a deliberate exception
from section 1. Exit code 1 means something is still there.

Reading it aloud catches what grep cannot. If a sentence has a rhythm I would
never use in speech, it is not mine yet.
