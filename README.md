<!-- Language: **English** | [简体中文](./README.zh.md) | [日本語](./README.ja.md) -->

# Cognition Booster — Enhanced Cognition & Dialogue Optimization SKILL

A prompt protocol for "comprehend-first + intent calibration + reasoning optimization + code optimization + memory reinforcement".

- **Target models**: DeepSeek-V4-Pro, Xiaomi-MiMo-V2.5-Pro, plus [Chinese LLMs](./references/supported-models.md) such as Qwen / GLM / Kimi / Doubao / ERNIE / Hunyuan
- **Supported hosts**: Claude Code · Codex · Cursor · Windsurf · Cline / Roo Code · any IDE / CLI
- **Core idea**: understand what the user really means first, then reason toward the real goal, producing smarter, more rigorous, more executable results.

> 📦 **One-click install** (macOS / Linux):
> ```bash
> curl -fsSL https://raw.githubusercontent.com/Hhz0823/DS-MIMO-Optimisation-SKILL/main/install.sh | bash
> ```
> **One-click install** (Windows PowerShell):
> ```powershell
> irm https://raw.githubusercontent.com/Hhz0823/DS-MIMO-Optimisation-SKILL/main/install.ps1 | iex
> ```
> Full multi-IDE guide: **[INSTALL.md](./INSTALL.md)** (Codex & Claude Code first-class). The installer writes a **global** `~/.codex/AGENTS.md`, so every Codex conversation can invoke this SKILL.

## What it does

| Capability | Description |
|---|---|
| Dialogue correction | Tiered: silent typo fixes / inline notes / mandatory correction of wrong premises / ask when ambiguous; address the issue, not the person |
| Expression optimization | Proactively offer a "clearer phrasing" to help the user state their need |
| Dialogue association | When input is incomplete, recover the missing subject, fill in omissions, and infer unstated requirements — complete the meaning without changing the intent |
| Chinese comprehension | Understand inversions, idioms/proverbs/xiehouyu, ellipsis & reference, tone & irony, internet slang |
| Deep dialogue understanding | Use conversation history, read between the lines & emotion, fix inconsistencies, time clarifications well |
| Comprehend-first | Parse literal → calibrate intent → lock the real goal, then act |
| Goal setting | Three-layer pierce (surface request → real goal → deep motive), turned into measurable, bounded goals & milestones |
| Multi-dimensional thinking | Switch among first-principles / inversion / analogy / systems / user / time / cost views, then synthesize |
| Logic optimization | Complete premise→inference→conclusion chains, check fallacies, separate correlation from causation |
| Deep thinking | Drill down phenomenon→mechanism→root cause→essence, 5 Whys to the root |
| Code optimization | Read before write, minimal & sufficient, secure by default, verifiable, readable |
| Cache hit rate | Stable content first, templates before variables, append-don't-rewrite to protect the prompt prefix cache |
| Context utilization | High information density, reference over paste, load details on demand, trim the tail |
| Memory reinforcement | Snapshot key facts before compaction, re-read & cross-check after, prevent drift |

## File structure

```
cognition-booster/
├── SKILL.md         # Main entry: overall flow + protocol summaries
├── README.md        # This file (English, default)
├── README.zh.md     # 简体中文
├── README.ja.md     # 日本語
├── INSTALL.md       # Multi-IDE install guide
├── install.sh       # One-click installer (macOS / Linux)
├── install.ps1      # One-click installer (Windows)
└── references/
    ├── dialogue-optimization.md   # Dialogue & expression + deep understanding
    ├── dialogue-association.md    # Dialogue association (subject / omission / requirement)
    ├── chinese-comprehension.md   # Chinese comprehension (inversion/idiom/ellipsis/slang)
    ├── goal-setting.md            # Goal setting
    ├── reasoning-optimization.md  # Reasoning (multi-dim / logic / depth)
    ├── coding-optimization.md     # Code optimization
    ├── context-memory.md          # Context compaction & memory
    ├── efficiency-optimization.md # Efficiency (cache hit rate / context utilization)
    ├── supported-models.md        # Supported models (incl. Chinese LLMs)
    └── installation.md            # Short install notes
```

## Quick start

1. Read `SKILL.md` for the flow: **Parse → Calibrate goal → Restate → Reason → Act → Verify**.
2. Install via **[INSTALL.md](./INSTALL.md)** to your IDE / code tool (Claude Code, Codex, Cursor, Windsurf, Cline, etc.).
3. Test with a messy message that needs reasoning or coding.

## One-liner

> **Read the words, read the mind, set the goal, then begin.**
