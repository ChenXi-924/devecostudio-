# HarmonyOS 实验代码教程

## 欢迎

欢迎使用 HarmonyOS 实验代码！本教程将帮助你快速上手 HarmonyOS 应用开发。

## 什么是 HarmonyOS？

HarmonyOS（鸿蒙系统）是华为推出的面向全场景的分布式操作系统。它基于微内核架构，支持多种设备形态，包括手机、平板、智能手表、智慧屏等。

### 主要特性

1. **分布式能力** - 多设备协同工作
2. **统一生态** - 一次开发，多端部署
3. **流畅体验** - 高性能的渲染引擎
4. **安全可靠** - 微内核架构保障安全

## ArkTS 语言简介

ArkTS 是 HarmonyOS 的主要开发语言，它是 TypeScript 的超集，专门为 HarmonyOS 优化。

### 基本语法

#### 1. 变量声明

```typescript
let name: string = '张三'
const age: number = 25
var isStudent: boolean = true
```

#### 2. 数组和对象

```typescript
// 数组
let numbers: number[] = [1, 2, 3, 4, 5]
let fruits: Array<string> = ['苹果', '香蕉', '橙子']

// 对象
interface Person {
  name: string
  age: number
}

let person: Person = {
  name: '李四',
  age: 30
}
```

#### 3. 函数

```typescript
// 普通函数
function add(a: number, b: number): number {
  return a + b
}

// 箭头函数
const multiply = (a: number, b: number): number => {
  return a * b
}
```

#### 4. 类

```typescript
class Student {
  name: string
  grade: number

  constructor(name: string, grade: number) {
    this.name = name
    this.grade = grade
  }

  study() {
    console.log(`${this.name} 正在学习`)
  }
}

let student = new Student('王五', 90)
student.study()
```

## ArkUI 组件开发

### 组件结构

每个 HarmonyOS 页面都是一个组件，基本结构如下：

```typescript
@Entry
@Component
struct PageName {
  // 状态变量
  @State message: string = 'Hello'

  // 生命周期 - 组件即将出现
  aboutToAppear() {
    console.info('页面即将显示')
  }

  // 构建 UI
  build() {
    Column() {
      Text(this.message)
    }
  }

  // 生命周期 - 组件即将消失
  aboutToDisappear() {
    console.info('页面即将销毁')
  }
}
```

### 装饰器说明

#### @Entry
标记为应用入口页面

```typescript
@Entry
@Component
struct Index {
  build() {
    // 页面内容
  }
}
```

#### @Component
标记为自定义组件

```typescript
@Component
struct MyComponent {
  build() {
    // 组件内容
  }
}
```

#### @State
标记状态变量，变化时自动更新 UI

```typescript
@State count: number = 0

// 修改 count 会触发 UI 更新
this.count++
```

#### @Prop
从父组件接收属性

```typescript
@Prop title: string
```

#### @Link
双向绑定父子组件数据

```typescript
@Link value: number
```

## 实验示例详解

### 实验 1：基础应用 - 计数器

**位置：** `harmonyos-experiments/basic-app/Index.ets`

**学习目标：**
- 理解组件基本结构
- 掌握状态管理
- 学习事件处理

**关键代码：**

```typescript
@State counter: number = 0

Button('点击我')
  .onClick(() => {
    this.counter++  // 修改状态，UI 自动更新
  })
```

**练习任务：**
1. 添加一个按钮，每次点击减 1
2. 添加显示奇偶性的文本
3. 当计数达到 10 时改变按钮颜色

### 实验 2：UI 组件

**位置：** `harmonyos-experiments/ui-components/UIComponentsDemo.ets`

**学习目标：**
- 掌握常用 UI 组件
- 理解数据绑定
- 学习表单控件使用

**核心组件：**

1. **TextInput - 文本输入**
```typescript
TextInput({ placeholder: '请输入' })
  .onChange((value: string) => {
    this.inputText = value
  })
```

2. **Slider - 滑动条**
```typescript
Slider({ value: this.sliderValue, min: 0, max: 100 })
  .onChange((value: number) => {
    this.sliderValue = value
  })
```

3. **Toggle - 开关**
```typescript
Toggle({ type: ToggleType.Switch, isOn: this.isToggled })
  .onChange((isOn: boolean) => {
    this.isToggled = isOn
  })
```

**练习任务：**
1. 添加一个日期选择器
2. 创建一个颜色选择器
3. 实现表单验证功能

### 实验 3：列表应用

**位置：** `harmonyos-experiments/ui-components/ListDemo.ets`

**学习目标：**
- 掌握 List 组件
- 学习数组操作
- 理解 ForEach 循环

**关键代码：**

```typescript
@State todoList: TodoItem[] = []

List() {
  ForEach(this.todoList, (item: TodoItem, index: number) => {
    ListItem() {
      // 列表项内容
    }
  }, (item: TodoItem) => item.id.toString())
}
```

**数组操作：**

```typescript
// 添加项目
this.todoList.push({ id: Date.now(), title: '新任务', completed: false })

// 删除项目
this.todoList.splice(index, 1)

// 修改项目
this.todoList[index].completed = true
```

**练习任务：**
1. 添加编辑功能
2. 实现拖拽排序
3. 添加筛选功能（显示全部/已完成/未完成）

### 实验 4：数据持久化

**位置：** `harmonyos-experiments/data-storage/DataStorageDemo.ets`

**学习目标：**
- 掌握 Preferences API
- 理解异步操作
- 学习数据持久化

**保存数据：**

```typescript
import preferences from '@ohos.data.preferences'

// 1. 获取实例
let prefs = await preferences.getPreferences(getContext(), 'myData')

// 2. 保存数据
await prefs.put('userName', '张三')
await prefs.put('userAge', 25)

// 3. 刷新到磁盘
await prefs.flush()
```

**读取数据：**

```typescript
// 读取数据（第二个参数是默认值）
let userName = await prefs.get('userName', '')
let userAge = await prefs.get('userAge', 0)
```

**练习任务：**
1. 保存用户设置（主题、语言等）
2. 实现登录状态保持
3. 创建笔记本应用

### 实验 5：网络请求

**位置：** `harmonyos-experiments/network/NetworkDemo.ets`

**学习目标：**
- 掌握 HTTP 请求
- 理解异步网络操作
- 学习 JSON 数据处理

**GET 请求：**

```typescript
import http from '@ohos.net.http'

let httpRequest = http.createHttp()

let response = await httpRequest.request(
  'https://api.example.com/data',
  {
    method: http.RequestMethod.GET,
    header: { 'Content-Type': 'application/json' }
  }
)

if (response.responseCode === 200) {
  let data = JSON.parse(response.result.toString())
  console.info('数据：', data)
}

httpRequest.destroy()
```

**POST 请求：**

```typescript
let postData = { name: '张三', age: 25 }

let response = await httpRequest.request(
  'https://api.example.com/users',
  {
    method: http.RequestMethod.POST,
    header: { 'Content-Type': 'application/json' },
    extraData: JSON.stringify(postData)
  }
)
```

**练习任务：**
1. 创建天气查询应用
2. 实现新闻列表展示
3. 添加下拉刷新功能

### 实验 6：多媒体

**位置：** `harmonyos-experiments/multimedia/MultimediaDemo.ets`

**学习目标：**
- 掌握图片操作
- 学习音频播放
- 理解动画效果

**图片变换：**

```typescript
@State imageScale: number = 1
@State imageRotation: number = 0

Image($r('app.media.icon'))
  .scale({ x: this.imageScale, y: this.imageScale })
  .rotate({ angle: this.imageRotation })
  .animation({
    duration: 300,
    curve: Curve.EaseInOut
  })
```

**音频播放：**

```typescript
import media from '@ohos.multimedia.media'

let player = await media.createAVPlayer()
player.url = 'resource://RAWFILE/audio.mp3'
await player.play()  // 播放
await player.pause()  // 暂停
await player.stop()  // 停止
```

**练习任务：**
1. 创建图片查看器
2. 实现音乐播放器
3. 添加视频播放功能

### 实验 7：传感器

**位置：** `harmonyos-experiments/sensors/SensorDemo.ets`

**学习目标：**
- 掌握传感器 API
- 理解事件监听
- 学习资源管理

**监听传感器：**

```typescript
import sensor from '@ohos.sensor'

// 加速度传感器
sensor.on(
  sensor.SensorId.ACCELEROMETER,
  (data: sensor.AccelerometerResponse) => {
    console.info(`X: ${data.x}, Y: ${data.y}, Z: ${data.z}`)
  },
  { interval: 100000000 }  // 100ms
)

// 停止监听
sensor.off(sensor.SensorId.ACCELEROMETER)
```

**练习任务：**
1. 创建计步器应用
2. 实现摇一摇功能
3. 制作指南针应用

## 布局技巧

### 1. Column 垂直布局

```typescript
Column({ space: 20 }) {  // 子组件间距 20
  Text('第一行')
  Text('第二行')
  Text('第三行')
}
.width('100%')
.justifyContent(FlexAlign.Center)  // 垂直居中
.alignItems(HorizontalAlign.Center)  // 水平居中
```

### 2. Row 水平布局

```typescript
Row({ space: 10 }) {
  Text('左')
  Text('中')
  Text('右')
}
.width('100%')
.justifyContent(FlexAlign.SpaceBetween)  // 两端对齐
```

### 3. Stack 堆叠布局

```typescript
Stack() {
  Image($r('app.media.background'))
  Text('叠加文本')
}
```

### 4. Flex 弹性布局

```typescript
Flex({ direction: FlexDirection.Row, wrap: FlexWrap.Wrap }) {
  Text('项目1').width('30%')
  Text('项目2').width('30%')
  Text('项目3').width('30%')
}
```

## 调试技巧

### 1. 日志输出

```typescript
console.info('信息日志')
console.debug('调试日志')
console.warn('警告日志')
console.error('错误日志')
```

### 2. 查看日志

在 DevEco Studio 中：
- 打开 `View` -> `Tool Windows` -> `Log`
- 选择设备和应用
- 查看实时日志

### 3. 断点调试

1. 在代码行号左侧点击设置断点
2. 以调试模式运行应用
3. 使用调试工具栏控制执行

## 常见错误和解决方案

### 1. 编译错误

**错误：** `Cannot find module '@ohos.xxx'`

**原因：** SDK 未正确安装或版本不匹配

**解决：**
- 检查 SDK Manager 中的 SDK 安装
- 确认 API 版本是否匹配
- 重新同步项目

### 2. 运行时错误

**错误：** `Permission denied`

**原因：** 未配置或未授予权限

**解决：**
- 在 `module.json5` 中添加权限声明
- 运行时请求权限（敏感权限）

### 3. 网络错误

**错误：** 网络请求失败

**原因：** 权限未配置或网络不可用

**解决：**
- 添加 `ohos.permission.INTERNET` 权限
- 检查设备网络连接
- 验证 URL 是否正确

## 最佳实践

### 1. 代码组织

- 一个文件一个组件
- 相关组件放在同一目录
- 使用有意义的文件名

### 2. 性能优化

- 避免在 build 方法中执行复杂计算
- 合理使用 @State，避免不必要的状态
- 及时释放资源（传感器、播放器等）

### 3. 用户体验

- 提供加载指示器
- 处理错误情况
- 给出明确的操作反馈

### 4. 代码风格

- 使用 TypeScript 类型
- 添加适当的注释
- 保持代码简洁清晰

## 进阶主题

### 1. 路由导航

```typescript
import router from '@ohos.router'

// 跳转页面
router.pushUrl({
  url: 'pages/Detail',
  params: { id: 123 }
})

// 返回上一页
router.back()
```

### 2. 自定义组件

```typescript
@Component
struct CustomButton {
  @Prop title: string
  @Prop onClick: () => void

  build() {
    Button(this.title)
      .onClick(this.onClick)
  }
}

// 使用
CustomButton({ title: '点击', onClick: () => {
  console.info('被点击了')
}})
```

### 3. 全局状态管理

使用 AppStorage 管理全局状态：

```typescript
// 设置全局变量
AppStorage.SetOrCreate('userName', '张三')

// 使用全局变量
@StorageLink('userName') userName: string = ''
```

## 项目实战

### 实战项目：简单的笔记应用

**功能需求：**
1. 查看笔记列表
2. 添加新笔记
3. 编辑笔记
4. 删除笔记
5. 数据持久化

**技术要点：**
- List 组件展示笔记
- TextInput 输入笔记内容
- Preferences 保存数据
- 路由跳转到详情页

**开发步骤：**

1. 创建数据模型
2. 设计界面布局
3. 实现列表展示
4. 添加增删改功能
5. 集成数据存储
6. 优化用户体验

## 学习资源

### 官方资源
- [HarmonyOS 官网](https://developer.harmonyos.com/)
- [开发文档](https://developer.harmonyos.com/cn/docs/documentation/doc-guides-V3/start-overview-0000001478104845-V3)
- [API 参考](https://developer.harmonyos.com/cn/docs/documentation/doc-references-V3/syscap-0000001281201454-V3)
- [代码示例](https://gitee.com/openharmony/applications_app_samples)

### 社区资源
- [开发者论坛](https://developer.huawei.com/consumer/cn/forum/)
- [Stack Overflow](https://stackoverflow.com/questions/tagged/harmonyos)
- [GitHub 项目](https://github.com/topics/harmonyos)

## 结语

恭喜你完成 HarmonyOS 实验代码的学习！

通过这些实验，你已经掌握了：
- ArkTS 基本语法
- ArkUI 组件使用
- 状态管理
- 数据持久化
- 网络请求
- 多媒体操作
- 传感器使用

**下一步建议：**
1. 完成所有练习任务
2. 创建自己的应用项目
3. 深入学习分布式特性
4. 参与开源社区

祝你在 HarmonyOS 开发之路上越走越远！🚀

---

如有问题，欢迎在 [Issues](https://github.com/ChenXi-924/devecostudio-/issues) 中提问。
