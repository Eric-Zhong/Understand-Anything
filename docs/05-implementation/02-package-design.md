---
title: 包与模块设计
formatter: yaml-frontmatter
id: IMPL-PKG-001
status: active
owner: engineering
updated: 2026-10-31
tags: [implementation, package, module]
links: [[01-repository-map|仓库地图]], [[../03-domain/01-bounded-contexts|限界上下文]], [[../04-architecture/03-architecture-decisions|架构决策]]
---

# 包与模块设计

## core

公共出口包含 types、persistence、schema、GraphBuilder、LLM analyzer、normalize、SearchEngine、freshness、layer/tour/language lesson、plugin/language/framework registry、fingerprint、change classifier 和多格式 parser。`./search`、`./types`、`./schema`、`./languages`、`./figma` 是显式子路径出口。

## dashboard

React 19 + Vite + Zustand + React Flow；组件覆盖 graph/domain/knowledge views、file explorer、code viewer、filters、persona/theme/mobile；utils 覆盖 ELK/dagre/force layout、edge aggregation、containers 和 filters。

## plugin orchestration

`src` 负责将图谱和文件上下文转换为 chat/diff/explain/onboard prompt；`skills` 负责用户可调用 workflow；`agents` 负责扫描、分析、审查和导览。

## viewer/homepage

viewer 复用 dashboard 构建结果并服务提交图谱；homepage 是独立 Astro 应用，不能与插件 runtime 混为一谈。
