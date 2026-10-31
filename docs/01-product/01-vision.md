---
title: 产品愿景与范围
formatter: yaml-frontmatter
id: PROD-VIS-001
status: active
owner: product-maintainers
updated: 2026-10-31
tags: [product, scope, vision]
links: [[02-personas-and-journeys|用户角色与旅程]], [[03-capability-map|能力地图]], [[../02-requirements/01-system-requirements|系统需求]]
---

# 产品愿景与范围

## 愿景

Understand Anything 将大型代码库、知识库和文档转换为可搜索、可解释、可视化的知识图谱，帮助开发者建立系统级心智模型、进行影响分析并完成团队 onboarding。

## 已实现范围

- 通过多 Agent pipeline 扫描项目、提取文件/符号/依赖并生成知识图谱。
- 通过 Tree-sitter 与非代码解析器支持多种语言和配置格式。
- 通过 dashboard 浏览结构图、领域图、知识图、节点详情、代码和 guided tour。
- 通过 chat、diff、explain、onboard、domain、knowledge、figma 等 skills 提供任务入口。
- 通过增量指纹、图新鲜度和 post-commit hook 降低重复分析成本。
- 通过 Claude Code、Codex、Cursor、Copilot、Gemini CLI 等平台适配分发。

## 边界

产品不是通用 IDE、CI 托管平台或源代码修改器；LLM 生成的摘要和关系属于辅助理解结果，必须允许用户回到源文件核验。完整能力证据见 [[../05-implementation/01-repository-map|仓库地图]]。
