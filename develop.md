## 需求分析

- 提供补全资源的接口, 可以自定义补全资源
- 实现基于LSP的补全
- 实现基于片段的补全
- 提供灵活的配置选项

## 设计实现

- 2024-01-05. 先把流程打通: 按键触发补全 -> 收集补全资源 -> 打开补全窗口, 显示补全内容 -> 关闭窗口