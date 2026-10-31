---
title: 用例与验收场景
formatter: yaml-frontmatter
id: REQ-UC-001
status: active
owner: engineering
updated: 2026-10-31
tags: [requirements, atdd, use-case]
links: [[01-system-requirements|系统需求]], [[../06-testing/03-atdd-acceptance|ATDD 验收场景]], [[../05-implementation/03-agent-pipeline|Agent 流水线]]
---

# 用例与验收场景

## UC-01 首次分析

**Given** 目标项目满足 Node/pnpm 前置条件且已安装平台插件，**When** 用户执行 `/understand`，**Then** 系统扫描项目、生成 `.ua/knowledge-graph.json`（已有 legacy 目录时继续使用），并可启动 dashboard。

## UC-02 增量分析

**Given** 已有图谱和 fingerprint，**When** 用户再次执行 `/understand`，**Then** 系统识别变化文件，只处理必要批次，并更新图谱新鲜度。

## UC-03 影响分析

**Given** 工作区有代码变更，**When** 用户执行 `/understand-diff`，**Then** 系统输出受影响节点/关系及解释上下文，不修改源代码。

## UC-04 图谱探索

**Given** 图谱通过 schema 校验，**When** 用户打开 dashboard、搜索或选择节点，**Then** 可以看到结构关系、摘要、文件内容和相关 tour；坏图谱显示错误提示而非静默崩溃。

## UC-05 交付验证

**Given** 贡献者提交代码，**When** CI 运行，**Then** lint、core/skill/viewer 构建、Vitest 和 Python helper 测试均通过后才视为可合并。
