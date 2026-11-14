---
title: 领域与知识图谱
formatter: yaml-frontmatter
id: LEARN-DOMAIN-001
status: active
owner: architecture
updated: 2026-11-05
tags: [learning, ddd, graph]
links: [[04-runtime-story|运行时故事]], [[06-code-reading-guide|源码阅读指南]], [[../03-domain/03-knowledge-graph-contract|知识图谱契约]]
---

# 领域与知识图谱

## 领域语言

- **Project**：被理解的代码库、知识库或设计资料。
- **File**：项目中的文件实体。
- **Symbol**：函数、类、接口、变量等代码单元。
- **Node**：图谱中可展示和检索的实体。
- **Edge**：节点之间的关系，例如包含、导入、调用或语义关联。
- **Fingerprint**：文件结构和内容的可比较摘要。
- **Batch**：一次提交给 LLM 的分析分组。
- **Freshness**：图谱是否跟上源文件变化。

## 用 DDD 理解系统

可以把系统看成多个限界上下文：项目摄取、结构分析、语义分析、图谱治理、交互探索和分发运行。它们共享“图谱契约”，但职责不同。初学者不要把所有 JSON 字段都当成领域模型；先识别哪些对象有生命周期、哪些规则必须保持不变量。

## 图谱的核心不变量

1. 节点 ID 必须稳定，否则增量更新和链接会失效。
2. 边的来源和目标必须可诊断，不能产生无法解释的悬空关系。
3. 路径必须回到允许的源文件范围，不能让展示层任意读取文件。
4. 语义结果必须经过 normalize/schema 治理。
5. 增量合并不能静默覆盖未变化结果。

## 学习重点

读 `types.ts` 时先找实体和联合类型；读 `schema.ts` 时找不变量；读 `persistence` 时找生命周期；读 `staleness` 和 `fingerprint` 时找“变化如何传播”。
