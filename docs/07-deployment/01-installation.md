---
title: 安装部署
formatter: yaml-frontmatter
id: DEP-INST-001
status: active
owner: release-maintainers
updated: 2026-10-31
tags: [deployment, installation, onboarding]
links: [[02-ci-cd|CI/CD]], [[../05-implementation/04-platform-adapters|平台适配]], [[../08-operations/02-troubleshooting|故障排查]]
---

# 安装部署

## 开发环境

Node.js >= 22（开发环境使用 v24）、pnpm >= 10。执行 `pnpm install`；构建 core/skill/dashboard/viewer 使用各包脚本或根 `pnpm build`。本地 dashboard 使用 `pnpm dev:dashboard`。

## 平台安装

Claude Code 使用 marketplace；其他平台使用 `install.sh` 或 Windows `install.ps1`，脚本负责 clone/update 仓库和创建平台入口。安装后重启 CLI/IDE，使 skill 和 agent 被重新发现。

## Viewer

viewer 用已提交图谱和 dashboard 构建产物运行，不依赖 Claude Code。发布资产固定名为 `understand-anything-viewer.tgz`，README 的 latest release URL 依赖该名称。

部署前检查版本文件同步、lockfile、构建结果、图谱路径和 release 资产。
