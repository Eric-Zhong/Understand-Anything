---
title: 仓库地图
formatter: yaml-frontmatter
id: IMPL-REPO-001
status: active
owner: engineering
updated: 2026-10-31
tags: [implementation, repository, reverse-engineering]
links: [[02-package-design|包与模块设计]], [[03-agent-pipeline|Agent 流水线]], [[../04-architecture/01-system-overview|系统总览]]
---

# 仓库地图

| 路径 | 责任 |
|---|---|
| `understand-anything-plugin/packages/core` | 类型、持久化、schema、搜索、解析器、增量和分析器 |
| `understand-anything-plugin/packages/dashboard` | React/Vite 图谱 UI、布局、主题、国际化和代码查看 |
| `understand-anything-plugin/packages/viewer` | 独立 viewer 打包、CLI 和发布资产 |
| `understand-anything-plugin/src` | chat/diff/explain/onboard 上下文与 prompt builder |
| `understand-anything-plugin/skills` | `/understand*` skill 定义、脚本、语言/框架知识 |
| `understand-anything-plugin/agents` | scanner、analyzer、reviewer、tour 等 Agent 定义 |
| `scripts` | benchmark 与大图生成工具 |
| `tests` | 根级 benchmark、hook、安装和 skill 测试 |
| `homepage` | Astro 产品主页和 demo |
| `.github/workflows` | CI 与 homepage 部署 |
| `install.sh`/`install.ps1` | Unix/Windows 多平台安装和升级 |

根 `package.json` 使用 `pnpm -r build`、Vitest 和 ESLint；插件有独立 workspace 和 lockfile。
