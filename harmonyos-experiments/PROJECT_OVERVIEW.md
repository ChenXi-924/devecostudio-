# HarmonyOS 实验代码概览

## 项目简介

本项目是一个全面的 HarmonyOS（鸿蒙系统）开发实验代码集合，旨在帮助开发者快速学习和掌握 HarmonyOS 应用开发的核心技术。

## 📊 项目统计

- **代码文件数量**: 7 个 .ets 文件
- **配置文件**: 2 个 .json5 文件
- **文档文件**: 4 个 .md 文件
- **总代码行数**: 2000+ 行
- **示例类别**: 6 大类
- **覆盖 API**: 20+ 个

## 🎯 适用人群

- ✅ HarmonyOS 初学者
- ✅ Android/iOS 开发者转型
- ✅ 大学生和培训学员
- ✅ 技术讲师和培训师
- ✅ 企业开发团队

## 📦 包含的示例

### 1. 基础应用 (basic-app)
**文件**: `Index.ets`  
**代码行数**: ~50 行  
**难度**: ⭐ 入门级

展示最基本的 HarmonyOS 应用结构，包括状态管理、事件处理和基础布局。

**核心概念**:
- @Entry、@Component 装饰器
- @State 状态管理
- onClick 事件处理
- Column、Button、Text 组件

### 2. UI 组件示例 (ui-components)

#### 2.1 综合组件展示
**文件**: `UIComponentsDemo.ets`  
**代码行数**: ~150 行  
**难度**: ⭐⭐ 初级

展示 6 种常用 UI 组件的使用方法。

**包含组件**:
- TextInput (文本输入框)
- Slider (滑动条)
- Toggle (开关)
- Radio (单选按钮)
- Progress (进度条)
- Image (图片)

#### 2.2 列表应用
**文件**: `ListDemo.ets`  
**代码行数**: ~110 行  
**难度**: ⭐⭐ 初级

实现一个功能完整的待办事项列表应用。

**核心功能**:
- 添加待办事项
- 标记完成状态
- 删除事项
- 统计功能

### 3. 数据持久化 (data-storage)
**文件**: `DataStorageDemo.ets`  
**代码行数**: ~170 行  
**难度**: ⭐⭐⭐ 中级

演示如何使用 Preferences API 进行轻量级数据存储。

**核心功能**:
- 保存用户输入数据
- 读取已保存数据
- 清除所有数据
- 应用重启后数据保持

**涉及 API**:
- `@ohos.data.preferences`
- async/await 异步操作
- aboutToAppear 生命周期

### 4. 网络请求 (network)
**文件**: `NetworkDemo.ets`  
**代码行数**: ~200 行  
**难度**: ⭐⭐⭐ 中级

展示如何进行 HTTP 网络请求，包括 GET 和 POST 方法。

**核心功能**:
- GET 请求获取数据
- POST 请求提交数据
- 加载状态管理
- 错误处理
- JSON 数据解析

**涉及 API**:
- `@ohos.net.http`
- 异步网络操作
- 错误处理机制

### 5. 多媒体操作 (multimedia)
**文件**: `MultimediaDemo.ets`  
**代码行数**: ~220 行  
**难度**: ⭐⭐⭐⭐ 中高级

演示图片操作和音频播放功能。

**核心功能**:
- 图片缩放
- 图片旋转
- 音频播放控制
- 动画效果
- 资源管理

**涉及 API**:
- `@ohos.multimedia.media`
- Image 组件变换
- Animation 动画
- AVPlayer 音频播放器

### 6. 传感器应用 (sensors)
**文件**: `SensorDemo.ets`  
**代码行数**: ~260 行  
**难度**: ⭐⭐⭐⭐ 中高级

展示如何使用设备传感器获取实时数据。

**包含传感器**:
- 加速度传感器 (Accelerometer)
- 陀螺仪传感器 (Gyroscope)
- 光线传感器 (Ambient Light)

**核心功能**:
- 传感器事件监听
- 实时数据显示
- 传感器生命周期管理
- 节能优化

**涉及 API**:
- `@ohos.sensor`
- 事件监听机制
- aboutToDisappear 清理

## 📚 配套文档

### 1. README.md
主文档，提供项目概览、功能特性、使用方法等信息。

### 2. GETTING_STARTED.md
快速开始指南，帮助新手快速配置环境和运行项目。

**包含内容**:
- 环境准备
- 项目导入
- 运行调试
- 常见问题

### 3. API_REFERENCE.md
API 参考文档，详细说明各个示例中使用的 API。

**包含 API**:
- 基础组件 API
- 容器组件 API
- 表单组件 API
- 数据存储 API
- 网络请求 API
- 多媒体 API
- 传感器 API

### 4. TUTORIAL_CN.md
中文教程，深入讲解 ArkTS 语法和开发技巧。

**包含内容**:
- ArkTS 语法基础
- 组件开发详解
- 实验示例讲解
- 布局技巧
- 调试方法
- 最佳实践

## 🛠️ 配置文件

### 1. app.json5
应用级配置文件，定义应用的基本信息。

**配置项**:
- bundleName: 应用包名
- versionCode: 版本号
- versionName: 版本名称
- targetAPIVersion: 目标 API 版本

### 2. module.json5
模块级配置文件，定义模块的能力和权限。

**配置项**:
- abilities: 应用能力定义
- pages: 页面路径配置
- requestPermissions: 权限声明

**已配置权限**:
- ohos.permission.INTERNET (网络访问)
- ohos.permission.ACCELEROMETER (加速度传感器)
- ohos.permission.GYROSCOPE (陀螺仪传感器)

## 🎓 学习路径建议

### 阶段 1: 入门 (1-2 天)
1. 阅读 README.md 了解项目
2. 学习 GETTING_STARTED.md 配置环境
3. 运行基础应用示例
4. 尝试修改代码观察效果

### 阶段 2: 基础 (3-5 天)
1. 学习 UI 组件示例
2. 理解状态管理机制
3. 完成待办事项列表
4. 阅读 TUTORIAL_CN.md 深入学习

### 阶段 3: 进阶 (1-2 周)
1. 学习数据持久化
2. 掌握网络请求
3. 实现多媒体操作
4. 使用传感器 API

### 阶段 4: 实战 (2-4 周)
1. 结合多个示例创建应用
2. 实现完整的项目功能
3. 优化性能和用户体验
4. 发布到应用市场

## 💡 代码特色

### 1. 完整注释
每个文件都包含详细的中英文注释，方便理解。

```typescript
/**
 * HarmonyOS 基础应用入口页面
 * Basic Application Entry Page for HarmonyOS
 */
```

### 2. 实用功能
所有示例都是可以直接运行的完整功能。

### 3. 最佳实践
代码遵循 HarmonyOS 开发最佳实践。

### 4. 错误处理
包含完善的错误处理机制。

```typescript
try {
  // 操作代码
} catch (err) {
  console.error('错误:', JSON.stringify(err))
}
```

### 5. 生命周期管理
正确使用组件生命周期方法。

```typescript
aboutToAppear() {
  // 初始化
}

aboutToDisappear() {
  // 清理资源
}
```

## 🔧 技术栈

- **开发语言**: ArkTS (TypeScript)
- **UI 框架**: ArkUI
- **开发工具**: DevEco Studio 4.0+
- **目标平台**: HarmonyOS API 9+
- **支持设备**: 手机、平板

## 📈 后续计划

### 短期 (1-3 个月)
- [ ] 添加更多 UI 组件示例
- [ ] 增加数据库操作示例
- [ ] 添加文件操作示例
- [ ] 增加更多实战项目

### 中期 (3-6 个月)
- [ ] 分布式能力示例
- [ ] 卡片开发示例
- [ ] 服务开发示例
- [ ] 性能优化指南

### 长期 (6-12 个月)
- [ ] 完整的应用开发教程
- [ ] 视频教程配套
- [ ] 在线学习平台
- [ ] 开发者社区

## 🤝 如何贡献

欢迎对本项目做出贡献！

### 贡献方式
1. 提交 Bug 报告
2. 提出新功能建议
3. 完善文档
4. 提交代码改进
5. 分享使用经验

### 贡献流程
1. Fork 本项目
2. 创建特性分支
3. 提交更改
4. 推送到分支
5. 创建 Pull Request

## 📄 许可证

MIT License - 可自由使用、修改和分发

## 👨‍💻 作者

ChenXi-924

## 🙏 致谢

感谢以下资源和社区：
- HarmonyOS 官方团队
- 开发者社区贡献者
- 所有提出建议的用户

## 📮 联系方式

- GitHub Issues: [提交问题](https://github.com/ChenXi-924/devecostudio-/issues)
- GitHub Discussions: [参与讨论](https://github.com/ChenXi-924/devecostudio-/discussions)

---

**最后更新**: 2024 年  
**文档版本**: v1.0.0

祝你学习愉快！🎉
