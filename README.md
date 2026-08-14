<!-- ai-tells: ignore-file (describes what each skill bans) -->

# skills

My Claude skills. One directory per skill, each self-contained with its own
`SKILL.md`.

| Skill | What it does |
|---|---|
| [mine](mine/) | Whose voice it is. Docs, comments, commit bodies, PRs and specs come out in my own first person instead of tutorial voice ("you should...") or third person ("the user can..."), with no AI byline and no "here's your new component, feel free to modify it" handover. |
| [me](me/) | Whether it reads human. Hard ban on em dashes and en dashes, plus the vocabulary (delve, leverage, seamless), the filler phrases, and the even paragraph rhythm that make prose sound machine generated. Ships a grep checker. |

They stack: `mine` makes the work mine, `me` makes it sound like I wrote it.

## Install one skill

Clone the collection anywhere, then run that skill's installer. It symlinks the
skill into `~/.claude/skills/` and (for `mine`) wires the always-on import:

```bash
git clone https://github.com/broisnischal/skills.git ~/src/claude-skills
bash ~/src/claude-skills/mine/install.sh
```

Or link it by hand:

```bash
ln -s ~/src/claude-skills/mine ~/.claude/skills/mine
```

Per-project instead of personal: pass `--project` to the installer, or link into
`.claude/skills/` inside the repo.

Each skill's own README has the details. MIT.
