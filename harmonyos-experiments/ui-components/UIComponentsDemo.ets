/**
 * HarmonyOS UI 组件示例
 * UI Components Examples for HarmonyOS
 */

@Entry
@Component
struct UIComponentsDemo {
  @State inputText: string = ''
  @State sliderValue: number = 50
  @State isToggled: boolean = false
  @State selectedIndex: number = 0

  build() {
    Scroll() {
      Column({ space: 20 }) {
        Text('HarmonyOS UI 组件示例')
          .fontSize(28)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 20 })

        // 文本输入框示例
        Text('1. 文本输入框 TextInput')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .alignSelf(ItemAlign.Start)
          .margin({ left: 20 })

        TextInput({ placeholder: '请输入文本...' })
          .width('90%')
          .onChange((value: string) => {
            this.inputText = value
          })

        Text(`输入的内容: ${this.inputText}`)
          .fontSize(16)
          .fontColor(Color.Gray)

        Divider().strokeWidth(2).color(Color.Gray).width('90%')

        // 滑动条示例
        Text('2. 滑动条 Slider')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .alignSelf(ItemAlign.Start)
          .margin({ left: 20 })

        Slider({
          value: this.sliderValue,
          min: 0,
          max: 100,
          step: 1,
          style: SliderStyle.OutSet
        })
          .width('90%')
          .onChange((value: number) => {
            this.sliderValue = value
          })

        Text(`滑动条值: ${this.sliderValue.toFixed(0)}`)
          .fontSize(16)
          .fontColor(Color.Gray)

        Divider().strokeWidth(2).color(Color.Gray).width('90%')

        // 开关示例
        Text('3. 开关 Toggle')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .alignSelf(ItemAlign.Start)
          .margin({ left: 20 })

        Toggle({ type: ToggleType.Switch, isOn: this.isToggled })
          .onChange((isOn: boolean) => {
            this.isToggled = isOn
          })

        Text(`开关状态: ${this.isToggled ? '开' : '关'}`)
          .fontSize(16)
          .fontColor(Color.Gray)

        Divider().strokeWidth(2).color(Color.Gray).width('90%')

        // 单选按钮示例
        Text('4. 单选按钮 Radio')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .alignSelf(ItemAlign.Start)
          .margin({ left: 20 })

        Row({ space: 30 }) {
          Radio({ value: 'option1', group: 'radioGroup' })
            .checked(this.selectedIndex === 0)
            .onChange((isChecked: boolean) => {
              if (isChecked) {
                this.selectedIndex = 0
              }
            })
          Text('选项1')

          Radio({ value: 'option2', group: 'radioGroup' })
            .checked(this.selectedIndex === 1)
            .onChange((isChecked: boolean) => {
              if (isChecked) {
                this.selectedIndex = 1
              }
            })
          Text('选项2')

          Radio({ value: 'option3', group: 'radioGroup' })
            .checked(this.selectedIndex === 2)
            .onChange((isChecked: boolean) => {
              if (isChecked) {
                this.selectedIndex = 2
              }
            })
          Text('选项3')
        }
        .width('90%')
        .justifyContent(FlexAlign.SpaceAround)

        Text(`选择的选项: ${this.selectedIndex + 1}`)
          .fontSize(16)
          .fontColor(Color.Gray)

        Divider().strokeWidth(2).color(Color.Gray).width('90%')

        // 进度条示例
        Text('5. 进度条 Progress')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .alignSelf(ItemAlign.Start)
          .margin({ left: 20 })

        Progress({ value: this.sliderValue, total: 100, type: ProgressType.Linear })
          .width('90%')
          .color(Color.Blue)

        Progress({ value: this.sliderValue, total: 100, type: ProgressType.Ring })
          .width(100)
          .height(100)
          .color(Color.Green)

        Divider().strokeWidth(2).color(Color.Gray).width('90%')

        // 图片示例
        Text('6. 图片 Image')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .alignSelf(ItemAlign.Start)
          .margin({ left: 20 })

        Image($r('app.media.icon'))
          .width(100)
          .height(100)
          .borderRadius(10)

        Blank().height(20)
      }
      .width('100%')
      .padding({ bottom: 20 })
    }
    .height('100%')
    .backgroundColor('#F1F3F5')
  }
}
