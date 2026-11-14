---
title: 源码阅读指南
formatter: yaml-frontmatter
id: LEARN-CODE-001
status: active
owner: architecture
updated: 2026-11-05
tags: [learning, source-code, workflow]
links: [[01-learning-roadmap|学习路线]], [[04-runtime-story|运行时故事]], [[07-engineering-practices|工程实践]]
---

# 源码阅读指南

## 推荐顺序

1. 读根 `package.json` 和 `pnpm-workspace.yaml`，知道构建边界。
2. 读 `packages/core/src/index.ts`，建立公共 API 地图。
3. 读 `types.ts`、`schema.ts`、`persistence`，理解数据契约。
4. 读 `graph-builder.ts`、parsers、language registry，理解结构事实来源。
5. 读 `fingerprint.ts`、`change-classifier.ts`、`staleness.ts`，理解增量。
6. 读 plugin `src` 和 `skills/understand`，理解编排和批处理。
7. 读 `dashboard/src/App.tsx`、store、GraphView 和 CodeViewer，理解消费方式。
8. 最后读 viewer、install scripts 和 workflows，理解分发。

## 每个文件问五个问题

- 它的输入和输出是什么？
- 它依赖哪个稳定契约？
- 它能改变哪些状态？
- 失败时如何报告？
- 哪个测试证明它当前行为？

## 从测试反推设计

测试名称往往比目录更准确地告诉你系统承诺：schema、freshness、incremental symbols、plugin discovery、viewer、layout 和 security snippets 都有现成测试入口。遇到陌生函数，先找同名测试和调用者，再读实现。

## 不建议的阅读方式

不要从最大的 UI 文件开始逐行阅读；不要先读 prompt 文字再猜数据模型；不要把 README 的产品宣传当成 API 契约；不要只看成功路径而忽略 issue、stale、空图和不支持语言。
