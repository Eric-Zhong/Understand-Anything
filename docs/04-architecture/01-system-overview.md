---
title: 系统总览
formatter: yaml-frontmatter
id: ARCH-OV-001
status: active
owner: architecture
updated: 2026-10-31
tags: [architecture, sdd, monorepo]
links: [[02-runtime-dataflow|运行时数据流]], [[03-architecture-decisions|架构决策]], [[../05-implementation/02-package-design|包与模块设计]]
---

# 系统总览

```text
目标项目/知识库
      |
      v
平台 Skill -> scan/extract -> core parser + Tree-sitter -> fingerprints
      |                                      |
      v                                      v
Agent 编排 -> LLM 分析/合并 ----------------> knowledge-graph.json
                                                    |
                    +-------------------------------+----------------+
                    v                                                v
             dashboard (React/Vite)                         chat/diff/explain/onboard
```

## 部署单元

- 根仓库：安装脚本、平台 manifest、CI、benchmark 和测试。
- `understand-anything-plugin/packages/core`：可复用分析引擎，提供 browser-safe subpath exports。
- `packages/dashboard`：React 交互展示，开发时由 Vite 服务。
- `packages/viewer`：将提交的图谱和 dashboard 作为独立 viewer 分发。
- `plugin/src`、`skills`、`agents`：平台任务和多 Agent 领域编排。
- `homepage`：产品主页与演示部署单元。

边界事实来自 `CLAUDE.md`、package manifests 和源码目录；托管生产基础设施未在仓库中定义。
