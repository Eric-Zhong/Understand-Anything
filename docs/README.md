# 项目工程文档

本目录是 Understand Anything 的工程文档入口。新建文档按软件工程生命周期编号，便于人和 AI 由上至下定位；既有专题资料保留原路径，不被本体系改写。

## 文档地图

- [[00-governance/README|00 文档治理]]：命名、Front Matter、Wikilink 与变更规则
- [[01-product/README|01 产品与范围]]：愿景、用户、能力边界与路线
- [[02-requirements/README|02 需求工程]]：需求、用例、质量属性与验收标准
- [[03-domain/README|03 领域模型]]：DDD 领域、上下文、知识图谱模型
- [[04-architecture/README|04 系统架构]]：容器、数据流、关键决策与安全边界
- [[05-implementation/README|05 实现地图]]：仓库、包、Agent pipeline 与平台适配
- [[06-testing/README|06 测试工程]]：TDD/ATDD 策略、测试目录与质量门禁
- [[07-deployment/README|07 部署交付]]：安装、CI/CD、发布与回滚
- [[08-operations/README|08 运维手册]]：运行维护、故障排查、安全与数据治理
- [[09-traceability/README|09 追踪矩阵]]：需求到设计、实现、测试和运维的映射

## 既有资料（受保护）

- `benchmarks/`：基准与样例
- `incremental/`：增量分析审计
- `superpowers/`：历史设计与实施计划

这些文件不符合新体系的 Front Matter 要求时，仍保持原样；新文档只通过链接引用。

## 阅读路径

首次了解项目：[[01-product/01-vision|产品愿景]] → [[04-architecture/01-system-overview|系统总览]] → [[05-implementation/01-repository-map|仓库地图]]。
准备开发：[[02-requirements/01-system-requirements|系统需求]] → [[03-domain/01-bounded-contexts|限界上下文]] → [[06-testing/01-test-strategy|测试策略]]。
准备发布：[[07-deployment/01-installation|安装部署]] → [[07-deployment/02-ci-cd|CI/CD]] → [[08-operations/02-troubleshooting|故障排查]]。
