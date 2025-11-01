/**
 * HarmonyOS 基础应用入口页面
 * Basic Application Entry Page for HarmonyOS
 */

@Entry
@Component
struct Index {
  @State message: string = '欢迎使用鸿蒙系统 Welcome to HarmonyOS'
  @State counter: number = 0

  build() {
    Column() {
      // 标题
      Text(this.message)
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .fontColor(Color.Blue)
        .margin({ top: 50, bottom: 20 })

      // 计数器显示
      Text(`点击次数: ${this.counter}`)
        .fontSize(20)
        .margin({ bottom: 20 })

      // 增加按钮
      Button('点击我 Click Me')
        .onClick(() => {
          this.counter++
        })
        .width(200)
        .height(50)
        .fontSize(18)
        .margin({ bottom: 10 })

      // 重置按钮
      Button('重置 Reset')
        .onClick(() => {
          this.counter = 0
        })
        .width(200)
        .height(50)
        .fontSize(18)
        .backgroundColor(Color.Gray)

    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
    .backgroundColor('#F1F3F5')
  }
}
