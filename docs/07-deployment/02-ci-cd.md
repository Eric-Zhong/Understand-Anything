---
title: CI/CD 流程
formatter: yaml-frontmatter
id: DEP-CICD-001
status: active
owner: release-maintainers
updated: 2026-10-31
tags: [deployment, ci, github-actions]
links: [[01-installation|安装部署]], [[03-release-and-rollback|发布与回滚]], [[../06-testing/01-test-strategy|测试策略]]
---

# CI/CD 流程

`.github/workflows/ci.yml` 在 pull request 和 main push 触发，Ubuntu/Windows 矩阵运行：checkout、pnpm、Python、Node 22、依赖安装、lint、core build、skill build、viewer build、core test、根 Vitest 和 Python unittest。并发组会取消同一 ref 的旧运行。

`.github/workflows/deploy-homepage.yml` 负责 homepage 部署，属于独立交付链路。CI 不等于生产托管平台；viewer release 和版本上传仍需按发布流程执行。

分支策略：功能变更走 PR；main 的绿色状态依赖 CI；develop 用于集成和本地同步，发布前应从 CI 产物与版本文件复核。
