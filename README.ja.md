<!-- 言語: [English](./README.md) | [简体中文](./README.zh.md) | **日本語** -->

# Cognition Booster — 認知・対話最適化 SKILL

「理解優先 + 意図の校正 + 推論最適化 + コード最適化 + 記憶強化」のためのプロンプトプロトコルです。

- **対象モデル**：DeepSeek-V4-Pro、Xiaomi-MiMo-V2.5-Pro、および Qwen / GLM / Kimi / Doubao / ERNIE / Hunyuan などの[中国製 LLM](./references/supported-models.md)
- **対応ホスト**：Claude Code · Codex · Cursor · Windsurf · Cline / Roo Code · 任意の IDE / CLI
- **基本理念**：まずユーザーの本当の意図を理解し、真の目標に向けて推論し、より賢く・厳密で・実行可能な結果を出す。

> 📦 **ワンクリックインストール**（macOS / Linux）：
> ```bash
> curl -fsSL https://raw.githubusercontent.com/Hhz0823/DS-MIMO-Optimisation-SKILL/main/install.sh | bash
> ```
> **ワンクリックインストール**（Windows PowerShell）：
> ```powershell
> irm https://raw.githubusercontent.com/Hhz0823/DS-MIMO-Optimisation-SKILL/main/install.ps1 | iex
> ```
> 詳細な複数 IDE 向けガイド：**[INSTALL.md](./INSTALL.md)**（Codex と Claude Code を優先サポート）。インストーラは**グローバル** `~/.codex/AGENTS.md` を書き込むため、すべての Codex 会話で本 SKILL を呼び出せます。

## 主な機能

| 機能 | 説明 |
|---|---|
| 対話の訂正 | 段階的：誤字の暗黙修正 / 補足 / 誤った前提の必須訂正 / 曖昧なら確認。人ではなく事柄を正す |
| 表現の最適化 | 「より明確な言い方」を提示し、要望を言語化する手助けをする |
| 対話の連想補完 | 入力が不完全なとき、欠けた主語を回復し、省略を補い、言外の要求を推測する — 意図は変えず意味を補完 |
| 中国語の深い理解 | 倒置・成語・ことわざ・歇後語、省略と指示、語気と反語、ネットスラングを理解 |
| 対話の深い理解 | 会話履歴の活用、言外の意味と感情の読み取り、一貫性の修正、確認の好機を捉える |
| 理解優先 | 字面の解析 → 意図の校正 → 真の目標の確定 → 実行 |
| 目標設定 | 三層貫通（表層の要望 → 真の目標 → 深層の動機）を、測定可能で境界のある目標とマイルストーンに落とす |
| 多元的思考 | 第一原理 / 逆算 / 類推 / システム / ユーザー / 時間 / コストなど複数視点を切り替えて統合 |
| 論理の最適化 | 前提→推論→結論の連鎖を完全に、誤謬を点検、相関と因果を区別 |
| 深い思考 | 現象→メカニズム→根本原因→本質へ掘り下げ、5 Whys で根本へ |
| コード最適化 | 書く前に読む、最小十分、デフォルトで安全、検証可能、可読 |
| キャッシュヒット率 | 安定内容を前に、テンプレートを変数の前に、前文は書き換えず追記してプレフィックスキャッシュを守る |
| コンテキスト利用率 | 高い情報密度、貼付より参照、詳細はオンデマンド読込、末尾を随時整理 |
| 記憶強化 | 圧縮前に要点をスナップショット、圧縮後に再読込・突合し、逸脱を防ぐ |

## ファイル構成

```
cognition-booster/
├── SKILL.md         # メインエントリ：全体フロー + 各プロトコル要約
├── README.md        # 英語（デフォルト）
├── README.zh.md     # 简体中文
├── README.ja.md     # 本ファイル（日本語）
├── INSTALL.md       # 複数 IDE インストールガイド
├── install.sh       # ワンクリックインストーラ（macOS / Linux）
├── install.ps1      # ワンクリックインストーラ（Windows）
└── references/
    ├── dialogue-optimization.md   # 対話・表現の最適化 + 深い理解
    ├── dialogue-association.md    # 対話の連想補完（主語 / 省略 / 要求）
    ├── chinese-comprehension.md   # 中国語の深い理解（倒置/成語/省略/スラング）
    ├── goal-setting.md            # 目標設定
    ├── reasoning-optimization.md  # 推論（多元 / 論理 / 深さ）
    ├── coding-optimization.md     # コード最適化
    ├── context-memory.md          # コンテキスト圧縮と記憶
    ├── efficiency-optimization.md # 効率（キャッシュヒット率 / コンテキスト利用率）
    ├── supported-models.md        # 対応モデル（中国製 LLM 含む）
    └── installation.md            # 簡易インストール手順
```

## クイックスタート

1. `SKILL.md` でフローを確認：**解析 → 目標の校正 → 言い直し → 推論 → 実行 → 検証**。
2. **[INSTALL.md](./INSTALL.md)** に従って IDE / コードツール（Claude Code、Codex、Cursor、Windsurf、Cline など）へインストール。
3. 推論やコーディングが必要な「乱雑な」メッセージで動作を確認。

## ひと言で

> **言葉を読み、心を読み、目標を定め、それから始める。**
