---
title: 测试与交付学习
formatter: yaml-frontmatter
id: LEARN-QUALITY-001
status: active
owner: architecture
updated: 2026-11-05
tags: [learning, testing, delivery, tdd, atdd]
links: [[07-engineering-practices|工程实践]], [[09-design-review-checklist|设计评审清单]], [[../06-testing/01-test-strategy|测试策略]], [[../07-deployment/02-ci-cd|CI/CD]]
---

# 测试与交付学习

## TDD：验证最小行为

先为纯规则写单元测试：schema 校验、fingerprint 比较、change classifier、搜索、布局和 parser。测试应描述输入、输出和边界，不要把内部实现细节锁死。

## ATDD：验证用户价值

用用户语言描述完整链路：执行分析后得到图谱；变更后只重算必要内容；打开坏图谱时看见可诊断错误；CI 通过后才可合并。对应场景见 [[../06-testing/03-atdd-acceptance|ATDD 验收场景]]。

## 当前 CI 质量门

`.github/workflows/ci.yml` 在 pull request 和 main push 运行 Ubuntu/Windows 矩阵：安装依赖、lint、core build、skill build、viewer build、core test、根 Vitest 和 Python unittest。

## 发布前清单

- 图谱 schema 和兼容性已确认。
- core、skill、dashboard/viewer build 已通过。
- UI 或 middleware 变化时已重新打包 viewer。
- 六个版本字段保持同步。
- release asset 使用固定文件名。
- 安装、升级和回滚路径经过验证。

## 初学者的质量判断

“测试通过”只说明已覆盖的行为通过；还要问是否测试了错误输入、旧图谱、跨平台、性能、权限和升级兼容性。
