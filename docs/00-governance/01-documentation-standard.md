---
title: 文档标准
formatter: yaml-frontmatter
id: DOC-STD-001
status: active
owner: maintainers
updated: 2026-10-31
tags: [documentation, governance, ai-navigation]
links: [[../README|文档总览]], [[../09-traceability/01-requirement-traceability|追踪矩阵]]
---

# 文档标准

## 1. 目录与编号

新文档目录使用两位数字前缀，按生命周期排序：治理、产品、需求、领域、架构、实现、测试、部署、运维、追踪。目录内文件从 `01` 开始编号。编号表达阅读顺序，不表达永久优先级。

既有 `benchmarks/`、`incremental/`、`superpowers/` 为受保护资料：不得移动、重命名、改写或批量补充元数据。新文档只引用它们。

## 2. Markdown 元数据

除 `README.md` 外，每份新增 Markdown 必须以 YAML Front Matter 开始，至少包含 `title`、`id`、`status`、`owner`、`updated`、`tags`、`links`。日期使用 ISO-8601；状态使用 `draft`、`active`、`deprecated` 或 `archived`。

## 3. 链接规则

文档之间的语义关联使用 Wikilink，例如 `[[04-architecture/01-system-overview|系统总览]]`。仓库文件、命令和外部网页使用普通 Markdown 链接或代码格式。新增文档应至少有一个上游入口和一个下游关联，避免孤岛。

## 4. 方法论

- DDD：先定义领域语言、限界上下文和上下文映射，再描述模块。
- SDD：需求、约束和决策先于实现细节，设计必须说明证据与权衡。
- ATDD：用 Given/When/Then 描述用户可观察验收条件。
- TDD：单元、集成和回归测试应与风险和模块边界对应。

## 5. 维护规则

实现发生行为变化时，维护者同步更新受影响需求、架构、测试或运维文档，并在 [[../09-traceability/01-requirement-traceability|追踪矩阵]] 记录证据。无法从代码确认的内容标记为“待确认”，不得伪造运行时事实。
