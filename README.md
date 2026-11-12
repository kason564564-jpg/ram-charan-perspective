# 拉姆·查兰思维框架 · Ram Charan Perspective

> 一套可运行的「查兰式」认知操作系统。把拉姆·查兰（Ram Charan）九部管理经典蒸馏成一份 `SKILL.md`，任何支持 Skill / 自定义指令的 AI Agent 装上就能用。

**一句话**：它不背金句，它用查兰的镜片看你的生意——先把商业算术摆出来，再问三件事：钱怎么赚、人够不够、机制转不转。

---

## 这是什么

| | |
|---|---|
| 输入 | 九本书约 125 万字符原文（《执行》《求胜于未知》《持续增长》《CEO说》《客户说》《游戏颠覆者》《人才管理大师》《高潜》《开启转型》） |
| 输出 | 1 份 `SKILL.md`（约 370 行）：7 个心智模型 + 16 条决策启发式 + 表达 DNA + 8 维研究工作流 + 6 对内在张力 + 8 条诚实边界 |
| 用途 | 业务诊断、战略审视、人才评估、执行落地、并购判断 |
| 形态 | 纯 Markdown，无依赖、无网络、无 API Key |

## 安装

```bash
git clone https://github.com/kason564564-jpg/ram-charan-perspective.git
```

### 一键安装（Claude Code + DeepSeek Harness）

```bash
# macOS / Linux
bash scripts/install.sh --all
```

```powershell
# Windows
powershell -ExecutionPolicy Bypass -File .\scripts\install.ps1
```

### 主流智能体安装对照表

| 智能体 | 装法 | 落地位置 |
|---|---|---|
| **Claude Code** | 脚本自动 / 手动复制 | `~/.claude/skills/ram-charan-perspective/`，或项目内 `.claude/skills/` |
| **DeepSeek Harness (DSH)** | 脚本自动 / 手动复制 | `~/.dsh/skills/ram-charan-perspective/` |
| **OpenAI Codex CLI** | 追加指令 | `~/.codex/AGENTS.md` 或项目根 `AGENTS.md` ← `dist/agents-md/AGENTS.md` |
| **Cursor** | 项目规则 | `.cursor/rules/ram-charan.mdc` |
| **Windsurf** | 项目规则 | `.windsurf/rules/ram-charan.md` |
| **Cline** | 项目规则 | `.clinerules/ram-charan.md` |
| **Roo Code** | 项目规则 | `.roo/rules/ram-charan.md` |
| **GitHub Copilot** | 仓库指令 | `.github/copilot-instructions.md` |
| **Gemini CLI** | 上下文文件 | 项目根 `GEMINI.md` |
| **Continue** | 项目规则 | `.continue/rules/ram-charan.md` |
| **ChatGPT / Kimi / 豆包 / 通用** | 粘贴 | `dist/universal/SYSTEM-PROMPT.md` 贴进「自定义指令」或系统提示词 |

所有格式都由 `SKILL.md` 单一源生成，不手抄：

```bash
node scripts/build-adapters.mjs   # 重新生成 dist/
```

**项目级安装示例（Cursor）**
```bash
mkdir -p .cursor/rules
cp dist/cursor/ram-charan.mdc .cursor/rules/
```

> 规则：目录名保持 `ram-charan-perspective`，`SKILL.md` 在该目录根部——这是 Claude Code / DSH 自动发现的条件。

## 怎么用

装上之后，直接用自然语言点名：

- 「用拉姆·查兰的视角看我们这个区域连续三年利润下滑」
- 「查兰会怎么看这次并购」
- 「切换到查兰，帮我判断这个人是不是高潜」
- 「如果查兰坐在我位置上，这周先做哪三件事」

它不会对一般性管理问题自动触发——不点名就不抢戏。

## 七个心智模型

| # | 模型 | 一句话 |
|---|---|---|
| M1 | 商业算术 | 一切生意最后都收敛到同一组数：收入 = 单价 × 销量、现金、利润、周转、增长、客户。听不懂算术的人做不了 CEO。 |
| M2 | 执行三流程 | 执行不是「更努力」，是人员、战略、运营三条流程咬合；任何一条空转，另外两条都白干。 |
| M3 | 结构性 vs 经营性不确定性 | 先分清是「周期/模式变了」还是「我们自己没做好」，两者的处方完全不同。 |
| M4 | 人先于数字 | 数字是人的结果。先看关键岗位上坐着谁、他知不知道真话，再看报表。 |
| M5 | 机制大于意愿 | 不靠号召靠机制：会议、对话、跟进、考核、奖惩，把正确的事变成默认动作。 |
| M6 | 现实高于希望 | 一把手的第一职责是定义现实；组织里没人敢说的那个事实，就是最贵的资产。 |
| M7 | 增长颗粒 | 增长是细节的复利：客户分层、单品、单店、单条线路，颗粒度决定能不能落地。 |

## 回答工作流（Agentic Protocol）

遇到需要事实的问题，它不会凭训练语料编——先按八个维度做功课，再开口：

商业算术 → 外部环境 → 客户经济学 → 人与组织 → 机制 → 执行能力 → 现实检验 → 增长颗粒

八维逐条对应上面七个模型，输出时案例必须带书名 + 页码，或者明说「这是我按框架推的」。

## 目录结构

```
ram-charan-perspective/
├── SKILL.md                      # 唯一源文件，Claude Code / DSH 直接读它
├── README.md
├── LICENSE
├── scripts/
│   ├── build-adapters.mjs        # 由 SKILL.md 生成 9 种宿主格式
│   ├── install.sh                # macOS / Linux 一键安装
│   └── install.ps1               # Windows 一键安装
├── dist/                         # 生成物，各宿主即取即用
│   ├── cursor/  windsurf/  cline/  roo/
│   ├── copilot/  gemini/  continue/
│   ├── agents-md/AGENTS.md       # Codex CLI / OpenCode / 任何 AGENTS.md 宿主
│   └── universal/SYSTEM-PROMPT.md
└── references/
    └── research/                 # 六维调研笔记（提炼留痕，非原著正文）
        ├── 01-writings.md        # 著作与系统思考
        ├── 02-conversations.md   # 对话与即兴思考
        ├── 03-expression-dna.md  # 表达风格 DNA
        ├── 04-external-views.md  # 他者视角与批评
        ├── 05-decisions.md       # 决策记录
        └── 06-timeline.md        # 人物时间线
```

## 已知边界（诚实说明）

1. **外部视角薄弱**：公开检索被同名印度电影演员严重污染，传记/批评材料未能充分交叉验证。
2. **只覆盖九本书**：书里没写过的主题（如 AI 原生组织、平台经济）只能按框架推，Skill 被要求明确标注「推断」而非原话。
3. **不是查兰本人**：不能替代他的直觉、现场判断与几十年经验。
4. **非盲测**：行为测试由读过技能的模型执行，规则可执行性已验证，但不能等同于独立盲评。
5. **书的时效**：案例多截至各书出版年份，具体公司与数字请自行核对当下事实。

## 版权与来源

- 九本书的著作权归拉姆·查兰及各位合著者、原出版社所有。本仓库**不包含**原著正文，仅包含阅读后的结构化提炼与少量用于定位的短引文。
- 本仓库的提炼文本、结构与提示词采用 **MIT License**（见 `LICENSE`）。
- 如果你要商用二次分发，建议自行复核引文合规；如权利人提出异议，会配合下架相关段落。

## 参与

发现模型不准、启发式失灵、案例页码错，直接开 Issue，附上你的反例。**反例比赞美有用。**

---

<sub>由 [女娲 · Skill造人术](https://github.com/alchaincyf/nuwa-skill) 流程生成 · 蒸馏执行：DSH Agent</sub>
