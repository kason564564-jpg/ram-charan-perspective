# 拉姆·查兰思维框架 · Windows 安装
# 用法: powershell -ExecutionPolicy Bypass -File .\scripts\install.ps1 [-All]
param([switch]$All)
$ErrorActionPreference = "Stop"
$Src  = Split-Path -Parent $PSScriptRoot
$Name = "ram-charan-perspective"

function Install-To([string]$Root, [string]$Kind) {
  $base = if ($Kind -eq "dsh") { Join-Path $Root ".dsh\skills" } else { Join-Path $Root ".claude\skills" }
  $dest = Join-Path $base $Name
  New-Item -ItemType Directory -Force -Path $base | Out-Null
  if (Test-Path $dest) { Remove-Item -Recurse -Force $dest }
  Copy-Item -Recurse -Force $Src $dest
  Remove-Item -Recurse -Force (Join-Path $dest ".git") -ErrorAction SilentlyContinue
  Write-Host "OK  $dest"
}

Install-To $env:USERPROFILE "claude"
Install-To $env:USERPROFILE "dsh"

Write-Host ""
Write-Host "项目级安装（可选）："
Write-Host "  Cursor     : New-Item -ItemType Directory -Force .cursor\rules; Copy-Item \"$Src\dist\cursor\ram-charan.mdc\" .cursor\rules\"
Write-Host "  Windsurf   : Copy-Item \"$Src\dist\windsurf\ram-charan.md\" .windsurf\rules\"
Write-Host "  Cline      : Copy-Item \"$Src\dist\cline\ram-charan.md\" .clinerules\"
Write-Host "  Copilot    : Copy-Item \"$Src\dist\copilot\copilot-instructions.md\" .github\"
Write-Host "  Gemini CLI : Copy-Item \"$Src\dist\gemini\GEMINI.md\" .\GEMINI.md"
Write-Host "  Codex/通用 : 追加 dist\agents-md\AGENTS.md 到 AGENTS.md"
Write-Host "  ChatGPT 等 : 粘贴 dist\universal\SYSTEM-PROMPT.md"
