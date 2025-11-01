/**
 * HarmonyOS 数据持久化示例 - 使用 Preferences
 * Data Persistence Example using Preferences
 */

import preferences from '@ohos.data.preferences'

@Entry
@Component
struct DataStorageDemo {
  @State userName: string = ''
  @State userAge: string = ''
  @State savedData: string = '暂无保存的数据'
  private dataPreferences: preferences.Preferences | null = null

  async aboutToAppear() {
    // 初始化 Preferences
    try {
      this.dataPreferences = await preferences.getPreferences(getContext(), 'myPreferences')
      await this.loadData()
    } catch (err) {
      console.error('初始化 Preferences 失败:', JSON.stringify(err))
    }
  }

  async loadData() {
    if (this.dataPreferences) {
      try {
        this.userName = await this.dataPreferences.get('userName', '') as string
        this.userAge = await this.dataPreferences.get('userAge', '') as string
        
        if (this.userName || this.userAge) {
          this.savedData = `姓名: ${this.userName}, 年龄: ${this.userAge}`
        }
      } catch (err) {
        console.error('读取数据失败:', JSON.stringify(err))
      }
    }
  }

  async saveData() {
    if (this.dataPreferences) {
      try {
        await this.dataPreferences.put('userName', this.userName)
        await this.dataPreferences.put('userAge', this.userAge)
        await this.dataPreferences.flush()
        
        this.savedData = `数据已保存 - 姓名: ${this.userName}, 年龄: ${this.userAge}`
        console.info('数据保存成功')
      } catch (err) {
        console.error('保存数据失败:', JSON.stringify(err))
        this.savedData = '保存失败，请重试'
      }
    }
  }

  async clearData() {
    if (this.dataPreferences) {
      try {
        await this.dataPreferences.clear()
        await this.dataPreferences.flush()
        
        this.userName = ''
        this.userAge = ''
        this.savedData = '数据已清除'
        console.info('数据清除成功')
      } catch (err) {
        console.error('清除数据失败:', JSON.stringify(err))
      }
    }
  }

  build() {
    Column({ space: 20 }) {
      Text('数据持久化示例')
        .fontSize(28)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 30 })

      Text('使用 Preferences 保存和读取数据')
        .fontSize(16)
        .fontColor(Color.Gray)

      Divider().strokeWidth(2).width('90%')

      // 输入表单
      Column({ space: 15 }) {
        Row({ space: 10 }) {
          Text('姓名:')
            .fontSize(18)
            .width(80)
          
          TextInput({ placeholder: '请输入姓名', text: this.userName })
            .layoutWeight(1)
            .onChange((value: string) => {
              this.userName = value
            })
        }
        .width('90%')

        Row({ space: 10 }) {
          Text('年龄:')
            .fontSize(18)
            .width(80)
          
          TextInput({ placeholder: '请输入年龄', text: this.userAge })
            .layoutWeight(1)
            .type(InputType.Number)
            .onChange((value: string) => {
              this.userAge = value
            })
        }
        .width('90%')
      }

      // 操作按钮
      Row({ space: 15 }) {
        Button('保存数据')
          .fontSize(18)
          .onClick(() => {
            this.saveData()
          })
          .layoutWeight(1)

        Button('清除数据')
          .fontSize(18)
          .backgroundColor(Color.Gray)
          .onClick(() => {
            this.clearData()
          })
          .layoutWeight(1)
      }
      .width('90%')

      Divider().strokeWidth(2).width('90%')

      // 显示保存的数据
      Column({ space: 10 }) {
        Text('已保存的数据:')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .alignSelf(ItemAlign.Start)
          .margin({ left: 20 })

        Text(this.savedData)
          .fontSize(18)
          .fontColor(Color.Blue)
          .padding(15)
          .width('90%')
          .backgroundColor(Color.White)
          .borderRadius(10)
      }

      // 使用说明
      Column({ space: 5 }) {
        Text('使用说明:')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .alignSelf(ItemAlign.Start)
          .margin({ left: 20 })

        Text('1. 在输入框中填写姓名和年龄')
          .fontSize(14)
          .fontColor(Color.Gray)
          .alignSelf(ItemAlign.Start)
          .margin({ left: 20 })

        Text('2. 点击"保存数据"按钮保存到本地')
          .fontSize(14)
          .fontColor(Color.Gray)
          .alignSelf(ItemAlign.Start)
          .margin({ left: 20 })

        Text('3. 重启应用后数据仍然存在')
          .fontSize(14)
          .fontColor(Color.Gray)
          .alignSelf(ItemAlign.Start)
          .margin({ left: 20 })

        Text('4. 点击"清除数据"可以删除所有保存的数据')
          .fontSize(14)
          .fontColor(Color.Gray)
          .alignSelf(ItemAlign.Start)
          .margin({ left: 20 })
      }
      .margin({ top: 20 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F1F3F5')
  }
}
