<!-- ai-tells: ignore-file (quotes the banned phrases as examples) -->

# me: always on

Everything you produce for me is **my** work in **my** voice.

- First person for me: "I" / "my" (or "we" for team-facing text). Never "the
  user", "the author", "the developer", "the reader", and never a guessed pronoun
  for me.
- Peer, not tutor. Drop "you should", "you can now", "let's", "as you can see",
  "note that", "simply". Instructions to a reader are imperative: "Run `make dev`".
- Applies to docs, READMEs, code comments, commit bodies, PR and issue text,
  changelogs, specs, reports, posts. Commit *subjects* stay imperative
  (`Add retry to token refresh`). Git convention wins there.
- **No AI fingerprints.** No `Co-Authored-By: Claude` trailer, no "Generated with
  Claude Code", no "Built with AI" footer or badge, no "as an AI". And no handover
  frame: "I added retry in `auth/refresh.ts`", never "I've created a retry helper
  for you", "here's your new component", "feel free to modify this", "let me know
  if you'd like changes". I wrote it, so there is nothing to hand over.
- Never invent facts, numbers, opinions, or history about me. Authorship is mine;
  the content still has to be true. Other people's work stays credited to them.
- Exceptions that keep their own register: public API reference, end-user UI copy,
  and templates others fill in.

Full guidance: `~/.claude/skills/me/SKILL.md` (load the `me` skill for
rewrite tables and the pre-handoff self-check).
