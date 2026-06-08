# 安装指南 / Installation Guide

> **Cognition Booster** — 增强型认知与对话优化 SKILL
> 适用模型：DeepSeek-V4-Pro · Xiaomi-MiMo-V2.5-Pro
> 支持宿主：Claude Code · Codex · Cursor · Windsurf · Cline · 通用 IDE / CLI

本指南覆盖在多种 AI 编程工具中安装本 SKILL 的方法。**重点支持 Codex 与 Claude Code。**

---

## 目录

- [一键安装（推荐）](#一键安装推荐)
- [快速开始](#快速开始)
- [一、Claude Code（推荐）](#一claude-code推荐)
- [二、Codex（OpenAI Codex CLI / IDE）](#二codexopenai-codex-cli--ide)
- [三、Cursor](#三cursor)
- [四、Windsurf](#四windsurf)
- [五、Cline / Roo Code（VS Code 扩展）](#五cline--roo-codevs-code-扩展)
- [六、通用方式（任意 IDE / CLI）](#六通用方式任意-ide--cli)
- [支持的模型](#支持的模型)
- [验证安装](#验证安装)
- [常见问题](#常见问题)

---

## 一键安装（推荐）

一条命令自动安装到 Claude Code、Codex、Cursor、Windsurf、Cline 等（自动检测并写入对应规则文件）。

### macOS / Linux

```bash
curl -fsSL https://raw.githubusercontent.com/Hhz0823/DS-MIMO-Optimisation-SKILL/main/install.sh | bash
```

只装指定目标（例如只装 Claude Code 和 Codex）：

```bash
TARGETS="claude codex" bash -c "$(curl -fsSL https://raw.githubusercontent.com/Hhz0823/DS-MIMO-Optimisation-SKILL/main/install.sh)"
```

### Windows（PowerShell）

```powershell
irm https://raw.githubusercontent.com/Hhz0823/DS-MIMO-Optimisation-SKILL/main/install.ps1 | iex
```

只装指定目标：

```powershell
& ([scriptblock]::Create((irm https://raw.githubusercontent.com/Hhz0823/DS-MIMO-Optimisation-SKILL/main/install.ps1))) -Targets "claude,codex"
```

### 已克隆仓库时

```bash
# macOS / Linux
bash install.sh
```
```powershell
# Windows
powershell -ExecutionPolicy Bypass -File install.ps1
```

> 脚本做了什么：把 SKILL 文件复制到 Claude Code 的 `~/.claude/skills/`、Codex 的
> `~/.codex/prompts/` 并向项目 `AGENTS.md` 写引用、为 Cursor 写 `.cursor/rules/*.mdc`、
> 为 Windsurf 写 `.windsurfrules`、为 Cline 写 `.clinerules`。已存在的引用会跳过，安全幂等。

---

## 快速开始（手动）

```bash
# 1. 克隆仓库
git clone https://github.com/Hhz0823/DS-MIMO-Optimisation-SKILL.git

# 2. 进入目录
cd DS-MIMO-Optimisation-SKILL
```

仓库结构：

```
DS-MIMO-Optimisation-SKILL/
├── SKILL.md                          # 主入口：总流程 + 各协议摘要
├── README.md                         # 项目总览
├── INSTALL.md                        # 本安装指南
├── LICENSE
└── references/
    ├── dialogue-optimization.md      # 对话与表达优化 + 对话深度理解
    ├── dialogue-association.md       # 对话联想与补全（找主语/补内容/联想要求）
    ├── chinese-comprehension.md      # 中文深度理解（倒装/成语/省略/网络语）
    ├── goal-setting.md               # 目标化制定
    ├── reasoning-optimization.md     # 推理与思考优化（多元/逻辑/深度）
    ├── coding-optimization.md        # 代码编程优化
    ├── context-memory.md             # 上下文压缩与记忆强化
    ├── efficiency-optimization.md    # 效率优化（缓存命中率/上下文使用率）
    └── installation.md               # 简版安装说明
```

> **核心概念**：本 SKILL 是一组 Markdown 协议文件。安装 = 把它放到你的工具能识别为
> "指令 / skill / 规则"的位置。文件夹建议命名为 `cognition-booster`。

---

## 一、Claude Code（推荐）

Claude Code 原生支持 skills，从以下任一位置自动发现：

| 范围 | 路径 |
|---|---|
| 个人级（所有项目） | `~/.claude/skills/` |
| 项目级（仅当前项目） | `<项目根>/.claude/skills/` |

### 安装步骤

```bash
# macOS / Linux
git clone https://github.com/Hhz0823/DS-MIMO-Optimisation-SKILL.git
cp -r DS-MIMO-Optimisation-SKILL ~/.claude/skills/cognition-booster
# 移除多余文件（可选）
rm -rf ~/.claude/skills/cognition-booster/.git
```

```powershell
# Windows (PowerShell)
git clone https://github.com/Hhz0823/DS-MIMO-Optimisation-SKILL.git
Copy-Item -Recurse DS-MIMO-Optimisation-SKILL "$env:USERPROFILE\.claude\skills\cognition-booster"
```

最终结构应为：`~/.claude/skills/cognition-booster/SKILL.md`

### 启用

1. 重启 / 重新打开 Claude Code。
2. 输入 `/` 查看是否出现该 skill，或直接描述相关任务自动触发。
3. 也可显式说："使用 cognition-booster 协议"。

---

## 二、Codex（OpenAI Codex CLI / IDE）

Codex 通过 `AGENTS.md` 与 prompts 目录加载自定义指令。提供两种方式，**方式 1 最稳。**

### 方式 1：AGENTS.md（推荐，最通用）

Codex 会自动读取项目根目录的 `AGENTS.md` 作为 agent 指令。

```bash
# 在你的项目根目录
git clone https://github.com/Hhz0823/DS-MIMO-Optimisation-SKILL.git .codex-skill
```

在项目根创建或编辑 `AGENTS.md`，加入引用：

```markdown
# 项目 Agent 协议

本项目遵循 Cognition Booster 认知增强协议。
请阅读并严格执行 ./.codex-skill/SKILL.md 及其 references/ 下的全部子协议：
先理解文字（含中文倒装/成语/省略）→ 校准目标 → 多元化与深度推理 →
代码优化 → 缓存与上下文效率优化。
```

> 也可把 `SKILL.md` 的内容直接粘贴进 `AGENTS.md`，确保 Codex 一定加载到。

### 方式 2：全局 prompts 目录

```bash
# 放入 Codex 全局配置目录（版本不同路径可能不同）
mkdir -p ~/.codex/prompts
cp -r DS-MIMO-Optimisation-SKILL ~/.codex/prompts/cognition-booster
```

会话开始时引用：`遵循 cognition-booster 协议`。

> 不同 Codex 版本目录约定有差异。若 `~/.codex/` 不存在，请优先用方式 1 的 `AGENTS.md`。

---

## 三、Cursor

Cursor 通过 **Project Rules**（`.cursor/rules/`）或 `.cursorrules` 加载规则。

### 方式 A：Project Rules（推荐，新版）

```bash
mkdir -p .cursor/rules
git clone https://github.com/Hhz0823/DS-MIMO-Optimisation-SKILL.git .cursor/rules/cognition-booster
```

新建 `.cursor/rules/cognition-booster.mdc`：

```markdown
---
description: Cognition Booster 认知增强协议
alwaysApply: true
---

遵循 ./cognition-booster/SKILL.md 及其 references/ 下全部子协议：
理解前置、目标化制定、多元化与深度推理、代码优化、缓存与上下文效率优化。
```

### 方式 B：.cursorrules（旧版，单文件）

把 `SKILL.md` 内容复制进项目根的 `.cursorrules` 文件即可。

---

## 四、Windsurf

Windsurf（Codeium）通过 `.windsurfrules` 或 Cascade Memories 加载规则。

```bash
git clone https://github.com/Hhz0823/DS-MIMO-Optimisation-SKILL.git .windsurf-skill
```

在项目根创建 `.windsurfrules`，粘贴 `SKILL.md` 内容，或写引用：

```
遵循 ./.windsurf-skill/SKILL.md 中的 Cognition Booster 协议及其 references/ 子协议。
```

---

## 五、Cline / Roo Code（VS Code 扩展）

这类扩展读取项目根的 `.clinerules`（Cline）或 `.roo/rules/`（Roo Code）。

```bash
# Cline
git clone https://github.com/Hhz0823/DS-MIMO-Optimisation-SKILL.git
cp DS-MIMO-Optimisation-SKILL/SKILL.md .clinerules
```

或写引用行指向克隆下来的 `SKILL.md`，并把 `references/` 一并放进项目。

---

## 六、通用方式（任意 IDE / CLI）

只要你的工具支持"系统提示 / 自定义指令 / 规则文件"，就能用本 SKILL：

1. 克隆仓库到项目内。
2. 找到该工具的指令入口（system prompt / rules / instructions / custom prompt）。
3. 粘贴 `SKILL.md` 内容，或写一行引用指向它，并确保 `references/` 可被读取。

> **原理**：本 SKILL 是模型无关的纯提示词协议。任何能注入指令的宿主都能用——
> 只要 DeepSeek-V4-Pro / Xiaomi-MiMo-V2.5-Pro 等模型能读到这些 Markdown，即按协议行为。

---

## 支持的模型

本 SKILL 模型无关，已针对性适配众多**国产大模型**，也支持国际模型：

- **主推**：DeepSeek-V4-Pro、Xiaomi-MiMo-V2.5-Pro
- **国产**：DeepSeek-V3/R1、通义千问 Qwen3、智谱 GLM-4.6、月之暗面 Kimi K2、
  字节豆包 Doubao、腾讯混元 Hunyuan、百度文心 ERNIE 4.5、阶跃 Step-2、
  MiniMax M2、讯飞星火 Spark、零一万物 Yi 等
- **国际**：Claude、GPT、Gemini、Llama 等

完整清单与接入要点见 **[references/supported-models.md](./references/supported-models.md)**。

---

## 验证安装

发一条**故意写得乱、且需要推理或写代码**的消息，例如：

> "那个登录的 bug 帮我看下，慢的要死，用 py"

模型应表现出：

- [ ] **先理解 + 纠正**：还原语序（"帮我看下那个登录的 bug"）、补全省略、读出"慢"=性能诉求。
- [ ] **校准目标**：区分表层（看 bug）与真实目标（修复 + 提速），必要时澄清。
- [ ] **多元/深度推理**：多角度分析、下探根因，而非打补丁。
- [ ] **代码优化**：先读现有代码、再改、再验证；提示安全问题。
- [ ] **效率意识**：长对话中不乱改前文（护缓存）、信息精炼（提上下文使用率）。

全部命中即安装成功。

---

## 常见问题

**Q：文件夹一定要叫 `cognition-booster` 吗？**
A：建议如此，与 `SKILL.md` 的 `name` 字段对齐。部分宿主（如 Claude Code）要求目录名与 skill 名一致。

**Q：必须用 git 吗？**
A：不必。也可在 GitHub 页面点 `Code → Download ZIP` 下载解压后放到对应目录。

**Q：references/ 下的文件需要全部加载吗？**
A：不需要预加载。`SKILL.md` 是入口（含各协议摘要），细则按需读取——这正是为了优化上下文使用率。

**Q：对 DeepSeek-V4-Pro / Xiaomi-MiMo-V2.5-Pro 之外的模型有效吗？**
A：有效。协议是模型无关的，任何能加载自定义指令的模型/宿主都适用，只是本 SKILL 针对这两个模型做了表述优化。

---

许可证：见 [LICENSE](./LICENSE)。
