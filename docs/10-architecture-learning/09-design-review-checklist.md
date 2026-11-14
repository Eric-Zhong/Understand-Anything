---
title: 设计评审清单
formatter: yaml-frontmatter
id: LEARN-REVIEW-001
status: active
owner: architecture
updated: 2026-11-05
tags: [learning, review, architecture]
links: [[07-engineering-practices|工程实践]], [[08-testing-and-delivery|测试与交付]], [[10-glossary-and-exercises|术语与练习]]
---

# 设计评审清单

## 问题与范围

- 是否说明用户、场景、非目标和成功标准？
- 是否把代码事实与未来建议分开？
- 是否明确不修改或兼容现有图谱和数据？

## 架构

- 新职责放在哪个限界上下文？
- 依赖方向是否仍然单向？
- 是否复用现有 core 类型、schema、registry 和错误模型？
- 是否会把 Node-only 模块带进 dashboard？

## 数据与安全

- 新字段是否有默认值、版本和迁移策略？
- 节点 ID、边引用和路径 allowlist 是否稳定？
- LLM/外部输入是否经过校验？是否可能泄露源代码或 token？

## 可靠性与运维

- 失败、超时、空结果和 stale 状态怎样呈现？
- 增量更新怎样避免丢数据？
- 能否从日志、issue 或 fixture 复现问题？
- 发布失败如何回滚？旧图谱是否仍可读取？

## 测试与交付

- 是否有单元、集成、契约和 ATDD 测试？
- 是否覆盖 Windows/Unix、旧数据和大图？
- 是否更新 CI、版本、viewer 和文档追踪？

评审结论只允许三种：通过、带条件通过、退回补充证据。不要用“看起来没问题”替代可复核证据。
