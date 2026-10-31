---
title: 测试目录与覆盖面
formatter: yaml-frontmatter
id: TEST-CAT-001
status: active
owner: qa-maintainers
updated: 2026-10-31
tags: [testing, coverage, catalog]
links: [[01-test-strategy|测试策略]], [[../05-implementation/02-package-design|包与模块设计]], [[../09-traceability/01-requirement-traceability|需求追踪矩阵]]
---

# 测试目录与覆盖面

| 区域 | 现有证据 |
|---|---|
| core | `packages/core/src/**/__tests__` 与 analyzer/各模块测试，覆盖 schema、parsers、search、freshness、fingerprint、registry、domain、tour |
| dashboard | 组件、store、locale、freshness、layout、filter、edge aggregation 和 smoke tests |
| plugin skills | `src/__tests__`、`tests/skill/understand`、knowledge merge/parser 与 incremental fixtures |
| 根工作流 | benchmark、hook auto-update、platform consistency、viewer tests |
| Python helpers | merge batch/subdomain、knowledge parser 的 unittest |

建议新功能至少增加：一个正常路径测试、一个边界/失败路径测试、一个跨包契约测试（若改变共享图谱或平台行为）。
