---
title: 用户角色与关键旅程
formatter: yaml-frontmatter
id: PROD-PER-001
status: active
owner: product-maintainers
updated: 2026-10-31
tags: [product, persona, journey]
links: [[01-vision|产品愿景]], [[../02-requirements/02-use-cases|用例与验收]], [[../04-architecture/01-system-overview|系统总览]]
---

# 用户角色与关键旅程

## 角色

| 角色 | 目标 | 主要入口 |
|---|---|---|
| 新成员 | 快速理解陌生代码库 | `/understand`、`/understand-onboard`、dashboard |
| 贡献者 | 定位实现、查询依赖、评估变更影响 | `/understand-chat`、`/understand-explain`、`/understand-diff` |
| 架构师/PM | 了解领域、模块边界和业务流程 | domain view、guided tour、`/understand-domain` |
| 知识维护者 | 将 wiki 或设计资料组织成图谱 | `/understand-knowledge`、`/understand-figma` |
| 发布维护者 | 验证构建、发布 viewer 和平台插件 | CI、viewer、install scripts |

## 关键旅程

1. 安装平台插件，执行 `/understand`，确认语言和分析范围。
2. 读取 `.ua/knowledge-graph.json`，在 dashboard 中浏览结构和节点详情。
3. 使用搜索、tour、chat 或 explain 深挖模块。
4. 修改代码后运行 diff/增量分析，确认图谱新鲜度和影响范围。
5. 在 CI 中验证构建和测试，按发布流程更新分发资产。
