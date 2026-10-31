---
title: 平台适配
formatter: yaml-frontmatter
id: IMPL-PLAT-001
status: active
owner: release-maintainers
updated: 2026-10-31
tags: [implementation, platform, distribution]
links: [[01-repository-map|仓库地图]], [[../07-deployment/01-installation|安装部署]], [[../07-deployment/03-release-and-rollback|发布与回滚]]
---

# 平台适配

- Claude Code：`.claude-plugin` 与 marketplace 原生插件。
- Cursor：`.cursor-plugin/plugin.json` 自动发现。
- VS Code/Copilot：`.copilot-plugin/plugin.json` 自动发现。
- Codex、OpenCode、Gemini CLI、Pi、Vibe、Kiro 等：由 `install.sh`/`install.ps1` 创建平台所需链接或 agent 配置。
- Viewer：通过 release asset `understand-anything-viewer.tgz` 在无 Claude Code 环境查看提交图谱。

适配层只负责发现、安装和入口映射；领域逻辑仍由 core 与 skills 提供。版本发布时必须保持六个版本文件同步，详见 [[../07-deployment/03-release-and-rollback|发布与回滚]]。
