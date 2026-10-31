---
title: 发布与回滚
formatter: yaml-frontmatter
id: DEP-REL-001
status: active
owner: release-maintainers
updated: 2026-10-31
tags: [deployment, release, rollback]
links: [[01-installation|安装部署]], [[02-ci-cd|CI/CD]], [[../08-operations/01-operating-model|运行模型]]
---

# 发布与回滚

## 发布检查

1. 确认工作区干净、目标分支正确，运行 lint、构建和测试。
2. UI 或 `vite.config.ts` middleware 变化时运行 viewer release pack。
3. 同步更新六个版本字段：根/插件 package、插件 `.claude-plugin`、viewer package、根 `.claude-plugin`、`.cursor-plugin`、`.copilot-plugin`。
4. 上传固定名 `understand-anything-viewer.tgz`，验证 latest download URL。
5. 记录变更、已知风险和图谱兼容性。

## 回滚

优先回退发布资产或恢复上一已验证版本，不强制改写 Git 历史。若 schema 不兼容，先恢复 viewer/plugin 版本，再处理图谱迁移；保留失败 CI 和发布日志用于诊断。
