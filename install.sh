#!/usr/bin/env bash
# Cognition Booster SKILL — 一键安装脚本 (macOS / Linux)
# 用法:
#   方式一（已克隆仓库，在仓库根目录运行）:  bash install.sh
#   方式二（远程一键安装）:
#     curl -fsSL https://raw.githubusercontent.com/Hhz0823/DS-MIMO-Optimisation-SKILL/main/install.sh | bash
#
# 可选环境变量:
#   TARGETS="claude codex cursor windsurf cline"   # 指定安装目标，默认全部检测
#   PROJECT_DIR="/path/to/project"                  # 项目级安装目录（codex/cursor/windsurf/cline 用）

set -euo pipefail

REPO="https://github.com/Hhz0823/DS-MIMO-Optimisation-SKILL.git"
SKILL_NAME="cognition-booster"
RAW_BASE="https://raw.githubusercontent.com/Hhz0823/DS-MIMO-Optimisation-SKILL/main"

c_green() { printf '\033[32m%s\033[0m\n' "$1"; }
c_blue()  { printf '\033[36m%s\033[0m\n' "$1"; }
c_yellow(){ printf '\033[33m%s\033[0m\n' "$1"; }
c_red()   { printf '\033[31m%s\033[0m\n' "$1"; }

# ---- 1. 定位 SKILL 源目录（本地或克隆） ----
SRC=""
if [ -f "./SKILL.md" ] && [ -d "./references" ]; then
  SRC="$(pwd)"
  c_blue "✓ 检测到本地仓库: $SRC"
else
  TMP="$(mktemp -d)"
  c_blue "→ 未在仓库内，正在克隆到临时目录 ..."
  if command -v git >/dev/null 2>&1; then
    git clone --depth 1 "$REPO" "$TMP/repo" >/dev/null 2>&1
    SRC="$TMP/repo"
  else
    c_red "✗ 未安装 git，无法自动下载。请先安装 git，或手动下载仓库后在其目录运行本脚本。"
    exit 1
  fi
  c_blue "✓ 已克隆: $SRC"
fi

PROJECT_DIR="${PROJECT_DIR:-$(pwd)}"
TARGETS="${TARGETS:-claude codex cursor windsurf cline}"

install_files() {  # $1 = 目标目录
  mkdir -p "$1/references"
  cp "$SRC/SKILL.md" "$1/" 2>/dev/null || true
  cp "$SRC/README.md" "$1/" 2>/dev/null || true
  cp "$SRC/INSTALL.md" "$1/" 2>/dev/null || true
  cp "$SRC"/references/*.md "$1/references/" 2>/dev/null || true
}

did_any=false

# ---- 2. Claude Code（个人级 skills 目录） ----
if echo "$TARGETS" | grep -qw claude; then
  DEST="$HOME/.claude/skills/$SKILL_NAME"
  install_files "$DEST"
  c_green "✓ Claude Code  → $DEST"
  did_any=true
fi

# ---- 3. Codex（全局 AGENTS.md + 全局 prompts + 项目 AGENTS.md） ----
if echo "$TARGETS" | grep -qw codex; then
  DEST="$HOME/.codex/prompts/$SKILL_NAME"
  install_files "$DEST"
  REF_LINE="遵循 $DEST/SKILL.md 中的 Cognition Booster 认知增强协议及其 references/ 子协议。"

  # 3a. 全局 AGENTS.md —— 对所有 Codex 会话生效（全局对话可调用）
  GLOBAL_AGENTS="$HOME/.codex/AGENTS.md"
  mkdir -p "$HOME/.codex"
  if grep -q "Cognition Booster" "$GLOBAL_AGENTS" 2>/dev/null; then
    c_yellow "• Codex 全局   → $GLOBAL_AGENTS 已含引用，跳过"
  else
    printf '# Cognition Booster (全局认知增强协议)\n%s\n' "$REF_LINE" >> "$GLOBAL_AGENTS"
    c_green "✓ Codex 全局   → 已写入 $GLOBAL_AGENTS（所有会话生效）"
  fi

  # 3b. 项目 AGENTS.md（可选，项目级覆盖/补充）
  AGENTS="$PROJECT_DIR/AGENTS.md"
  if [ "$PROJECT_DIR" != "$HOME" ]; then
    if grep -q "Cognition Booster" "$AGENTS" 2>/dev/null; then
      c_yellow "• Codex 项目   → $AGENTS 已含引用，跳过"
    elif [ -f "$AGENTS" ]; then
      printf '\n# Cognition Booster\n%s\n' "$REF_LINE" >> "$AGENTS"
      c_green "✓ Codex 项目   → 已追加引用到 $AGENTS"
    else
      printf '# 项目 Agent 协议\n\n# Cognition Booster\n%s\n' "$REF_LINE" > "$AGENTS"
      c_green "✓ Codex 项目   → 已创建 $AGENTS 并写入引用"
    fi
  fi
  c_green "✓ Codex prompts→ $DEST"
  did_any=true
fi

# ---- 4. Cursor（项目级 .cursor/rules） ----
if echo "$TARGETS" | grep -qw cursor; then
  DEST="$PROJECT_DIR/.cursor/rules/$SKILL_NAME"
  install_files "$DEST"
  MDC="$PROJECT_DIR/.cursor/rules/$SKILL_NAME.mdc"
  cat > "$MDC" <<EOF
---
description: Cognition Booster 认知增强协议
alwaysApply: true
---

遵循 ./$SKILL_NAME/SKILL.md 及其 references/ 下全部子协议：
理解前置、目标化制定、多元化与深度推理、代码优化、缓存与上下文效率优化。
EOF
  c_green "✓ Cursor       → $MDC"
  did_any=true
fi

# ---- 5. Windsurf（项目级 .windsurfrules + 文件） ----
if echo "$TARGETS" | grep -qw windsurf; then
  DEST="$PROJECT_DIR/.windsurf-skill/$SKILL_NAME"
  install_files "$DEST"
  RULES="$PROJECT_DIR/.windsurfrules"
  if ! grep -q "Cognition Booster" "$RULES" 2>/dev/null; then
    printf '\n# Cognition Booster\n遵循 ./.windsurf-skill/%s/SKILL.md 及其 references/ 子协议。\n' "$SKILL_NAME" >> "$RULES"
  fi
  c_green "✓ Windsurf     → $RULES + $DEST"
  did_any=true
fi

# ---- 6. Cline / Roo Code（项目级 .clinerules） ----
if echo "$TARGETS" | grep -qw cline; then
  DEST="$PROJECT_DIR/.cline-skill/$SKILL_NAME"
  install_files "$DEST"
  cp "$SRC/SKILL.md" "$PROJECT_DIR/.clinerules" 2>/dev/null || true
  c_green "✓ Cline/Roo    → $PROJECT_DIR/.clinerules + $DEST"
  did_any=true
fi

echo ""
if $did_any; then
  c_green "🎉 安装完成！"
  c_blue  "验证：发一条写得乱、需要推理或写代码的消息，看模型是否先理解纠正→校准目标→深度推理→代码优化。"
  c_yellow "提示：Claude Code 需重启；Codex/Cursor 等在项目内自动加载规则文件。"
else
  c_red "未选择任何安装目标。请设置 TARGETS 环境变量，例如 TARGETS=\"claude codex\"。"
fi
