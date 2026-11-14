---
title: 术语与练习
formatter: yaml-frontmatter
id: LEARN-EXERCISE-001
status: active
owner: architecture
updated: 2026-11-05
tags: [learning, glossary, exercises]
links: [[01-learning-roadmap|学习路线]], [[05-domain-and-graph|领域与图谱]], [[09-design-review-checklist|设计评审清单]]
---

# 术语与练习

## 必会术语

- **AST**：源代码的抽象语法树，适合提取结构事实。
- **WASM**：可移植的 WebAssembly；本项目用 web-tree-sitter/WASM 降低 native binding 风险。
- **Schema**：数据形状和不变量的可执行约束。
- **Fingerprint**：用于比较文件变化的稳定摘要。
- **Incremental**：只处理变化或受影响范围的更新策略。
- **Subpath export**：包只暴露指定入口，控制依赖和运行环境边界。
- **Fixture**：可重复的测试输入和预期样例。
- **ADR**：记录架构决策、背景、选择和代价的文档。

## 练习一：画图

画出 `/understand` 从用户输入到 dashboard 的 8 个步骤，并在每一步标出输入、输出和失败点。完成后对照 [[04-runtime-story|运行时故事]]。

## 练习二：读契约

打开 core 的 `types.ts` 和 `schema.ts`，选择一个节点类型，写出三条不变量和两条非法输入。为它增加测试时，不要修改已有测试语义。

## 练习三：读增量

阅读 fingerprint、change classifier 和 staleness 测试，回答：文件内容变化、仅注释变化、导入变化分别可能触发什么更新？把“事实”和“推测”分开记录。

## 练习四：做一次设计评审

假设新增一个“导出图谱为 CSV”功能，使用 [[09-design-review-checklist|设计评审清单]] 说明它应放在哪一层、如何处理大图、如何测试、如何回滚。

## 练习五：解释给别人

不用代码术语，向另一位初学者解释：为什么项目同时需要静态分析和 LLM，为什么 dashboard 不能直接依赖 core 主入口，为什么临时 intermediate 结果不应提交。
