---
title: 知识图谱契约
formatter: yaml-frontmatter
id: DDD-GRAPH-001
status: active
owner: core-maintainers
updated: 2026-10-31
tags: [ddd, schema, graph, contract]
links: [[02-domain-model|领域模型]], [[../04-architecture/02-runtime-dataflow|运行时数据流]], [[../06-testing/02-test-catalog|测试目录]]
---

# 知识图谱契约

图谱是结构分析、LLM 语义分析、持久化和 dashboard 的共享语言。core 从 `types`、`schema`、`persistence` 导出契约，并提供 `validateGraph`、`sanitizeGraph`、`autoFixGraph` 与 normalize 能力。

## 契约要求

1. 节点含可稳定定位的 ID、类型、名称和路径/语义信息。
2. 边含来源、目标及关系类别；非法引用必须被报告或丢弃并计数。
3. 复杂度、方向等历史别名在 schema 层归一化。
4. 图谱加载失败需返回结构化 issue，dashboard 显示 Warning/Error banner。
5. `.ua/knowledge-graph.json` 是默认产物；若目标项目已有 `.understand-anything/`，该目录优先。
6. `intermediate/` 和 `diff-overlay.json` 属于本地临时数据，不应作为共享图谱提交。

具体字段以 `understand-anything-plugin/packages/core/src/types.ts` 和 `schema.ts` 为准；本文是行为契约，不替代类型定义。
