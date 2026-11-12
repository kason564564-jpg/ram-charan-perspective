#!/usr/bin/env node
// 从 SKILL.md 生成各主流智能体可直接使用的格式，输出到 dist/。
// 用法: node scripts/build-adapters.mjs
import { readFileSync, writeFileSync, mkdirSync, rmSync } from "node:fs";
import { dirname, join } from "node:path";
import { fileURLToPath } from "node:url";

const root = join(dirname(fileURLToPath(import.meta.url)), "..");
const raw = readFileSync(join(root, "SKILL.md"), "utf8");
const fm = raw.match(/^---\r?\n([\s\S]*?)\r?\n---\r?\n/);
if (!fm) throw new Error("SKILL.md 缺少 YAML frontmatter");
const body = raw.slice(fm[0].length).trim();
const description = (fm[1].match(/description:\s*\|?\s*([\s\S]*?)(?=\n\w|$)/) || [, ""])[1]
  .split(/\r?\n/).map(s => s.trim()).filter(Boolean).join(" ")
  .replace(/"/g, '\\"');

const HEAD = "拉姆·查兰（Ram Charan）思维框架";
const targets = [
  ["cursor/ram-charan.mdc", `---
description: ${description}
globs:
alwaysApply: false
---

# ${HEAD}

`],
  ["windsurf/ram-charan.md", `---
description: ${HEAD}
trigger: model_decision
---

# ${HEAD}

`],
  ["cline/ram-charan.md", `# ${HEAD}

`],
  ["roo/rules/ram-charan.md", `# ${HEAD}

`],
  ["copilot/copilot-instructions.md", `# ${HEAD}

`],
  ["gemini/GEMINI.md", `# ${HEAD}

`],
  ["continue/ram-charan.md", `---
name: ${HEAD}
description: ${description}
---

`],
  ["agents-md/AGENTS.md", `# 全局指令（追加到你的 AGENTS.md）

`],
  ["universal/SYSTEM-PROMPT.md", `# 通用系统提示词（ChatGPT / Kimi / 豆包 / 通用 Agent）

把这整段贴进「自定义指令」「项目指令」或系统提示词即可。

`],
];

rmSync(join(root, "dist"), { recursive: true, force: true });
const made = [];
for (const [rel, header] of targets) {
  const out = join(root, "dist", rel);
  mkdirSync(dirname(out), { recursive: true });
  writeFileSync(out, header + body + "\n", "utf8");
  made.push(rel);
}

// Claude Code / DSH 直接读 SKILL.md，无需转换，放一份软链接说明
mkdirSync(join(root, "dist", "claude-code"), { recursive: true });
writeFileSync(join(root, "dist", "claude-code", "README.md"),
  "Claude Code 与 DeepSeek Harness 直接使用仓库根目录的 SKILL.md，无需转换：\n" +
  "把整个 ram-charan-perspective 目录复制到 ~/.claude/skills/ 或 ~/.dsh/skills/ 即可。\n", "utf8");

console.log("生成 " + made.length + " 个适配文件：");
for (const m of made) console.log("  dist/" + m);
