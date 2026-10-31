---
title: 测试策略
formatter: yaml-frontmatter
id: TEST-STR-001
status: active
owner: qa-maintainers
updated: 2026-10-31
tags: [testing, tdd, strategy]
links: [[02-test-catalog|测试目录]], [[03-atdd-acceptance|ATDD 验收]], [[../02-requirements/03-quality-attributes|质量属性]]
---

# 测试策略

## 测试金字塔

- **单元测试**：schema、parser、fingerprint、search、layout、store 和 prompt builder 的纯逻辑。
- **集成测试**：graph builder、freshness、增量合并、viewer middleware、skill 组合。
- **契约测试**：图谱 schema、平台 manifest、benchmark report schema 和 plugin discovery。
- **验收测试**：从 `/understand`、dashboard、diff、onboard 等用户场景验证 Given/When/Then。

## TDD/ATDD 规则

先把需求转成可观察验收条件，再为风险最高的契约补测试；修改 core 共享行为时必须运行 core test 和根级 skill test。前端变更至少运行 dashboard test/build。CI 目前以 `ci.yml` 的 lint、core/skill/viewer build、Vitest 和 Python unittest 为质量门禁。

外部 LLM 的随机性通过 fixture、parser contract 和 schema 校验隔离；不以单次自然语言输出作为唯一断言。
