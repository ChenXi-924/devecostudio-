/**
 * HarmonyOS 多媒体示例 - 图片和音频
 * Multimedia Example - Image and Audio
 */

import media from '@ohos.multimedia.media'

@Entry
@Component
struct MultimediaDemo {
  @State imageScale: number = 1
  @State imageRotation: number = 0
  @State isPlaying: boolean = false
  private audioPlayer: media.AVPlayer | null = null

  async aboutToAppear() {
    // 初始化音频播放器
    try {
      this.audioPlayer = await media.createAVPlayer()
      
      this.audioPlayer.on('stateChange', (state) => {
        console.info('音频播放器状态变化:', state)
      })

      this.audioPlayer.on('error', (err) => {
        console.error('音频播放器错误:', JSON.stringify(err))
      })
    } catch (err) {
      console.error('创建音频播放器失败:', JSON.stringify(err))
    }
  }

  aboutToDisappear() {
    // 释放音频播放器资源
    if (this.audioPlayer) {
      this.audioPlayer.release()
      this.audioPlayer = null
    }
  }

  // 播放音频
  async playAudio() {
    if (this.audioPlayer) {
      try {
        // 设置音频源（这里需要替换为实际的音频文件路径）
        this.audioPlayer.url = 'resource://RAWFILE/sample_audio.mp3'
        await this.audioPlayer.play()
        this.isPlaying = true
      } catch (err) {
        console.error('播放音频失败:', JSON.stringify(err))
      }
    }
  }

  // 暂停音频
  async pauseAudio() {
    if (this.audioPlayer) {
      try {
        await this.audioPlayer.pause()
        this.isPlaying = false
      } catch (err) {
        console.error('暂停音频失败:', JSON.stringify(err))
      }
    }
  }

  // 停止音频
  async stopAudio() {
    if (this.audioPlayer) {
      try {
        await this.audioPlayer.stop()
        this.isPlaying = false
      } catch (err) {
        console.error('停止音频失败:', JSON.stringify(err))
      }
    }
  }

  build() {
    Scroll() {
      Column({ space: 20 }) {
        Text('多媒体功能示例')
          .fontSize(28)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 30 })

        Divider().strokeWidth(2).width('90%')

        // 图片操作示例
        Column({ space: 15 }) {
          Text('1. 图片操作')
            .fontSize(22)
            .fontWeight(FontWeight.Bold)
            .alignSelf(ItemAlign.Start)
            .margin({ left: 20 })

          // 显示图片
          Image($r('app.media.icon'))
            .width(200)
            .height(200)
            .borderRadius(10)
            .scale({ x: this.imageScale, y: this.imageScale })
            .rotate({ angle: this.imageRotation })
            .animation({
              duration: 300,
              curve: Curve.EaseInOut
            })

          // 图片控制按钮
          Row({ space: 10 }) {
            Button('放大')
              .fontSize(16)
              .onClick(() => {
                this.imageScale = Math.min(this.imageScale + 0.2, 2.0)
              })

            Button('缩小')
              .fontSize(16)
              .onClick(() => {
                this.imageScale = Math.max(this.imageScale - 0.2, 0.5)
              })

            Button('旋转')
              .fontSize(16)
              .onClick(() => {
                this.imageRotation += 90
              })

            Button('重置')
              .fontSize(16)
              .backgroundColor(Color.Gray)
              .onClick(() => {
                this.imageScale = 1
                this.imageRotation = 0
              })
          }

          Text(`缩放: ${this.imageScale.toFixed(1)}x, 旋转: ${this.imageRotation}°`)
            .fontSize(14)
            .fontColor(Color.Gray)
        }

        Divider().strokeWidth(2).width('90%')

        // 音频播放示例
        Column({ space: 15 }) {
          Text('2. 音频播放')
            .fontSize(22)
            .fontWeight(FontWeight.Bold)
            .alignSelf(ItemAlign.Start)
            .margin({ left: 20 })

          // 音频播放状态
          Row({ space: 10 }) {
            Text('播放状态:')
              .fontSize(18)

            Text(this.isPlaying ? '播放中' : '已暂停')
              .fontSize(18)
              .fontColor(this.isPlaying ? Color.Green : Color.Gray)
          }

          // 音频控制按钮
          Row({ space: 10 }) {
            Button(this.isPlaying ? '暂停' : '播放')
              .fontSize(16)
              .layoutWeight(1)
              .onClick(() => {
                if (this.isPlaying) {
                  this.pauseAudio()
                } else {
                  this.playAudio()
                }
              })

            Button('停止')
              .fontSize(16)
              .layoutWeight(1)
              .backgroundColor(Color.Red)
              .onClick(() => {
                this.stopAudio()
              })
          }
          .width('80%')
        }

        Divider().strokeWidth(2).width('90%')

        // 使用说明
        Column({ space: 5 }) {
          Text('使用说明:')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .alignSelf(ItemAlign.Start)
            .margin({ left: 20 })

          Text('图片操作:')
            .fontSize(14)
            .fontWeight(FontWeight.Bold)
            .fontColor(Color.Blue)
            .alignSelf(ItemAlign.Start)
            .margin({ left: 20, top: 10 })

          Text('• 点击"放大"和"缩小"调整图片大小')
            .fontSize(14)
            .fontColor(Color.Gray)
            .alignSelf(ItemAlign.Start)
            .margin({ left: 30 })

          Text('• 点击"旋转"旋转图片 90 度')
            .fontSize(14)
            .fontColor(Color.Gray)
            .alignSelf(ItemAlign.Start)
            .margin({ left: 30 })

          Text('• 点击"重置"恢复原始状态')
            .fontSize(14)
            .fontColor(Color.Gray)
            .alignSelf(ItemAlign.Start)
            .margin({ left: 30 })

          Text('音频播放:')
            .fontSize(14)
            .fontWeight(FontWeight.Bold)
            .fontColor(Color.Blue)
            .alignSelf(ItemAlign.Start)
            .margin({ left: 20, top: 10 })

          Text('• 需要在 rawfile 目录放置音频文件')
            .fontSize(14)
            .fontColor(Color.Gray)
            .alignSelf(ItemAlign.Start)
            .margin({ left: 30 })

          Text('• 支持 MP3、AAC、WAV 等格式')
            .fontSize(14)
            .fontColor(Color.Gray)
            .alignSelf(ItemAlign.Start)
            .margin({ left: 30 })

          Text('• 点击"播放"或"暂停"控制播放')
            .fontSize(14)
            .fontColor(Color.Gray)
            .alignSelf(ItemAlign.Start)
            .margin({ left: 30 })
        }
        .margin({ top: 20, bottom: 30 })
      }
      .width('100%')
    }
    .height('100%')
    .backgroundColor('#F1F3F5')
  }
}
