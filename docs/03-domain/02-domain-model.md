---
title: 领域模型与术语
formatter: yaml-frontmatter
id: DDD-MODEL-001
status: active
owner: architecture
updated: 2026-10-31
tags: [ddd, ubiquitous-language, model]
links: [[01-bounded-contexts|限界上下文]], [[03-knowledge-graph-contract|知识图谱契约]], [[../04-architecture/02-runtime-dataflow|运行时数据流]]
---

# 领域模型与术语

- **Project**：待分析的代码库、知识库或设计资料集合。
- **Source file**：项目中的文件实体，可产生一个或多个节点。
- **Symbol**：函数、类、变量、接口等可定位代码单元。
- **Node**：图谱中的文件、符号、领域、流程、知识实体或步骤。
- **Edge**：节点间的 import、call、contains、relates 等关系。
- **Graph freshness**：图谱与当前源文件状态的同步程度。
- **Fingerprint**：文件结构、符号和 import 的可比较摘要。
- **Batch**：为控制 token 和并发而分组提交给 LLM 的分析单元。
- **Tour**：按依赖或主题组织的引导式学习路径。
- **Persona**：dashboard 根据用户目标调整信息密度的视角。

核心不变量：节点 ID 必须稳定；关系目标必须存在或被明确诊断；源文件路径必须能回到允许的真实文件；增量合并不能静默覆盖未变更结果。
