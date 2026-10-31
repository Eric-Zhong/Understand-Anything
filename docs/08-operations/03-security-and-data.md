---
title: 安全与数据治理
formatter: yaml-frontmatter
id: OPS-SEC-001
status: active
owner: security-maintainers
updated: 2026-10-31
tags: [operations, security, privacy, data]
links: [[../04-architecture/04-security-architecture|安全架构]], [[02-troubleshooting|故障排查]], [[../03-domain/03-knowledge-graph-contract|知识图谱契约]]
---

# 安全与数据治理

分析输入可能是私有源代码，使用者应根据平台模型配置和组织政策决定是否允许外发。图谱、摘要、向量和中间结果都按敏感项目资产管理；共享时优先提交必要的 `.ua` 图谱，排除 `intermediate/` 和 `diff-overlay.json`。

源代码 endpoint 必须保持 token + 图谱路径 allowlist。对 agent/LLM 输出执行 schema 验证，避免将 prompt 注入或非法路径传播到浏览器。日志和 issue 不应包含 secrets、完整私有源码或 access token。漏洞按根目录 `SECURITY.md` 的渠道报告。
