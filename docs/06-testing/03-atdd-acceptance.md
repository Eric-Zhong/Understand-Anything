---
title: ATDD 验收场景
formatter: yaml-frontmatter
id: TEST-ATDD-001
status: active
owner: qa-maintainers
updated: 2026-10-31
tags: [testing, atdd, acceptance]
links: [[../02-requirements/02-use-cases|用例与验收]], [[01-test-strategy|测试策略]], [[../09-traceability/01-requirement-traceability|需求追踪矩阵]]
---

# ATDD 验收场景

## 分析和图谱

- Given 一个可分析项目，When 执行 `/understand`，Then 生成可通过 schema 校验的图谱并可被 dashboard 加载。
- Given 项目存在 `.understand-anything/`，When 再次分析，Then 不迁移或覆盖该目录，继续使用它作为数据目录。
- Given 只有少数文件变化，When 执行增量更新，Then 未变化文件的节点和关系保持稳定。

## 交互和安全

- Given 合法图谱，When 搜索并选择文件节点，Then 可查看摘要、关系和受 allowlist 保护的源代码。
- Given 非法图谱或 stale graph，When 打开 dashboard，Then 显示结构化警告/错误并保留可诊断信息。

## 交付

- Given pull request，When CI 完成，Then lint、构建、Vitest 和 Python 测试均通过。
- Given viewer 版本发布，When dashboard 或 Vite middleware 变化，Then 重新打包 release tarball 并更新对应版本说明。
