---
title: 限界上下文
formatter: yaml-frontmatter
id: DDD-BC-001
status: active
owner: architecture
updated: 2026-10-31
tags: [ddd, domain, bounded-context]
links: [[02-domain-model|领域模型]], [[03-knowledge-graph-contract|知识图谱契约]], [[../04-architecture/01-system-overview|系统总览]]
---

# 限界上下文

| 上下文 | 核心职责 | 主要实现 |
|---|---|---|
| 项目摄取 | 文件发现、ignore、语言/框架识别 | `core` parsers、language registry、ignore filter |
| 结构分析 | AST、符号、导入、依赖图 | TreeSitterPlugin、GraphBuilder、extractors |
| 语义分析 | LLM 摘要、领域、层次、tour、language lesson | analyzer、agents、skills |
| 图谱治理 | schema、normalize、持久化、新鲜度和增量合并 | core schema/persistence/staleness/fingerprint |
| 交互探索 | 搜索、布局、节点信息、代码和多视图 | dashboard |
| 任务编排 | chat/diff/explain/onboard 等上下文与 prompt | plugin `src` |
| 分发运行 | plugin manifest、viewer、install、CI release | 根目录、viewer、workflows |

上下文之间以知识图谱契约和文件系统产物连接；LLM 是语义分析的外部协作者，不应成为结构解析的唯一真相源。
