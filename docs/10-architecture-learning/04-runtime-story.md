---
title: 一次分析是怎样完成的
formatter: yaml-frontmatter
id: LEARN-RUNTIME-001
status: active
owner: architecture
updated: 2026-11-05
tags: [learning, runtime, pipeline]
links: [[03-architecture-from-30-feet|架构鸟瞰]], [[05-domain-and-graph|领域与图谱]], [[../04-architecture/02-runtime-dataflow|运行时数据流]]
---

# 一次分析是怎样完成的

## 1. 用户发起任务

平台发现并调用 `/understand` skill。skill 读取目标目录、参数、语言偏好和已有数据目录，决定全量还是增量路径。

## 2. 发现与解析

扫描器识别文件；ignore filter 排除不应分析的路径；语言 registry 和 framework registry 选择配置；Tree-sitter 或专用 parser 抽取文件、符号、导入和结构关系。

## 3. 形成结构事实

`GraphBuilder` 和相关 extractor 把解析结果组织成图结构。此时应优先信任 AST、路径和类型，而不是自然语言解释。

## 4. 批量语义分析

skill 按 token 和依赖关系组织 batch，调用 file、project、architecture、domain 等 Agent。中间结果写入数据目录 `intermediate/`，避免把所有结果堆进单次对话上下文。

## 5. 合并与治理

批次结果被 merge、normalize、sanitize 并通过 schema validation。非法节点、边、别名或缺失字段应变成结构化 issue，而不是静默进入最终图谱。

## 6. 持久化与展示

最终图谱写入 `.ua/knowledge-graph.json`；已有 `.understand-anything/` 时继续使用 legacy 目录。dashboard 加载图谱，执行 freshness 检查、布局、搜索、过滤和节点详情展示。

## 7. 增量循环

后续运行使用 fingerprint 和 change classifier 判断哪些文件或关系受影响，只重算必要部分。初学者可先阅读 `fingerprint.ts`、`change-classifier.ts`、`staleness.ts` 及对应测试。

## 失败时怎样思考

- 没有节点：先查发现/ignore/解析。
- 有节点无解释：查 batch、Agent 输出和合并。
- 图谱无法加载：查 JSON、schema、normalize。
- dashboard 空白：查构建、browser-safe import 和图谱加载。
- 结果过期：查 fingerprint、hook 和 freshness。
