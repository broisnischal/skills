<!-- ai-tells: ignore-file (before and after tables quote the tells) -->

# Tells, with rewrites

The full list, grouped by how the text gives itself away. Every rewrite keeps
the technical content identical and drops only the machine sound.

## Dashes

| Draft | Mine |
|---|---|
| "The cache is simple, a map with a TTL, but it handles the load." (em dashes) | "The cache is simple: a map with a TTL. It handles the load fine." |
| "Three services, ingest, rollup, and API, share the pool." | "Three services share the pool: ingest, rollup, and API." |
| "I tried Redis, it was overkill, and settled on SQLite." | "I tried Redis first. It was overkill, so I settled on SQLite." |
| "Latency dropped from 1.8s to 1.1s, a real win." | "Latency dropped from 1.8s to 1.1s. That is a real win." |
| "Requests take 5, 10 seconds under load." | "Requests take 5 to 10 seconds under load." |

## Opening lines

| Draft | Mine |
|---|---|
| "In today's fast paced development landscape, caching is more important than ever." | "I added a cache because the dashboard was making 40 queries per page load." |
| "Great question! Let's dive into how authentication works." | "Auth runs on short lived access tokens with one refresh in flight at a time." |
| "This document aims to provide a comprehensive overview of the system." | "How the system fits together, and where it breaks." |
| "Have you ever wondered how rate limiting works?" | "My rate limiter is a token bucket per API key, in Redis." |

## Padding

| Draft | Mine |
|---|---|
| "It's worth noting that the migration is irreversible." | "The migration is irreversible." |
| "It is important to understand that tokens expire after one hour." | "Tokens expire after an hour." |
| "This approach may potentially help to improve performance to some extent." | "This cut p99 by 40%." (only if measured) |
| "There are a number of different options available to you." | "Two options:" |
| "In conclusion, the index fixed the problem." | Delete the sentence. The reader just read it. |
| "I hope this helps. Let me know if you have any questions." | Delete. |

## Fake profundity

| Draft | Mine |
|---|---|
| "This is not just a refactor, it's a rethinking of how we model state." | "I moved state out of the component and into a store." |
| "Good code is a testament to careful thought." | Delete. It says nothing. |
| "This unlocks a whole new paradigm for the team." | "The team can now deploy without me." |
| "Performance is a journey, not a destination." | Delete. |
| "Let's explore the rich tapestry of options in the ecosystem." | "Three libraries do this. I picked undici." |

## Words, plainly

| Instead of | Write |
|---|---|
| utilize, leverage | use |
| facilitate | help, let, allow |
| commence, embark on | start |
| endeavor to | try |
| in order to | to |
| prior to | before |
| subsequent to | after |
| a myriad of, a plethora of | many, or the actual count |
| pivotal, crucial, vital | important, or say what breaks without it |
| robust, seamless | say what it actually does: retries on 503, no reconnect needed |
| meticulous, intricate | detailed, or describe the detail |
| delve into | look at, read, dig through |
| navigate the complexities of | deal with |

## Structure

**The three item reflex.** AI reaches for exactly three of everything. If a
list has three items, ask whether the third is real. Often two are load bearing
and the third is filler added for balance.

**Even paragraphs.** Four paragraphs of four sentences each is a machine
signature. Real writing has a one line paragraph where the point lands.

**Symmetric sentences.** "It improves speed, reduces cost, and increases
reliability." That parallel triple is the sound. Break it: "It is faster and
cheaper. Reliability did not change."

**Section summaries.** A closing line that restates the section is a tell.
Trust the reader.

**Hedge stacking.** "may potentially", "could possibly", "in some cases might".
Pick one hedge, or none, and only when the doubt is real.

**Every section titled.** Two sentences do not need an H3 above them.

## What actually reads human

- A number nobody would invent, because it was measured: "1.8s to 1.1s", "40
  queries per page".
- Admitting a limit: "I did not test this against staging."
- A dead end left in: "I tried a mutex first and deadlocked on the retry path."
- A named thing: the error string, the file, the library version, the issue
  number.
- Contractions, in anything that is not a formal spec.
- An opinion with a reason attached.
- Ending when the point is made, with no wrap up.
