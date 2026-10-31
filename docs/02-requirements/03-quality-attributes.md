---
title: 质量属性
formatter: yaml-frontmatter
id: REQ-NFR-001
status: active
owner: engineering
updated: 2026-10-31
tags: [requirements, nfr, quality]
links: [[01-system-requirements|系统需求]], [[../06-testing/01-test-strategy|测试策略]], [[../08-operations/03-security-and-data|安全与数据治理]]
---

# 质量属性

| 属性 | 约束与验收方向 |
|---|---|
| 正确性 | 图谱符合 schema；normalize 不产生非法 node/edge；增量更新不丢失未变更符号 |
| 可维护性 | TypeScript strict、ESM、包边界清晰，core browser-safe subpath 不引入 Node 模块 |
| 可移植性 | Node >=22、pnpm >=10；CI 覆盖 Ubuntu 和 Windows；平台安装脚本可重复执行 |
| 性能 | 大仓库支持批处理和增量；dashboard 布局在大图上可退化但不能阻塞交互 |
| 安全性 | 文件查看受 token 与图谱路径 allowlist 约束；不把中间结果当作公开产物 |
| 可观测性 | 图新鲜度、警告、验证错误和失败原因对用户可见；操作文档给出诊断路径 |
| 可演进性 | schema、语言 registry、plugin registry 与 viewer 版本需要可追踪、可迁移 |
