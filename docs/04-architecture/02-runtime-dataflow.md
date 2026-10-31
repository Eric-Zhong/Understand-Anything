---
title: 运行时数据流
formatter: yaml-frontmatter
id: ARCH-FLOW-001
status: active
owner: architecture
updated: 2026-10-31
tags: [architecture, runtime, dataflow]
links: [[01-system-overview|系统总览]], [[../05-implementation/03-agent-pipeline|Agent 流水线]], [[../03-domain/03-knowledge-graph-contract|知识图谱契约]]
---

# 运行时数据流

1. 平台调用 `/understand` skill，解析参数、语言和目标范围。
2. `scan-project`、`extract-structure` 和语言/框架 registry 发现文件并提取结构。
3. core 的 parser、Tree-sitter plugin、ignore filter 和 fingerprint store 形成结构结果。
4. skill 按批次把上下文交给 project/file/domain/architecture agents，LLM 返回摘要、关系、层次和 tour 数据。
5. merge/normalize/schema 阶段合并批次，处理孤立节点、别名和非法边。
6. persistence 写入 `.ua/knowledge-graph.json` 或 legacy 目录，同时保留中间产物在 `intermediate/`。
7. dashboard 读取图谱，进行 freshness 校验、布局、搜索、过滤和节点详情渲染。
8. 增量执行通过 fingerprint/change-classifier 判断重算范围；commit hook 可触发自动更新。

失败点应在对应上下文暴露：解析失败、LLM 响应不完整、schema issue、路径越界和 stale graph 不应被伪装成成功。
