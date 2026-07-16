# Codex Theme Studio · 项目记录

> 本地归档说明。面向维护者，不是用户安装手册。  
> 仓库首页：[`../README.md`](../README.md)（中文）· [`../README.en.md`](../README.en.md)（English）

---

## 1. 它是什么

**Codex Theme Studio** 是给 **OpenAI Codex 桌面端** 用的**外部主题 / 换肤**方案：

- 本机 **CDP** 注入 CSS + 装饰 DOM
- **不修改**官方 `.app` / `app.asar` / WindowsApps / 代码签名
- 侧栏、建议卡、项目选择、输入框仍是**原生可点控件**（不是整窗假截图）
- 可换图、可一键恢复
- **不会**静默改写 API Key / Base URL（换肤与中转配置分开）

非 OpenAI 官方产品。

---

## 2. 来源与时间线（简）

| 阶段 | 说明 |
|------|------|
| 素材包 | 微信传播的 Win / Mac 皮肤包（RAR/ZIP），含注入脚本与主题资源 |
| 安全审 | 核对是否改 asar、是否静默劫持 API；结论：以本机 CDP 注入为主，开源时明确禁止静默中转劫持 |
| 整理开源 | 按平台拆成 `macos/`、`windows/`，补 README 安装入口 |
| 本地美化 | Mac 本机引擎装在 `~/.codex/codex-theme-studio`；CSS 走浅色壳 |
| i18n | 默认中文 `README.md`，英文 `README.en.md`，顶部互链 |

---

## 3. 架构（两边相同）

```text
用户本机主题工具（本仓库脚本 / 已安装引擎）
    │  启动官方 Codex + 本机 CDP（127.0.0.1）
    ▼
官方 Codex Desktop（不改 asar / 签名）
    │  注入 CSS + 装饰 DOM
    ▼
原生侧栏 / 输入框 / 建议卡 + 主题外观
```

更细的平台路径见 [`platforms.md`](./platforms.md)。

---

## 4. 仓库结构

```text
Codex-Theme-Studio/
├── README.md              # 默认中文
├── README.en.md           # English
├── docs/
│   ├── PROJECT.md         # 本文件（项目记录）
│   ├── platforms.md       # Win/Mac 路径与能力矩阵
│   └── images/
├── macos/                 # Mac 脚本、资源、LICENSE、SKILL
└── windows/               # Windows PowerShell / 注入脚本
```

**安装后的运行位置（Mac，与仓库分离）：**

| 用途 | 路径 |
|------|------|
| 引擎 | `~/.codex/codex-theme-studio` |
| 状态 / 主题 | `~/Library/Application Support/CodexThemeStudio` |
| 桌面启动器 | `~/Desktop/Codex Theme Studio*.command` → 指向上面的引擎脚本 |

Windows 状态目录见 `platforms.md`（`%LOCALAPPDATA%\CodexThemeStudio`）。

---

## 5. 安全与合规边界

1. CDP **仅** `127.0.0.1`，主题运行期勿跑来路不明的本机程序  
2. 不改官方安装目录与签名  
3. **禁止**安装脚本静默写入第三方 Base URL / Key  
4. 效果图含人物 / IP 时仅作主题示意；商用再分发需自行确认肖像与商标  

---

## 6. 常用维护动作

| 动作 | 说明 |
|------|------|
| 改赞助文案 | 同时改 `README.md` 与 `README.en.md` |
| 发版推送 | 在本仓库目录 `git add` → `commit` → `push origin main` |
| Mac 本机主题 | 改 `~/.codex/codex-theme-studio` 的 CSS/inject；与 GitHub 源码可不同步，属本机实验位 |

---

## 7. 相关但不在本仓

| 项 | 说明 |
|----|------|
| 本机已装引擎 | `~/.codex/codex-theme-studio` |

---

*最后更新：随仓库提交维护。有架构变更时优先改本文件与 `platforms.md`。*