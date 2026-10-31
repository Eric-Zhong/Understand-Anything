---
title: 能力地图与路线假设
formatter: yaml-frontmatter
id: PROD-CAP-001
status: active
owner: product-maintainers
updated: 2026-10-31
tags: [product, capability, roadmap]
links: [[01-vision|产品愿景]], [[../03-domain/01-bounded-contexts|限界上下文]], [[../09-traceability/01-requirement-traceability|需求追踪矩阵]]
---

# 能力地图与路线假设

| 能力域 | 当前实现证据 | 后续关注 |
|---|---|---|
| 结构分析 | core GraphBuilder、语言配置、extractors | 更广语言覆盖、失败可解释性 |
| LLM 理解 | file/project prompts、agents、batch merge | 成本控制、模型可替换性、结果置信度 |
| 图谱存储 | schema、persistence、`.ua`/legacy 路径 | 版本迁移、增量一致性 |
| 交互探索 | React dashboard、搜索、布局、代码查看器 | 大图性能、可访问性、离线体验 |
| 领域与知识 | domain/knowledge skills、图聚类 | 领域模型验证、来源追踪 |
| 分发交付 | 多平台 plugin manifests、viewer、install scripts | 版本一致性、发布自动化 |

路线优先级应以数据正确性、增量可靠性、跨平台可安装性和大图可用性为先；新增视觉功能不得牺牲图谱契约和源代码访问边界。
