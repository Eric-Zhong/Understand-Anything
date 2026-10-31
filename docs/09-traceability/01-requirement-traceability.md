---
title: 需求追踪矩阵
formatter: yaml-frontmatter
id: TRACE-REQ-001
status: active
owner: architecture
updated: 2026-10-31
tags: [traceability, requirements, evidence]
links: [[../02-requirements/01-system-requirements|系统需求]], [[../04-architecture/01-system-overview|系统总览]], [[../06-testing/03-atdd-acceptance|ATDD 验收]]
---

# 需求追踪矩阵

| 需求 | 领域/设计 | 实现证据 | 测试/运维证据 |
|---|---|---|---|
| FR-01 分析项目 | [[../03-domain/01-bounded-contexts|结构分析上下文]] | `skills/understand/*`、core GraphBuilder | skill tests、[[../06-testing/03-atdd-acceptance|UC-01]] |
| FR-02 增量更新 | [[../03-domain/02-domain-model|Fingerprint/Freshness]] | core fingerprint、staleness、change-classifier | incremental tests、troubleshooting |
| FR-03 多语言解析 | [[../04-architecture/03-architecture-decisions|ADR-002]] | languages registry、TreeSitterPlugin、parsers | parser/language tests |
| FR-04 交互探索 | [[../04-architecture/01-system-overview|dashboard 单元]] | dashboard components/utils/store | dashboard tests、UC-04 |
| FR-05 辅助理解 | [[../05-implementation/03-agent-pipeline|Agent 流水线]] | plugin `src` builders、skills、agents | context/diff/explain/onboard tests |
| FR-06 结果治理 | [[../03-domain/03-knowledge-graph-contract|图谱契约]] | schema、normalize、freshness | schema/normalize/freshness tests |
| FR-07 跨平台安装 | [[../05-implementation/04-platform-adapters|平台适配]] | install scripts、plugin manifests、viewer | install/platform/viewer tests |
| FR-08 可复现交付 | [[../07-deployment/02-ci-cd|CI/CD]] | `.github/workflows/ci.yml` | CI matrix、[[../06-testing/01-test-strategy|测试策略]] |

矩阵是当前逆向基线；新增需求必须补充实现路径、自动化测试或明确的人工验收责任。
