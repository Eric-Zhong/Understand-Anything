---
title: 系统需求
formatter: yaml-frontmatter
id: REQ-SYS-001
status: active
owner: engineering
updated: 2026-10-31
tags: [requirements, sdd, functional]
links: [[02-use-cases|用例与验收]], [[03-quality-attributes|质量属性]], [[../03-domain/03-knowledge-graph-contract|知识图谱契约]], [[../09-traceability/01-requirement-traceability|需求追踪矩阵]]
---

# 系统需求

## 功能需求

- **FR-01 分析项目**：系统必须扫描目标项目，提取文件、符号、导入和关系，生成可校验图谱。
- **FR-02 增量更新**：系统必须比较指纹和图新鲜度，仅重新分析变化或受影响范围，并保留 legacy data directory 兼容性。
- **FR-03 多语言解析**：系统必须通过 Tree-sitter/plugin registry 和非代码 parser 支持已注册语言及配置格式。
- **FR-04 交互探索**：dashboard 必须支持结构、领域、知识视图、搜索、布局、节点详情、tour 和代码查看。
- **FR-05 辅助理解**：系统必须提供 chat、diff、explain、onboard 等面向任务的上下文构建能力。
- **FR-06 结果治理**：图谱加载时必须进行 schema validation、normalize/sanitize/auto-fix，并显示可理解的错误或新鲜度提示。
- **FR-07 跨平台安装**：系统必须提供 Claude 原生安装以及其他平台的安装器/manifest 适配。
- **FR-08 可复现交付**：CI 必须执行 lint、核心/skill/viewer build 和 JS/Python 测试。

需求基于仓库源码和 README 逆向整理；未在实现中找到的 SLA、认证、多租户和托管服务需求暂不视为承诺。
