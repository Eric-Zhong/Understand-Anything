---
title: 安全架构
formatter: yaml-frontmatter
id: ARCH-SEC-001
status: active
owner: security-maintainers
updated: 2026-10-31
tags: [architecture, security, trust-boundary]
links: [[01-system-overview|系统总览]], [[../08-operations/03-security-and-data|安全与数据治理]], [[../02-requirements/03-quality-attributes|质量属性]]
---

# 安全架构

## 信任边界

- **源代码边界**：分析目标可能含私有代码；安装和运行默认在用户本机，模型提供商边界由平台配置决定。
- **LLM 边界**：prompt 输入和返回结果都应视为不完全可信，必须经过 normalize/schema 校验。
- **浏览器边界**：viewer/dashboard 的文件查看通过 token 与图谱派生的路径 allowlist 限制，不能任意读取本机文件。
- **仓库边界**：`.ua/intermediate/`、diff overlay 等临时数据不得误提交；CI secrets 不应写入图谱。

## 控制

1. 仅允许图谱中已知路径通过文件内容 endpoint。
2. 对图谱和外部 agent 输出进行 schema validation、sanitize 和 issue 展示。
3. 安装脚本、依赖和平台 manifest 变更需通过代码审查与 CI。
4. 发现安全问题遵循仓库 `SECURITY.md`，不在公开 issue 泄漏细节。
