---
title: 一页看懂项目
formatter: yaml-frontmatter
id: LEARN-OVERVIEW-001
status: active
owner: architecture
updated: 2026-11-05
tags: [learning, product, overview]
links: [[README|架构学习指南]], [[03-architecture-from-30-feet|架构鸟瞰]], [[../01-product/01-vision|产品愿景]]
---

# 一页看懂项目

## 它是什么

Understand Anything 是一个开源开发者工具：把代码库、知识库或设计资料分析成知识图谱，再用可交互 dashboard、搜索、导览和自然语言入口帮助人理解系统。

## 它不是什么

它不是编译器、完整 IDE、代码生成器或托管式项目管理平台。它主要帮助人建立系统理解；LLM 生成的摘要和关系仍需通过源代码和图谱契约核验。

## 输入、处理、输出

```text
项目文件 / 知识库 / 设计资料
          |
          v
发现文件 -> 解析结构 -> 批量语义分析 -> 合并与校验
          |                              |
          +------ fingerprint / 增量 ------+
                                         v
                         knowledge-graph.json
                                         |
                                         v
                       dashboard / chat / diff / explain
```

## 为什么采用两类分析

静态分析适合回答“代码中实际存在什么结构”；LLM 适合回答“这些结构可能意味着什么、如何用自然语言解释”。把两者分开，既能减少模型幻觉对结构事实的影响，也能让模型补足业务语义。

## 初学者必须记住的四件事

1. `core` 是共享事实和契约中心。
2. `skills` 与 `agents` 是任务编排层，不等于核心分析引擎。
3. `dashboard` 是图谱消费者，不应偷偷定义后端事实。
4. 测试和 schema 是理解系统的可靠证据，不能只看 UI。
