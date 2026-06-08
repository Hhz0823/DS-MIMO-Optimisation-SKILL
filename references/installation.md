# 安装指南：Claude Code 与 Codex

本 SKILL 名为 `cognition-booster`，目录结构：

```
skill-1/
├── SKILL.md                          # 主入口
├── README.md                         # 总览
└── references/
    ├── dialogue-optimization.md      # 对话与表达优化
    ├── chinese-comprehension.md      # 中文深度理解（倒装/成语/省略/网络语）
    ├── goal-setting.md               # 目标化制定
    ├── reasoning-optimization.md     # 推理与思考优化（多元/逻辑/深度）
    ├── coding-optimization.md        # 代码编程优化
    ├── context-memory.md             # 上下文压缩与记忆强化
    ├── efficiency-optimization.md    # 效率优化（缓存命中率/上下文使用率）
    └── installation.md               # 本文件
```

> 提示：整个 `skill-1` 文件夹就是这个 SKILL。安装 = 把它放到宿主能识别的 skills 目录，
> 并确保文件夹名/SKILL.md 的 `name` 字段一致。建议把文件夹重命名为 `cognition-booster`
> 以与 `name` 对齐（部分宿主要求目录名与 skill 名一致）。

---

## A. 安装到 Claude Code

Claude Code 从以下位置发现 skills（任选其一）：

- **个人级（所有项目可用）**：`~/.claude/skills/`
  - Windows 实际路径：`C:\Users\<你的用户名>\.claude\skills\`
- **项目级（仅当前项目）**：`<项目根>/.claude/skills/`

安装步骤：

1. 把 `skill-1` 文件夹复制到上述目录，并重命名为 `cognition-booster`：

   Windows（bash）：
   ```bash
   cp -r "C:/Users/Koromi的天选/Desktop/skill-1" "C:/Users/Koromi的天选/.claude/skills/cognition-booster"
   ```

2. 确认结构为 `~/.claude/skills/cognition-booster/SKILL.md`。

3. 重启 / 重新打开 Claude Code，输入 `/` 应能看到或被自动发现该 skill。
   也可直接说"使用 cognition-booster"或描述相关任务触发。

4. 验证：发一句带错别字、需要多步推理的请求，观察模型是否先纠正、再校准目标、再推理。

---

## B. 安装到 Codex

Codex（OpenAI Codex CLI / IDE）通过项目内的指令文件加载自定义协议。常见做法：

### 方式 1：作为 AGENTS.md / 指令文件

1. 在项目根目录创建或编辑 `AGENTS.md`（Codex 会读取项目级 agent 指令）。
2. 把 `SKILL.md` 的内容追加进去，或用一行引用：

   ```markdown
   # 项目协议
   遵循 ./skills/cognition-booster/SKILL.md 中定义的认知增强协议，
   及其 references/ 下的全部子协议。
   ```

3. 把 `skill-1`（重命名为 `cognition-booster`）放到项目的 `./skills/` 目录下。

### 方式 2：作为自定义 prompt / 配置目录

1. 把整个 `cognition-booster` 文件夹放入 Codex 的 prompts/配置目录
   （如 `~/.codex/prompts/` 或项目内 `.codex/`，以你的 Codex 版本为准）。
2. 在会话开始时引用：`遵循 cognition-booster 协议`。

> 由于 Codex 各版本的目录约定可能不同，若上述路径不存在，
> 最稳妥的做法是把 `SKILL.md` 内容直接放进项目根的 `AGENTS.md`，Codex 会优先读取它。

---

## C. 通用验证清单

安装后，用一条"故意写得乱、且需要推理或写代码"的消息测试，确认模型会：

- [ ] 先复述/纠正你的话（理解字面 → 校准目标）
- [ ] 显式给出推理或方案权衡
- [ ] 写代码时先看现有代码、再写、再验证
- [ ] 长对话后能重新锚定关键信息

全部命中即安装成功。

---

## D. 目标模型说明

本 SKILL 是**模型无关的提示词协议**，对 DeepSeek-V4-Pro 与 Xiaomi-MiMo-V2.5-Pro
同样适用——只要宿主（Claude Code / Codex）把这些 Markdown 作为系统/项目指令加载，
对应模型即按协议行为。无需针对模型改代码，仅需确保指令被正确加载。
