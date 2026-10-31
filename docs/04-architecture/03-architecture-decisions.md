---
title: 架构决策记录
formatter: yaml-frontmatter
id: ARCH-ADR-001
status: active
owner: architecture
updated: 2026-10-31
tags: [architecture, adr, decisions]
links: [[01-system-overview|系统总览]], [[04-security-architecture|安全架构]], [[../00-governance/01-documentation-standard|文档标准]]
---

# 架构决策记录

## ADR-001：monorepo + pnpm workspace

**状态：已采用。** core、dashboard、viewer 和插件共享类型与构建约束，根脚本统一 lint/test；代价是发布需要关注 workspace lockfile 和版本同步。

## ADR-002：web-tree-sitter 优先于 native tree-sitter

**状态：已采用。** `CLAUDE.md` 明确 native bindings 在 darwin/arm64 + Node 24 存在失败风险，因此使用 WASM 和独立 Dart/Swift WASM 包。

## ADR-003：结构分析与语义分析分层

**状态：已采用。** Tree-sitter/parser 提供可重复结构事实，LLM agents 提供解释与领域语义，normalize/schema 负责汇合和治理。

## ADR-004：browser-safe subpath exports

**状态：已采用。** dashboard 仅从 `./search`、`./types`、`./schema` 等浏览器安全入口导入，避免把 Node 模块带进浏览器 bundle。

## ADR-005：图谱文件系统持久化

**状态：已采用。** 默认 `.ua`，兼容已有 `.understand-anything`，便于 git 提交、团队 onboarding 和 viewer 离线分发；临时中间结果明确排除。
