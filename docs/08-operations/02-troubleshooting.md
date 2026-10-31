---
title: 故障排查
formatter: yaml-frontmatter
id: OPS-TS-001
status: active
owner: maintainers
updated: 2026-10-31
tags: [operations, troubleshooting, runbook]
links: [[01-operating-model|运行模型]], [[../07-deployment/01-installation|安装部署]], [[../04-architecture/02-runtime-dataflow|运行时数据流]]
---

# 故障排查

| 症状 | 排查顺序 |
|---|---|
| 找不到 skill | 确认平台入口、安装脚本结果、重启 CLI/IDE、检查 manifest |
| 图谱加载失败 | 确认 `.ua`/legacy 目录、JSON 完整性、schema issue、运行对应 core tests |
| 图谱过期 | 检查目标项目变更、fingerprint、post-commit hook 和 freshness banner，必要时全量 `/understand` |
| dashboard 空白 | 检查 browser-safe core imports、Vite build、浏览器控制台和图谱 schema |
| native parser 崩溃 | 优先确认使用 web-tree-sitter/WASM，不要强制 native binding |
| CI 失败 | 按 install → lint → build → core test → skill test → Python test 顺序定位；保留失败日志 |
| viewer 不可用 | 检查 tarball 固定名称、dashboard build、middleware 镜像和 release asset |

不要通过删除用户图谱或跳过 schema 校验来“修复”问题；先保留现场并记录最小复现。
