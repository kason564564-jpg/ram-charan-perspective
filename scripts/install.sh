#!/usr/bin/env bash
# 拉姆·查兰思维框架 · 一键安装
# 用法: ./scripts/install.sh [--claude] [--dsh] [--all]
set -euo pipefail
SRC="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
NAME="ram-charan-perspective"
want_claude=0; want_dsh=0
for a in "$@"; do
  case "$a" in
    --claude) want_claude=1;;
    --dsh) want_dsh=1;;
    --all) want_claude=1; want_dsh=1;;
    *) echo "未知参数: $a"; exit 1;;
  esac
done
if [ $want_claude -eq 0 ] && [ $want_dsh -eq 0 ]; then want_claude=1; want_dsh=1; fi

install_to() {
  local target="$1/.claude/skills" ; [ "$2" = dsh ] && target="$1/.dsh/skills"
  mkdir -p "$target"
  rm -rf "$target/$NAME"
  cp -R "$SRC" "$target/$NAME"
  rm -rf "$target/$NAME/.git"
  echo "OK  $target/$NAME"
}

if [ $want_claude -eq 1 ]; then install_to "$HOME" claude; fi
if [ $want_dsh -eq 1 ]; then install_to "$HOME" dsh; fi

echo
echo "项目级安装（可选，把规则文件放进你的仓库）："
echo "  Cursor        -> mkdir -p .cursor/rules && cp \"$SRC/dist/cursor/ram-charan.mdc\" .cursor/rules/"
echo "  Windsurf      -> mkdir -p .windsurf/rules && cp \"$SRC/dist/windsurf/ram-charan.md\" .windsurf/rules/"
echo "  Cline         -> mkdir -p .clinerules && cp \"$SRC/dist/cline/ram-charan.md\" .clinerules/"
echo "  Copilot       -> mkdir -p .github && cp \"$SRC/dist/copilot/copilot-instructions.md\" .github/"
echo "  Gemini CLI    -> cp \"$SRC/dist/gemini/GEMINI.md\" ./GEMINI.md"
echo "  Codex / 通用  -> 把 dist/agents-md/AGENTS.md 内容追加到 AGENTS.md"
echo "  ChatGPT 等    -> 粘贴 dist/universal/SYSTEM-PROMPT.md"
echo
echo "装完在会话里说：用拉姆·查兰的视角看看这件事"
