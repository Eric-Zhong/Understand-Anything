---
title: 架构鸟瞰
formatter: yaml-frontmatter
id: LEARN-ARCH-001
status: active
owner: architecture
updated: 2026-11-05
tags: [learning, architecture, layers]
links: [[02-project-in-one-page|一页看懂项目]], [[04-runtime-story|运行时故事]], [[../04-architecture/01-system-overview|系统总览]]
---

# 架构鸟瞰

## 五层结构

| 层 | 解决的问题 | 仓库位置 |
|---|---|---|
| 入口与分发 | 用户怎样安装、调用和启动 | `install.sh`、platform manifests、`skills` |
| 任务编排 | 一次任务需要哪些步骤和上下文 | `agents`、plugin `src`、skill scripts |
| 分析引擎 | 怎样解析、建图、搜索和增量更新 | `packages/core` |
| 展示与交互 | 怎样浏览、筛选、布局和解释图谱 | `packages/dashboard` |
| 交付与验证 | 怎样构建、测试、发布和维护 | `package.json`、`.github/workflows`、`packages/viewer` |

## 关键依赖方向

推荐依赖方向是：入口/编排 → core → 图谱契约 → dashboard/viewer。dashboard 只能使用 core 的 browser-safe 子路径，不能从主入口带入 Node.js 依赖。这个约束是当前项目的重要边界，也是值得初学者学习的“依赖倒置”实践。

## 为什么不是一个大包

模块拆分带来三个收益：core 可以被 skill、dashboard、viewer 复用；dashboard 可以独立构建和测试；平台适配变化不会迫使解析器一起变化。代价是 workspace、版本、构建顺序和契约兼容性需要维护。

## 架构阅读口诀

先找入口，再找数据契约；先看单向依赖，再看跨层调用；先看失败处理，再看成功路径；先读测试，再相信实现。
