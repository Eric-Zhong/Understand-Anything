---
title: 面向初学者的学习路线
formatter: yaml-frontmatter
id: LEARN-ROADMAP-001
status: active
owner: architecture
updated: 2026-11-05
tags: [learning, architecture, beginner]
links: [[README|架构学习指南]], [[02-project-in-one-page|一页看懂项目]], [[06-code-reading-guide|源码阅读指南]]
---

# 面向初学者的学习路线

## 第一阶段：先会使用

目标是知道产品解决什么问题，而不是马上读懂所有源码。阅读 [[02-project-in-one-page|一页看懂项目]]，理解 `/understand`、dashboard、知识图谱和增量分析，再按照仓库 README 完成一次本地安装。

## 第二阶段：建立系统模型

阅读 [[03-architecture-from-30-feet|架构鸟瞰]] 和 [[04-runtime-story|一次分析是怎样完成的]]。你需要能回答：输入是什么、谁负责解析、LLM 在哪里参与、图谱在哪里保存、dashboard 怎样消费结果。

## 第三阶段：掌握核心概念

阅读 [[05-domain-and-graph|领域与知识图谱]]，画出 Project、File、Symbol、Node、Edge、Fingerprint、Batch 的关系。再阅读 [[06-code-reading-guide|源码阅读指南]]，从入口和测试反向验证理解。

## 第四阶段：学习工程方法

阅读 [[07-engineering-practices|开发与设计实践]]、[[08-testing-and-delivery|测试与交付]]，把“能运行”升级为“可维护、可测试、可发布”。

## 第五阶段：独立评审

用 [[09-design-review-checklist|设计评审清单]] 审查一次新增功能，再完成 [[10-glossary-and-exercises|术语与练习]]。达到以下标准，说明已经入门：能定位模块、能写一个契约测试、能解释一次失败、能提出一个有证据的改进方案。
