<#
  Cognition Booster SKILL — 一键安装脚本 (Windows / PowerShell)
  用法:
    方式一（已克隆仓库，在仓库根目录运行）:  powershell -ExecutionPolicy Bypass -File install.ps1
    方式二（远程一键安装）:
      irm https://raw.githubusercontent.com/Hhz0823/DS-MIMO-Optimisation-SKILL/main/install.ps1 | iex

  可选参数:
    -Targets "claude,codex,cursor,windsurf,cline"   # 指定安装目标，默认全部
    -ProjectDir "C:\path\to\project"                 # 项目级安装目录
#>

param(
  [string]$Targets = "claude,codex,cursor,windsurf,cline",
  [string]$ProjectDir = (Get-Location).Path
)

$ErrorActionPreference = "Stop"
$Repo = "https://github.com/Hhz0823/DS-MIMO-Optimisation-SKILL.git"
$SkillName = "cognition-booster"

function Ok($m){ Write-Host "[OK] $m" -ForegroundColor Green }
function Info($m){ Write-Host "  -> $m" -ForegroundColor Cyan }
function Warn($m){ Write-Host "[!] $m" -ForegroundColor Yellow }
function Err($m){ Write-Host "[X] $m" -ForegroundColor Red }

# ---- 1. 定位 SKILL 源目录 ----
$Src = $null
if ((Test-Path "./SKILL.md") -and (Test-Path "./references")) {
  $Src = (Get-Location).Path
  Info "检测到本地仓库: $Src"
} else {
  if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    Err "未安装 git，无法自动下载。请先安装 git，或手动下载仓库后在其目录运行本脚本。"
    exit 1
  }
  $Tmp = Join-Path $env:TEMP ("cb-" + [guid]::NewGuid().ToString("N").Substring(0,8))
  Info "未在仓库内，正在克隆到临时目录 ..."
  git clone --depth 1 $Repo "$Tmp\repo" 2>$null | Out-Null
  $Src = "$Tmp\repo"
  Info "已克隆: $Src"
}

$TargetList = $Targets.Split(",") | ForEach-Object { $_.Trim().ToLower() }
$DidAny = $false

function Install-Files($dest) {
  New-Item -ItemType Directory -Force -Path "$dest\references" | Out-Null
  Copy-Item "$Src\SKILL.md"  $dest -Force -ErrorAction SilentlyContinue
  Copy-Item "$Src\README.md" $dest -Force -ErrorAction SilentlyContinue
  Copy-Item "$Src\INSTALL.md" $dest -Force -ErrorAction SilentlyContinue
  Copy-Item "$Src\references\*.md" "$dest\references" -Force -ErrorAction SilentlyContinue
}

# ---- 2. Claude Code ----
if ($TargetList -contains "claude") {
  $dest = "$env:USERPROFILE\.claude\skills\$SkillName"
  Install-Files $dest
  Ok "Claude Code  -> $dest"
  $DidAny = $true
}

# ---- 3. Codex ----
if ($TargetList -contains "codex") {
  $dest = "$env:USERPROFILE\.codex\prompts\$SkillName"
  Install-Files $dest
  $refLine = "遵循 $dest\SKILL.md 中的 Cognition Booster 认知增强协议及其 references/ 子协议。"

  # 3a. 全局 AGENTS.md —— 对所有 Codex 会话生效（全局对话可调用）
  $globalAgents = "$env:USERPROFILE\.codex\AGENTS.md"
  New-Item -ItemType Directory -Force -Path "$env:USERPROFILE\.codex" | Out-Null
  if ((Test-Path $globalAgents) -and (Select-String -Path $globalAgents -Pattern "Cognition Booster" -Quiet)) {
    Warn "Codex 全局   -> $globalAgents 已含引用，跳过"
  } else {
    Add-Content $globalAgents "# Cognition Booster (全局认知增强协议)`n$refLine"
    Ok "Codex 全局   -> 已写入 $globalAgents（所有会话生效）"
  }

  # 3b. 项目 AGENTS.md（可选）
  $agents = Join-Path $ProjectDir "AGENTS.md"
  if ($ProjectDir -ne $env:USERPROFILE) {
    if ((Test-Path $agents) -and (Select-String -Path $agents -Pattern "Cognition Booster" -Quiet)) {
      Warn "Codex 项目   -> $agents 已含引用，跳过"
    } elseif (Test-Path $agents) {
      Add-Content $agents "`n# Cognition Booster`n$refLine"
      Ok "Codex 项目   -> 已追加引用到 $agents"
    } else {
      Set-Content $agents "# 项目 Agent 协议`n`n# Cognition Booster`n$refLine"
      Ok "Codex 项目   -> 已创建 $agents 并写入引用"
    }
  }
  Ok "Codex prompts-> $dest"
  $DidAny = $true
}

# ---- 4. Cursor ----
if ($TargetList -contains "cursor") {
  $dest = "$ProjectDir\.cursor\rules\$SkillName"
  Install-Files $dest
  $mdc = "$ProjectDir\.cursor\rules\$SkillName.mdc"
  @"
---
description: Cognition Booster 认知增强协议
alwaysApply: true
---

遵循 ./$SkillName/SKILL.md 及其 references/ 下全部子协议：
理解前置、目标化制定、多元化与深度推理、代码优化、缓存与上下文效率优化。
"@ | Set-Content $mdc
  Ok "Cursor       -> $mdc"
  $DidAny = $true
}

# ---- 5. Windsurf ----
if ($TargetList -contains "windsurf") {
  $dest = "$ProjectDir\.windsurf-skill\$SkillName"
  Install-Files $dest
  $rules = "$ProjectDir\.windsurfrules"
  if (-not (Test-Path $rules) -or -not (Select-String -Path $rules -Pattern "Cognition Booster" -Quiet)) {
    Add-Content $rules "`n# Cognition Booster`n遵循 ./.windsurf-skill/$SkillName/SKILL.md 及其 references/ 子协议。"
  }
  Ok "Windsurf     -> $rules + $dest"
  $DidAny = $true
}

# ---- 6. Cline / Roo Code ----
if ($TargetList -contains "cline") {
  $dest = "$ProjectDir\.cline-skill\$SkillName"
  Install-Files $dest
  Copy-Item "$Src\SKILL.md" "$ProjectDir\.clinerules" -Force -ErrorAction SilentlyContinue
  Ok "Cline/Roo    -> $ProjectDir\.clinerules + $dest"
  $DidAny = $true
}

Write-Host ""
if ($DidAny) {
  Ok "安装完成！"
  Info "验证：发一条写得乱、需要推理或写代码的消息，看模型是否先理解纠正→校准目标→深度推理→代码优化。"
  Warn "提示：Claude Code 需重启；Codex/Cursor 等在项目内自动加载规则文件。"
} else {
  Err "未选择任何安装目标。请用 -Targets 指定，例如 -Targets `"claude,codex`"。"
}

