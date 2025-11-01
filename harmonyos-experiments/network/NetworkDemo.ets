/**
 * HarmonyOS 网络请求示例
 * Network Request Example for HarmonyOS
 */

import http from '@ohos.net.http'

interface ApiResponse {
  code: number
  message: string
  data: any
}

@Entry
@Component
struct NetworkDemo {
  @State responseData: string = '等待发起请求...'
  @State isLoading: boolean = false
  @State requestUrl: string = 'https://jsonplaceholder.typicode.com/posts/1'

  // 发起 GET 请求
  async makeGetRequest() {
    this.isLoading = true
    this.responseData = '正在请求中...'

    try {
      let httpRequest = http.createHttp()
      
      let response = await httpRequest.request(
        this.requestUrl,
        {
          method: http.RequestMethod.GET,
          header: {
            'Content-Type': 'application/json'
          },
          readTimeout: 10000,
          connectTimeout: 10000
        }
      )

      if (response.responseCode === 200) {
        this.responseData = `请求成功！\n\n响应代码: ${response.responseCode}\n\n响应数据:\n${JSON.stringify(JSON.parse(response.result.toString()), null, 2)}`
      } else {
        this.responseData = `请求失败\n响应代码: ${response.responseCode}`
      }

      httpRequest.destroy()
    } catch (err) {
      console.error('网络请求失败:', JSON.stringify(err))
      this.responseData = `请求出错: ${JSON.stringify(err)}`
    }

    this.isLoading = false
  }

  // 发起 POST 请求
  async makePostRequest() {
    this.isLoading = true
    this.responseData = '正在发送 POST 请求...'

    try {
      let httpRequest = http.createHttp()
      
      let postData = {
        title: 'HarmonyOS Test',
        body: 'This is a test post from HarmonyOS',
        userId: 1
      }

      let response = await httpRequest.request(
        'https://jsonplaceholder.typicode.com/posts',
        {
          method: http.RequestMethod.POST,
          header: {
            'Content-Type': 'application/json'
          },
          extraData: JSON.stringify(postData),
          readTimeout: 10000,
          connectTimeout: 10000
        }
      )

      if (response.responseCode === 201) {
        this.responseData = `POST 请求成功！\n\n响应代码: ${response.responseCode}\n\n发送的数据:\n${JSON.stringify(postData, null, 2)}\n\n响应数据:\n${JSON.stringify(JSON.parse(response.result.toString()), null, 2)}`
      } else {
        this.responseData = `POST 请求失败\n响应代码: ${response.responseCode}`
      }

      httpRequest.destroy()
    } catch (err) {
      console.error('POST 请求失败:', JSON.stringify(err))
      this.responseData = `POST 请求出错: ${JSON.stringify(err)}`
    }

    this.isLoading = false
  }

  build() {
    Scroll() {
      Column({ space: 20 }) {
        Text('网络请求示例')
          .fontSize(28)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 30 })

        Text('使用 @ohos.net.http 进行网络请求')
          .fontSize(16)
          .fontColor(Color.Gray)

        Divider().strokeWidth(2).width('90%')

        // URL 输入框
        Column({ space: 10 }) {
          Text('请求 URL:')
            .fontSize(18)
            .fontWeight(FontWeight.Bold)
            .alignSelf(ItemAlign.Start)
            .margin({ left: 20 })

          TextInput({ text: this.requestUrl })
            .width('90%')
            .onChange((value: string) => {
              this.requestUrl = value
            })
        }

        // 请求按钮
        Row({ space: 15 }) {
          Button('发起 GET 请求')
            .fontSize(18)
            .layoutWeight(1)
            .enabled(!this.isLoading)
            .onClick(() => {
              this.makeGetRequest()
            })

          Button('发起 POST 请求')
            .fontSize(18)
            .layoutWeight(1)
            .backgroundColor('#00CC66')
            .enabled(!this.isLoading)
            .onClick(() => {
              this.makePostRequest()
            })
        }
        .width('90%')

        // 加载指示器
        if (this.isLoading) {
          LoadingProgress()
            .width(50)
            .height(50)
            .color(Color.Blue)
        }

        Divider().strokeWidth(2).width('90%')

        // 响应数据显示
        Column({ space: 10 }) {
          Text('响应结果:')
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
            .alignSelf(ItemAlign.Start)
            .margin({ left: 20 })

          Text(this.responseData)
            .fontSize(14)
            .fontColor(Color.Black)
            .padding(15)
            .width('90%')
            .backgroundColor(Color.White)
            .borderRadius(10)
            .maxLines(30)
            .textOverflow({ overflow: TextOverflow.Ellipsis })
        }

        // 使用说明
        Column({ space: 5 }) {
          Text('使用说明:')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .alignSelf(ItemAlign.Start)
            .margin({ left: 20 })

          Text('1. 默认使用 JSONPlaceholder API 进行测试')
            .fontSize(14)
            .fontColor(Color.Gray)
            .alignSelf(ItemAlign.Start)
            .margin({ left: 20 })

          Text('2. 可以修改 URL 来测试其他 API')
            .fontSize(14)
            .fontColor(Color.Gray)
            .alignSelf(ItemAlign.Start)
            .margin({ left: 20 })

          Text('3. GET 请求用于获取数据')
            .fontSize(14)
            .fontColor(Color.Gray)
            .alignSelf(ItemAlign.Start)
            .margin({ left: 20 })

          Text('4. POST 请求用于提交数据')
            .fontSize(14)
            .fontColor(Color.Gray)
            .alignSelf(ItemAlign.Start)
            .margin({ left: 20 })

          Text('5. 需要在 module.json5 中配置网络权限')
            .fontSize(14)
            .fontColor(Color.Red)
            .alignSelf(ItemAlign.Start)
            .margin({ left: 20 })
        }
        .margin({ top: 20, bottom: 30 })
      }
      .width('100%')
    }
    .height('100%')
    .backgroundColor('#F1F3F5')
  }
}
