# HarmonyOS 实验代码快速开始指南

## 环境准备

### 1. 安装 DevEco Studio

1. 访问 [HarmonyOS 开发者官网](https://developer.harmonyos.com/)
2. 下载最新版本的 DevEco Studio
3. 按照安装向导完成安装
4. 首次启动时配置 Node.js 和 SDK

### 2. 配置 SDK

1. 打开 DevEco Studio
2. 进入 `File` -> `Settings` -> `SDK`
3. 下载 HarmonyOS SDK (API 9 或更高)
4. 等待 SDK 下载和安装完成

### 3. 配置签名

#### 自动签名（推荐）
1. 打开项目
2. 进入 `File` -> `Project Structure` -> `Signing Configs`
3. 选择 `Automatically generate signature`
4. 点击 `Apply` 和 `OK`

#### 手动签名
1. 准备签名证书（.p12 文件）和 profile 文件
2. 在 `Project Structure` 中配置签名信息
3. 应用配置

## 导入和运行项目

### 方法一：从 GitHub 克隆

```bash
# 克隆仓库
git clone https://github.com/ChenXi-924/devecostudio-.git

# 进入项目目录
cd devecostudio-/harmonyos-experiments
```

### 方法二：下载压缩包

1. 访问 GitHub 仓库页面
2. 点击 `Code` -> `Download ZIP`
3. 解压到本地目录

### 导入到 DevEco Studio

1. 打开 DevEco Studio
2. 选择 `File` -> `Open`
3. 浏览并选择 `harmonyos-experiments` 目录
4. 点击 `OK` 等待项目导入和同步

### 运行项目

#### 使用真机调试

1. 通过 USB 连接 HarmonyOS 设备
2. 在设备上启用开发者模式和 USB 调试
3. 在 DevEco Studio 中选择设备
4. 点击 `Run` 按钮（或按 `Shift + F10`）

#### 使用模拟器

1. 打开 `Tools` -> `Device Manager`
2. 创建新的虚拟设备或启动已有设备
3. 等待模拟器启动完成
4. 点击 `Run` 按钮运行应用

## 示例代码说明

### 1. 基础应用 - 计数器

位置：`harmonyos-experiments/basic-app/Index.ets`

**学习要点：**
- `@Entry` 和 `@Component` 装饰器的使用
- `@State` 状态管理
- Button 的 onClick 事件处理
- Column 布局的使用

**运行效果：**
- 显示欢迎文本
- 显示点击次数
- 点击按钮增加计数
- 点击重置按钮清零

### 2. UI 组件示例

位置：`harmonyos-experiments/ui-components/UIComponentsDemo.ets`

**学习要点：**
- TextInput、Slider、Toggle 等组件
- 数据双向绑定
- Scroll 组件实现滚动
- Divider 分隔线的使用

**包含的组件：**
- 文本输入框
- 滑动条
- 开关
- 单选按钮
- 进度条
- 图片

### 3. 列表示例 - 待办事项

位置：`harmonyos-experiments/ui-components/ListDemo.ets`

**学习要点：**
- List 和 ListItem 组件
- ForEach 循环渲染
- 数组操作（添加、删除）
- Checkbox 复选框使用

**功能特性：**
- 添加待办事项
- 标记完成状态
- 删除事项
- 统计总数和完成数

### 4. 数据持久化

位置：`harmonyos-experiments/data-storage/DataStorageDemo.ets`

**学习要点：**
- Preferences API 的使用
- 异步操作 (async/await)
- 数据的保存和读取
- 页面生命周期（aboutToAppear）

**功能特性：**
- 保存用户输入
- 应用重启后数据保持
- 清除所有数据

### 5. 网络请求

位置：`harmonyos-experiments/network/NetworkDemo.ets`

**学习要点：**
- http 模块的使用
- GET 和 POST 请求
- 异步请求处理
- 加载状态管理

**注意事项：**
- 需要配置网络权限
- 处理网络异常
- JSONPlaceholder 是测试用的免费 API

### 6. 多媒体操作

位置：`harmonyos-experiments/multimedia/MultimediaDemo.ets`

**学习要点：**
- Image 组件的变换（scale、rotate）
- Animation 动画配置
- AVPlayer 音频播放器
- 资源管理和释放

**功能特性：**
- 图片缩放和旋转
- 音频播放控制
- 动画过渡效果

### 7. 传感器使用

位置：`harmonyos-experiments/sensors/SensorDemo.ets`

**学习要点：**
- sensor 模块的使用
- 传感器事件监听
- 实时数据更新
- 资源释放（aboutToDisappear）

**包含的传感器：**
- 加速度传感器
- 陀螺仪传感器
- 光线传感器

## 常见问题解决

### 1. 编译错误

**问题：** "Cannot find module '@ohos.xxx'"

**解决方法：**
- 确保 SDK 已正确安装
- 检查 API 版本是否匹配
- 重新同步项目：`File` -> `Sync Project with Gradle Files`

### 2. 设备连接问题

**问题：** 设备未识别

**解决方法：**
- 检查 USB 线是否正常
- 在设备上重新授权 USB 调试
- 重启 ADB：`Tools` -> `Device Manager` -> `Restart ADB`

### 3. 签名错误

**问题：** "Signature verification failed"

**解决方法：**
- 重新配置签名
- 确保证书和 profile 文件有效
- 清理项目：`Build` -> `Clean Project`

### 4. 网络请求失败

**问题：** 网络请求返回错误

**解决方法：**
- 检查网络权限配置
- 确保设备有网络连接
- 检查请求的 URL 是否正确

### 5. 模拟器性能问题

**问题：** 模拟器运行缓慢

**解决方法：**
- 分配更多内存给模拟器
- 关闭其他占用资源的程序
- 使用真机测试

## 进阶学习

### 推荐学习路径

1. **基础知识**
   - ArkTS 语法
   - 组件和布局
   - 状态管理

2. **进阶功能**
   - 路由和页面跳转
   - 数据库操作（关系型数据库）
   - 文件操作

3. **高级特性**
   - 分布式数据管理
   - 跨设备调用
   - 后台任务

4. **性能优化**
   - 渲染优化
   - 内存管理
   - 启动优化

### 推荐资源

- [HarmonyOS 官方文档](https://developer.harmonyos.com/cn/docs/documentation/doc-guides/harmonyos-overview-0000000000011903)
- [ArkTS 教程](https://developer.harmonyos.com/cn/docs/documentation/doc-guides/arkts-get-started-0000001504769321)
- [代码示例](https://gitee.com/openharmony/applications_app_samples)
- [开发者论坛](https://developer.huawei.com/consumer/cn/forum/home)

## 下一步

完成基础示例后，可以尝试：

1. **修改现有示例**
   - 改变 UI 样式和布局
   - 添加新的功能
   - 优化用户体验

2. **创建自己的应用**
   - 结合多个示例功能
   - 实现完整的应用逻辑
   - 发布到应用市场

3. **学习更多特性**
   - 分布式能力
   - 卡片开发
   - 服务开发

## 获取帮助

如果遇到问题：

1. 查看本项目的 [Issues](https://github.com/ChenXi-924/devecostudio-/issues)
2. 阅读官方文档
3. 在开发者论坛提问
4. 提交新的 Issue

祝你学习愉快！🎉
