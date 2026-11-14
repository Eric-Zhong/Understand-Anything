# 10 架构学习指南

本目录面向第一次接触 Understand Anything 的工程师，用系统架构师视角把代码、数据、Agent、前端、测试和交付串成一条可学习的路径。内容分为两类：**代码事实**来自当前仓库；**工程建议**是可迁移到其他项目的推荐实践，文中会明确标注。

## 学习路线

1. [[01-learning-roadmap|学习路线]]：先建立整体心智模型
2. [[02-project-in-one-page|一页看懂项目]]：理解产品价值和边界
3. [[03-architecture-from-30-feet|架构鸟瞰]]：认识分层、模块和数据流
4. [[04-runtime-story|一次分析是怎样完成的]]：跟踪真实运行链路
5. [[05-domain-and-graph|领域与知识图谱]]：掌握核心业务语言
6. [[06-code-reading-guide|源码阅读指南]]：按风险和依赖阅读代码
7. [[07-engineering-practices|开发与设计实践]]：学习可复用的工程方法
8. [[08-testing-and-delivery|测试与交付]]：从 TDD/ATDD 到 CI 和发布
9. [[09-design-review-checklist|设计评审清单]]：独立判断方案质量
10. [[10-glossary-and-exercises|术语与练习]]：巩固概念并动手验证

## 已有文档的连接

- [[../04-architecture/01-system-overview|系统总览]]：正式架构文档
- [[../03-domain/03-knowledge-graph-contract|知识图谱契约]]：共享数据契约
- [[../05-implementation/01-repository-map|仓库地图]]：源码目录索引
- [[../06-testing/01-test-strategy|测试策略]]：完整测试策略
- [[../07-deployment/02-ci-cd|CI/CD 流程]]：交付流程
- [[../08-operations/02-troubleshooting|故障排查]]：运行手册

## 阅读约定

每篇文档的“仓库事实”回答“现在是什么”，“架构建议”回答“怎样做得更好”。遇到不确定内容，以源码、类型、测试和 CI 为准，不以图示或推测为准。
