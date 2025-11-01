# HarmonyOS (鸿蒙系统) 实验代码

这是一个 HarmonyOS 开发的实验代码集合，包含了多个实用的示例程序，帮助开发者快速学习和掌握 HarmonyOS 应用开发。

## 📋 项目结构

```
harmonyos-experiments/
├── basic-app/              # 基础应用示例
│   └── Index.ets           # 应用入口页面（计数器示例）
├── ui-components/          # UI 组件示例
│   ├── UIComponentsDemo.ets    # 各种 UI 组件的使用
│   └── ListDemo.ets           # 列表组件（待办事项列表）
├── data-storage/           # 数据持久化示例
│   └── DataStorageDemo.ets    # 使用 Preferences 存储数据
├── network/                # 网络请求示例
│   └── NetworkDemo.ets        # HTTP GET/POST 请求
├── multimedia/             # 多媒体示例
│   └── MultimediaDemo.ets     # 图片操作和音频播放
├── sensors/                # 传感器示例
│   └── SensorDemo.ets         # 加速度、陀螺仪、光线传感器
├── app.json5               # 应用配置文件
└── module.json5            # 模块配置文件（含权限配置）
```

## 🚀 功能特性

### 1. 基础应用 (basic-app)
- ✅ 状态管理 (@State)
- ✅ 事件处理 (onClick)
- ✅ 基础布局 (Column, Row)
- ✅ 按钮和文本组件

**主要功能：**
- 点击计数器
- 重置功能
- 响应式 UI 更新

### 2. UI 组件 (ui-components)
- ✅ 文本输入框 (TextInput)
- ✅ 滑动条 (Slider)
- ✅ 开关 (Toggle)
- ✅ 单选按钮 (Radio)
- ✅ 进度条 (Progress)
- ✅ 图片显示 (Image)
- ✅ 列表组件 (List)
- ✅ 复选框 (Checkbox)

**UI 组件示例包含：**
- 各种表单控件的使用方法
- 数据双向绑定
- 动态列表渲染
- 待办事项管理应用

### 3. 数据持久化 (data-storage)
- ✅ Preferences API 使用
- ✅ 数据保存和读取
- ✅ 数据清除功能
- ✅ 应用重启后数据保持

**存储功能：**
- 保存用户输入的数据
- 应用启动时自动加载数据
- 清除所有保存的数据

### 4. 网络请求 (network)
- ✅ HTTP GET 请求
- ✅ HTTP POST 请求
- ✅ 请求状态管理
- ✅ 响应数据展示
- ✅ 错误处理

**网络功能：**
- 使用 JSONPlaceholder API 测试
- 支持自定义请求 URL
- 显示请求和响应详情
- 加载状态指示器

### 5. 多媒体 (multimedia)
- ✅ 图片缩放和旋转
- ✅ 音频播放控制
- ✅ 动画效果
- ✅ 媒体资源管理

**多媒体功能：**
- 图片的放大、缩小、旋转操作
- 音频播放、暂停、停止控制
- 平滑的动画过渡效果

### 6. 传感器 (sensors)
- ✅ 加速度传感器 (Accelerometer)
- ✅ 陀螺仪传感器 (Gyroscope)
- ✅ 光线传感器 (Ambient Light)
- ✅ 实时数据显示
- ✅ 传感器生命周期管理

**传感器功能：**
- 实时监测设备传感器数据
- 三轴加速度和角速度显示
- 环境光照强度检测
- 节能的传感器管理

## 🛠️ 开发环境要求

- **DevEco Studio**: 4.0 或更高版本
- **SDK**: HarmonyOS API 9 或更高版本
- **开发语言**: ArkTS (TypeScript)
- **目标设备**: 手机、平板

## 📦 如何使用

### 1. 克隆项目
```bash
git clone https://github.com/ChenXi-924/devecostudio-.git
cd devecostudio-/harmonyos-experiments
```

### 2. 导入项目
1. 打开 DevEco Studio
2. 选择 `File` -> `Open`
3. 选择 `harmonyos-experiments` 目录
4. 等待项目同步完成

### 3. 配置签名
1. 在 DevEco Studio 中配置自动签名
2. 或者手动配置签名证书

### 4. 运行应用
1. 连接 HarmonyOS 设备或启动模拟器
2. 点击 `Run` 按钮或按 `Shift + F10`
3. 选择要运行的示例页面

### 5. 查看不同示例
修改主页面入口，在 `module.json5` 的 `pages` 配置中选择不同的页面：

```json
"pages": [
  "pages/Index",                          // 基础应用
  "pages/UIComponentsDemo",               // UI 组件
  "pages/ListDemo",                       // 列表示例
  "pages/DataStorageDemo",                // 数据存储
  "pages/NetworkDemo",                    // 网络请求
  "pages/MultimediaDemo",                 // 多媒体
  "pages/SensorDemo"                      // 传感器
]
```

## 🔑 权限配置

应用需要以下权限（已在 `module.json5` 中配置）：

```json
{
  "requestPermissions": [
    {
      "name": "ohos.permission.INTERNET",
      "reason": "访问网络获取数据"
    },
    {
      "name": "ohos.permission.ACCELEROMETER",
      "reason": "访问加速度传感器"
    },
    {
      "name": "ohos.permission.GYROSCOPE",
      "reason": "访问陀螺仪传感器"
    }
  ]
}
```

## 📚 学习资源

### 官方文档
- [HarmonyOS 开发者官网](https://developer.harmonyos.com/)
- [ArkTS 语法指南](https://developer.harmonyos.com/cn/docs/documentation/doc-guides/arkts-get-started-0000001504769321)
- [ArkUI 组件参考](https://developer.harmonyos.com/cn/docs/documentation/doc-references/ts-components-summary-0000001478181369)

### 代码示例说明

#### 基础应用示例
```typescript
@Entry
@Component
struct Index {
  @State counter: number = 0  // 状态变量
  
  build() {
    Column() {
      Text(`计数: ${this.counter}`)
      Button('点击')
        .onClick(() => {
          this.counter++  // 更新状态
        })
    }
  }
}
```

#### 网络请求示例
```typescript
import http from '@ohos.net.http'

let httpRequest = http.createHttp()
let response = await httpRequest.request(url, {
  method: http.RequestMethod.GET,
  header: { 'Content-Type': 'application/json' }
})
```

#### 数据存储示例
```typescript
import preferences from '@ohos.data.preferences'

let prefs = await preferences.getPreferences(getContext(), 'myData')
await prefs.put('key', 'value')
await prefs.flush()
let value = await prefs.get('key', '')
```

## 🎯 适用场景

这些示例代码适用于：
- HarmonyOS 初学者学习基础开发
- 快速了解 ArkTS 和 ArkUI 框架
- 作为项目开发的参考代码
- 教学和培训场景
- 原型开发和功能验证

## 💡 开发技巧

1. **状态管理**: 使用 `@State` 装饰器管理组件状态
2. **生命周期**: 合理使用 `aboutToAppear` 和 `aboutToDisappear`
3. **资源管理**: 及时释放不需要的资源（如传感器、音频播放器）
4. **错误处理**: 使用 try-catch 捕获异常
5. **性能优化**: 避免在 build 方法中进行复杂计算
6. **响应式设计**: 使用百分比和权重实现自适应布局

## 🐛 常见问题

### Q: 网络请求失败？
**A**: 确保已配置 `ohos.permission.INTERNET` 权限，并检查网络连接。

### Q: 传感器数据不更新？
**A**: 检查是否已配置传感器权限，并确保设备支持相应的传感器。

### Q: 数据无法保存？
**A**: 检查 Preferences 初始化是否成功，确保使用了正确的 context。

### Q: 音频无法播放？
**A**: 确保音频文件已正确放置在 `rawfile` 目录中，并检查文件格式。

## 🔄 版本历史

### v1.0.0 (2024)
- ✨ 初始版本发布
- 📦 包含 6 大类实验示例
- 📝 完整的中文文档
- 🎨 统一的 UI 设计风格

## 🤝 贡献

欢迎提交 Issue 和 Pull Request 来改进这个项目！

### 贡献指南
1. Fork 本项目
2. 创建特性分支 (`git checkout -b feature/AmazingFeature`)
3. 提交更改 (`git commit -m 'Add some AmazingFeature'`)
4. 推送到分支 (`git push origin feature/AmazingFeature`)
5. 开启 Pull Request

## 📄 许可证

本项目采用 MIT 许可证 - 查看 [LICENSE](LICENSE) 文件了解详情

## 👨‍💻 作者

ChenXi-924

## 🙏 致谢

感谢 HarmonyOS 开发团队提供的优秀开发平台和文档！

---

**Happy Coding! 🎉**

如有问题或建议，欢迎在 [Issues](https://github.com/ChenXi-924/devecostudio-/issues) 中反馈。