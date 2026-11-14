---
title: 开发与设计实践
formatter: yaml-frontmatter
id: LEARN-PRACTICE-001
status: active
owner: architecture
updated: 2026-11-05
tags: [learning, design, engineering]
links: [[06-code-reading-guide|源码阅读指南]], [[08-testing-and-delivery|测试与交付]], [[09-design-review-checklist|设计评审清单]]
---

# 开发与设计实践

## 事实：当前项目已经采用的实践

- TypeScript strict、ESM、pnpm workspace。
- core 提供 browser-safe subpath exports。
- 结构解析与 LLM 语义分析分层。
- schema、normalize、sanitize 和 freshness 共同治理结果。
- 中间结果落盘，避免无界上下文增长。
- CI 在 Ubuntu/Windows 矩阵中执行 lint、构建和测试。

## 建议：新增功能的最佳路径

1. 先写问题、用户场景和不变量，而不是先改 UI。
2. 把需求拆成可观察的 Given/When/Then。
3. 先确定数据契约和错误语义，再实现 happy path。
4. 在 core、编排、展示三个边界分别决定改动位置。
5. 用最小实现通过测试，再基于证据优化性能。
6. 把兼容性、迁移、回滚和安全边界写进设计。
7. 更新追踪矩阵和运维说明，让知识与代码一起演进。

## 设计原则

- 单一事实来源：结构事实由 parser/core 负责，UI 不重复推断。
- 显式失败：错误、过期和不支持状态必须可见。
- 最小权限：文件查看只允许图谱派生路径。
- 稳定契约：跨包共享类型优先于隐式约定。
- 可演进：增加语言、平台或视图时，不把特例塞进核心主流程。
- 可测量：性能优化必须有 benchmark 或可重复 fixture 支撑。
