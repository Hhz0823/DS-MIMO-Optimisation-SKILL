# Cognition Booster — 增强型认知与对话优化 SKILL

一套"思考前置 + 表达校准 + 推理优化 + 代码优化 + 记忆强化"的提示词协议。

- **目标模型**：DeepSeek-V4-Pro、Xiaomi-MiMo-V2.5-Pro，及通义千问 / 智谱 GLM / Kimi / 豆包 / 文心 / 混元等[国产大模型](./references/supported-models.md)
- **支持宿主**：Claude Code · Codex · Cursor · Windsurf · Cline / Roo Code · 通用 IDE / CLI
- **核心理念**：先读懂人话，再围绕真实目标思考，输出更聪明、更严谨、更可执行的结果。

> 📦 **一键安装**（macOS / Linux）：
> ```bash
> curl -fsSL https://raw.githubusercontent.com/Hhz0823/DS-MIMO-Optimisation-SKILL/main/install.sh | bash
> ```
> **一键安装**（Windows PowerShell）：
> ```powershell
> irm https://raw.githubusercontent.com/Hhz0823/DS-MIMO-Optimisation-SKILL/main/install.ps1 | iex
> ```
> 完整多 IDE 安装指南见 **[INSTALL.md](./INSTALL.md)**（重点支持 Codex 与 Claude Code）。

## 它能做什么

| 能力 | 说明 |
|---|---|
| 对话纠正 | 分级纠正：静默笔误 / 顺带点明 / 必须纠正错误前提 / 有分歧先问，对事不对人 |
| 表达优化 | 主动给一版"更清晰的说法"，帮用户把诉求讲明白 |
| 对话联想补全 | 话不完整时找回主语、补全省略内容、联想没说出口的隐含要求，补意思不改诉求 |
| 中文深度理解 | 听懂倒装句、成语俗语歇后语、省略指代、语气反话、网络用语 |
| 对话深度理解 | 利用对话历史、读出言外之意与情绪、一致性纠偏、把握澄清时机 |
| 理解前置 | 先解析字面 → 再校准意图 → 锁定真实目标，最后才动手 |
| 目标化制定 | 表层诉求→真实目标→深层动机三层穿透，落成可衡量、有边界的目标与里程碑 |
| 多元化思考 | 切换第一性原理/逆向/类比/系统/用户/时间/成本等多视角再综合 |
| 逻辑思考优化 | 前提→推导→结论链条完整，查逻辑谬误，区分相关与因果 |
| 深度思考增强 | 现象→机制→根因→本质逐层下探，5 Whys 触及根本原因 |
| 代码优化 | 先读后写、最小充分、安全默认、可验证、可读 |
| 缓存命中率 | 稳定内容在前、模板前置变量后置、前文只追加不改写，护住 prompt 前缀缓存 |
| 上下文使用率 | 信息高密度、引用代替粘贴、细则按需加载、末尾及时精简 |
| 记忆强化 | 上下文压缩前提炼快照，压缩后重读并对照复核，防跑偏 |

## 文件结构

```
cognition-booster/   (文件夹，即本 skill；当前名为 skill-1)
├── SKILL.md         # 主入口，总流程与各协议摘要
├── README.md        # 本文件
├── INSTALL.md       # 多 IDE 安装指南
├── install.sh       # 一键安装脚本（macOS / Linux）
├── install.ps1      # 一键安装脚本（Windows）
└── references/
    ├── dialogue-optimization.md   # 对话与表达优化 + 对话深度理解
    ├── dialogue-association.md     # 对话联想与补全（找主语/补内容/联想要求）
    ├── chinese-comprehension.md   # 中文深度理解（倒装/成语/省略/网络语）
    ├── goal-setting.md            # 目标化制定
    ├── reasoning-optimization.md  # 推理与思考优化（多元/逻辑/深度）
    ├── coding-optimization.md     # 代码编程优化
    ├── context-memory.md          # 上下文压缩与记忆强化
    ├── efficiency-optimization.md # 效率优化（缓存命中率/上下文使用率）
    ├── supported-models.md        # 支持的模型（含国产大模型清单）
    └── installation.md            # 简版安装说明
```

## 快速开始

1. 阅读 `SKILL.md` 了解总流程：**解析 → 校准目标 → 重述 → 思考 → 执行 → 自检**。
2. 按 **[INSTALL.md](./INSTALL.md)** 安装到你的 IDE / code 工具（Claude Code、Codex、Cursor、Windsurf、Cline 等）。
3. 用一条"写得乱、需要推理或写代码"的消息测试效果。

## 一句话口诀

> **先读字，再读心，定目标，后开工。**
