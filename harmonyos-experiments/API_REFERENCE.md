# HarmonyOS 实验代码 API 参考

本文档提供了实验代码中使用的主要 HarmonyOS API 的参考说明。

## 目录

- [基础组件](#基础组件)
- [容器组件](#容器组件)
- [表单组件](#表单组件)
- [数据存储](#数据存储)
- [网络请求](#网络请求)
- [多媒体](#多媒体)
- [传感器](#传感器)

---

## 基础组件

### Text

显示文本内容。

```typescript
Text('文本内容')
  .fontSize(20)           // 字体大小
  .fontWeight(FontWeight.Bold)  // 字体粗细
  .fontColor(Color.Blue)  // 字体颜色
  .textAlign(TextAlign.Center)  // 对齐方式
```

**常用属性：**
- `fontSize(number | string)` - 设置字体大小
- `fontWeight(FontWeight)` - 设置字体粗细
- `fontColor(Color | string)` - 设置字体颜色
- `textAlign(TextAlign)` - 设置文本对齐方式
- `maxLines(number)` - 设置最大行数

### Button

按钮组件。

```typescript
Button('按钮文本')
  .width(200)
  .height(50)
  .backgroundColor(Color.Blue)
  .onClick(() => {
    // 点击事件处理
  })
```

**常用属性：**
- `width(number | string)` - 设置宽度
- `height(number | string)` - 设置高度
- `backgroundColor(Color | string)` - 设置背景色
- `onClick(callback)` - 点击事件回调

### Image

图片显示组件。

```typescript
Image($r('app.media.icon'))  // 使用资源
  .width(100)
  .height(100)
  .borderRadius(10)
  .scale({ x: 1.5, y: 1.5 })  // 缩放
  .rotate({ angle: 45 })      // 旋转
```

**常用属性：**
- `width(number | string)` - 设置宽度
- `height(number | string)` - 设置高度
- `borderRadius(number)` - 设置圆角
- `scale(ScaleOptions)` - 设置缩放
- `rotate(RotateOptions)` - 设置旋转

---

## 容器组件

### Column

垂直布局容器。

```typescript
Column({ space: 20 }) {  // 子组件间距
  Text('文本1')
  Text('文本2')
}
.width('100%')
.height('100%')
.justifyContent(FlexAlign.Center)  // 主轴对齐
.alignItems(HorizontalAlign.Center)  // 交叉轴对齐
```

**常用属性：**
- `space` - 子组件间距
- `justifyContent(FlexAlign)` - 主轴对齐方式
- `alignItems(HorizontalAlign)` - 交叉轴对齐方式

### Row

水平布局容器。

```typescript
Row({ space: 10 }) {
  Text('左')
  Text('右')
}
.width('100%')
.justifyContent(FlexAlign.SpaceBetween)
```

### Scroll

可滚动容器。

```typescript
Scroll() {
  Column() {
    // 内容
  }
}
.height('100%')
```

### List

列表容器。

```typescript
List({ space: 10 }) {
  ForEach(dataArray, (item) => {
    ListItem() {
      // 列表项内容
    }
  })
}
```

---

## 表单组件

### TextInput

文本输入框。

```typescript
TextInput({ placeholder: '请输入', text: this.inputValue })
  .width('90%')
  .type(InputType.Normal)  // 输入类型
  .onChange((value: string) => {
    this.inputValue = value
  })
```

**输入类型：**
- `InputType.Normal` - 普通文本
- `InputType.Password` - 密码
- `InputType.Email` - 邮箱
- `InputType.Number` - 数字

### Slider

滑动条。

```typescript
Slider({
  value: this.sliderValue,
  min: 0,
  max: 100,
  step: 1,
  style: SliderStyle.OutSet
})
.onChange((value: number) => {
  this.sliderValue = value
})
```

### Toggle

开关组件。

```typescript
Toggle({ type: ToggleType.Switch, isOn: this.isToggled })
  .onChange((isOn: boolean) => {
    this.isToggled = isOn
  })
```

**类型：**
- `ToggleType.Switch` - 开关样式
- `ToggleType.Checkbox` - 复选框样式
- `ToggleType.Button` - 按钮样式

### Checkbox

复选框。

```typescript
Checkbox()
  .select(this.isChecked)
  .onChange((isChecked: boolean) => {
    this.isChecked = isChecked
  })
```

### Radio

单选按钮。

```typescript
Radio({ value: 'option1', group: 'radioGroup' })
  .checked(this.selectedValue === 'option1')
  .onChange((isChecked: boolean) => {
    if (isChecked) {
      this.selectedValue = 'option1'
    }
  })
```

---

## 数据存储

### Preferences

轻量级键值对数据存储。

```typescript
import preferences from '@ohos.data.preferences'

// 获取 Preferences 实例
let prefs = await preferences.getPreferences(getContext(), 'myPreferences')

// 保存数据
await prefs.put('key', 'value')
await prefs.flush()

// 读取数据
let value = await prefs.get('key', 'defaultValue')

// 删除数据
await prefs.delete('key')
await prefs.flush()

// 清空所有数据
await prefs.clear()
await prefs.flush()
```

**适用场景：**
- 应用配置信息
- 用户偏好设置
- 简单的键值对数据

---

## 网络请求

### HTTP

网络请求模块。

```typescript
import http from '@ohos.net.http'

// 创建 HTTP 请求
let httpRequest = http.createHttp()

// GET 请求
let response = await httpRequest.request(
  url,
  {
    method: http.RequestMethod.GET,
    header: {
      'Content-Type': 'application/json'
    },
    readTimeout: 10000,
    connectTimeout: 10000
  }
)

// POST 请求
let response = await httpRequest.request(
  url,
  {
    method: http.RequestMethod.POST,
    header: {
      'Content-Type': 'application/json'
    },
    extraData: JSON.stringify(data),
    readTimeout: 10000,
    connectTimeout: 10000
  }
)

// 销毁请求
httpRequest.destroy()
```

**请求方法：**
- `RequestMethod.GET` - GET 请求
- `RequestMethod.POST` - POST 请求
- `RequestMethod.PUT` - PUT 请求
- `RequestMethod.DELETE` - DELETE 请求

**响应对象：**
- `responseCode` - HTTP 状态码
- `result` - 响应数据
- `header` - 响应头

---

## 多媒体

### AVPlayer

音视频播放器。

```typescript
import media from '@ohos.multimedia.media'

// 创建播放器
let player = await media.createAVPlayer()

// 监听状态变化
player.on('stateChange', (state) => {
  console.info('播放器状态:', state)
})

// 监听错误
player.on('error', (err) => {
  console.error('播放器错误:', err)
})

// 设置媒体源
player.url = 'resource://RAWFILE/audio.mp3'

// 播放
await player.play()

// 暂停
await player.pause()

// 停止
await player.stop()

// 释放资源
await player.release()
```

**支持的格式：**
- 音频：MP3, AAC, WAV, FLAC
- 视频：MP4, MKV

---

## 传感器

### Sensor

传感器模块。

```typescript
import sensor from '@ohos.sensor'

// 监听加速度传感器
sensor.on(
  sensor.SensorId.ACCELEROMETER,
  (data: sensor.AccelerometerResponse) => {
    console.info(`X: ${data.x}, Y: ${data.y}, Z: ${data.z}`)
  },
  { interval: 100000000 }  // 100ms
)

// 监听陀螺仪传感器
sensor.on(
  sensor.SensorId.GYROSCOPE,
  (data: sensor.GyroscopeResponse) => {
    console.info(`X: ${data.x}, Y: ${data.y}, Z: ${data.z}`)
  },
  { interval: 100000000 }
)

// 监听光线传感器
sensor.on(
  sensor.SensorId.AMBIENT_LIGHT,
  (data: sensor.LightResponse) => {
    console.info(`强度: ${data.intensity}`)
  },
  { interval: 100000000 }
)

// 停止监听
sensor.off(sensor.SensorId.ACCELEROMETER)
sensor.off(sensor.SensorId.GYROSCOPE)
sensor.off(sensor.SensorId.AMBIENT_LIGHT)
```

**常用传感器：**
- `ACCELEROMETER` - 加速度传感器
- `GYROSCOPE` - 陀螺仪传感器
- `AMBIENT_LIGHT` - 光线传感器
- `MAGNETIC_FIELD` - 磁场传感器
- `PROXIMITY` - 接近传感器
- `ORIENTATION` - 方向传感器

---

## 装饰器

### @Entry

标记组件为页面入口。

```typescript
@Entry
@Component
struct Index {
  build() {
    // 页面内容
  }
}
```

### @Component

标记自定义组件。

```typescript
@Component
struct CustomComponent {
  build() {
    // 组件内容
  }
}
```

### @State

标记状态变量，变化时触发 UI 更新。

```typescript
@State counter: number = 0
```

### @Prop

标记从父组件传递的属性。

```typescript
@Prop title: string
```

---

## 生命周期

### aboutToAppear

组件即将出现时调用，适合初始化操作。

```typescript
async aboutToAppear() {
  // 初始化数据
  await this.loadData()
}
```

### aboutToDisappear

组件即将消失时调用，适合清理资源。

```typescript
aboutToDisappear() {
  // 释放资源
  this.cleanup()
}
```

---

## 动画

### animation

为组件添加动画效果。

```typescript
Text('动画文本')
  .scale({ x: this.scale, y: this.scale })
  .animation({
    duration: 300,           // 持续时间（毫秒）
    curve: Curve.EaseInOut,  // 动画曲线
    iterations: 1,           // 播放次数
    playMode: PlayMode.Normal  // 播放模式
  })
```

**动画曲线：**
- `Curve.Linear` - 线性
- `Curve.EaseIn` - 淡入
- `Curve.EaseOut` - 淡出
- `Curve.EaseInOut` - 淡入淡出

---

## 更多资源

- [HarmonyOS API 参考](https://developer.harmonyos.com/cn/docs/documentation/doc-references/syscap-0000001281201454)
- [ArkTS 组件库](https://developer.harmonyos.com/cn/docs/documentation/doc-references/ts-components-summary-0000001478181369)
- [ArkTS API 参考](https://developer.harmonyos.com/cn/docs/documentation/doc-references/js-apis-overview-0000001281321073)
