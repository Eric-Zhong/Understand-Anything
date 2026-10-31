---
title: Agent 分析流水线
formatter: yaml-frontmatter
id: IMPL-AGENT-001
status: active
owner: engineering
updated: 2026-10-31
tags: [implementation, agent, pipeline]
links: [[01-repository-map|仓库地图]], [[../04-architecture/02-runtime-dataflow|运行时数据流]], [[../06-testing/03-atdd-acceptance|ATDD 验收场景]]
---

# Agent 分析流水线

1. `project-scanner` 识别项目边界和结构。
2. `file-analyzer` 针对文件和符号生成语义分析。
3. `architecture-analyzer`、`domain-analyzer`、`design-analyzer` 提取更高层关系。
4. `graph-reviewer` 与 `assemble-reviewer` 发现图谱问题。
5. `tour-builder` 生成依赖顺序的 onboarding 路径。
6. skill 脚本负责扫描、批处理、合并、重试、增量和最终持久化。

中间结果写入目标数据目录的 `intermediate/`，而不是全部塞入对话上下文；组装完成后清理。模型字段不写入 agent frontmatter，让平台使用自身默认模型。任何 agent 输出都必须经过合并和 schema 治理后才能进入 dashboard。
