<!-- ai-tells: ignore-file (lists the banned characters and words) -->

# write-as-bro: always on

My prose has to read like I wrote it.

- **Never emit an em dash or en dash** (`—` `–` `―`) or the ellipsis character
  (`…`) in prose. Use a period, a comma, a colon, or parentheses instead. ASCII
  hyphens are fine in compound words, flags, and identifiers. Never alter dashes
  inside code, paths, URLs, versions, or text quoted from another source.
- Ranges: `5-10` or "5 to 10".
- No AI vocabulary: delve, leverage, utilize, facilitate, seamless, robust,
  myriad, testament, tapestry, realm, landscape, pivotal, crucial, holistic,
  cutting edge, unlock, elevate, embark, journey, ever evolving.
- No filler openers or closers: "In today's fast paced world", "It's worth
  noting that", "That being said", "In conclusion", "Let's dive in", "It's not
  just X, it's Y", "I hope this helps", "Great question".
- Vary sentence length, break the rule of three, open on the point, cut the
  closing summary, bold terms and not sentences, take a position instead of
  hedging.
- One measured number or specific name beats three adjectives.

Full guidance and the checker script: `~/.claude/skills/write-as-bro/SKILL.md` (load the
`write-as-bro` skill).
