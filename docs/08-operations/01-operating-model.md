---
title: 运行模型与维护职责
formatter: yaml-frontmatter
id: OPS-MODEL-001
status: active
owner: maintainers
updated: 2026-10-31
tags: [operations, maintenance, ownership]
links: [[02-troubleshooting|故障排查]], [[03-security-and-data|安全与数据治理]], [[../07-deployment/03-release-and-rollback|发布与回滚]]
---

# 运行模型与维护职责

维护者按上下文负责：core 维护图谱契约和解析正确性；dashboard 维护交互和 browser boundary；skill/agent 维护编排和 prompt；release 维护安装、CI、viewer 和版本；安全维护者处理漏洞报告和敏感数据边界。

日常运行重点：检查图谱 freshness、分析中间目录是否清理、CI 是否绿色、viewer 资产是否可下载、版本文件是否一致。仓库未定义集中式 telemetry 或 SaaS 控制面，因此诊断以本地日志、CI 日志、测试 fixture 和用户提供的图谱 issue 为主。
