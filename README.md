# skills

My Claude skills. One directory per skill, each self-contained with its own
`SKILL.md`.

| Skill | What it does |
|---|---|
| [mine](mine/) | Makes Claude write as me, not at me — docs, comments, commit bodies, PRs and specs come out in my own first-person voice instead of tutorial voice ("you should…") or third person ("the user can…"). |

## Install one skill

Clone the collection anywhere, then run that skill's installer — it symlinks the
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
