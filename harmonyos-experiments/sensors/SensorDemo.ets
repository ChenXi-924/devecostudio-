/**
 * HarmonyOS 传感器示例
 * Sensor Example for HarmonyOS
 */

import sensor from '@ohos.sensor'

@Entry
@Component
struct SensorDemo {
  @State accelerometerX: number = 0
  @State accelerometerY: number = 0
  @State accelerometerZ: number = 0
  @State gyroscopeX: number = 0
  @State gyroscopeY: number = 0
  @State gyroscopeZ: number = 0
  @State lightIntensity: number = 0
  @State isSensorActive: boolean = false

  // 开始监听传感器
  startSensors() {
    // 监听加速度传感器
    try {
      sensor.on(sensor.SensorId.ACCELEROMETER, (data: sensor.AccelerometerResponse) => {
        this.accelerometerX = data.x
        this.accelerometerY = data.y
        this.accelerometerZ = data.z
      }, { interval: 100000000 }) // 100ms
      console.info('加速度传感器监听已启动')
    } catch (err) {
      console.error('启动加速度传感器失败:', JSON.stringify(err))
    }

    // 监听陀螺仪传感器
    try {
      sensor.on(sensor.SensorId.GYROSCOPE, (data: sensor.GyroscopeResponse) => {
        this.gyroscopeX = data.x
        this.gyroscopeY = data.y
        this.gyroscopeZ = data.z
      }, { interval: 100000000 })
      console.info('陀螺仪传感器监听已启动')
    } catch (err) {
      console.error('启动陀螺仪传感器失败:', JSON.stringify(err))
    }

    // 监听光线传感器
    try {
      sensor.on(sensor.SensorId.AMBIENT_LIGHT, (data: sensor.LightResponse) => {
        this.lightIntensity = data.intensity
      }, { interval: 100000000 })
      console.info('光线传感器监听已启动')
    } catch (err) {
      console.error('启动光线传感器失败:', JSON.stringify(err))
    }

    this.isSensorActive = true
    console.info('传感器监听启动完成')
  }

  // 停止监听传感器
  stopSensors() {
    try {
      sensor.off(sensor.SensorId.ACCELEROMETER)
      sensor.off(sensor.SensorId.GYROSCOPE)
      sensor.off(sensor.SensorId.AMBIENT_LIGHT)
      
      this.isSensorActive = false
      console.info('传感器监听已停止')
    } catch (err) {
      console.error('停止传感器失败:', JSON.stringify(err))
    }
  }

  aboutToDisappear() {
    // 页面销毁时停止传感器
    this.stopSensors()
  }

  build() {
    Scroll() {
      Column({ space: 20 }) {
        Text('传感器功能示例')
          .fontSize(28)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 30 })

        Text('实时监测设备传感器数据')
          .fontSize(16)
          .fontColor(Color.Gray)

        // 控制按钮
        Row({ space: 15 }) {
          Button(this.isSensorActive ? '停止监听' : '开始监听')
            .fontSize(18)
            .layoutWeight(1)
            .backgroundColor(this.isSensorActive ? Color.Red : Color.Blue)
            .onClick(() => {
              if (this.isSensorActive) {
                this.stopSensors()
              } else {
                this.startSensors()
              }
            })
        }
        .width('90%')

        Divider().strokeWidth(2).width('90%')

        // 加速度传感器数据
        Column({ space: 10 }) {
          Text('1. 加速度传感器 (Accelerometer)')
            .fontSize(22)
            .fontWeight(FontWeight.Bold)
            .alignSelf(ItemAlign.Start)
            .margin({ left: 20 })

          Column({ space: 8 }) {
            Row() {
              Text('X 轴: ')
                .fontSize(16)
                .fontWeight(FontWeight.Bold)
              Text(this.accelerometerX.toFixed(3))
                .fontSize(16)
                .fontColor(Color.Blue)
            }
            .width('80%')
            .justifyContent(FlexAlign.SpaceBetween)

            Row() {
              Text('Y 轴: ')
                .fontSize(16)
                .fontWeight(FontWeight.Bold)
              Text(this.accelerometerY.toFixed(3))
                .fontSize(16)
                .fontColor(Color.Green)
            }
            .width('80%')
            .justifyContent(FlexAlign.SpaceBetween)

            Row() {
              Text('Z 轴: ')
                .fontSize(16)
                .fontWeight(FontWeight.Bold)
              Text(this.accelerometerZ.toFixed(3))
                .fontSize(16)
                .fontColor(Color.Red)
            }
            .width('80%')
            .justifyContent(FlexAlign.SpaceBetween)
          }
          .padding(15)
          .backgroundColor(Color.White)
          .borderRadius(10)
          .width('90%')

          Text('说明: 测量设备在三个轴向的加速度，单位 m/s²')
            .fontSize(14)
            .fontColor(Color.Gray)
            .width('90%')
        }

        Divider().strokeWidth(2).width('90%')

        // 陀螺仪传感器数据
        Column({ space: 10 }) {
          Text('2. 陀螺仪传感器 (Gyroscope)')
            .fontSize(22)
            .fontWeight(FontWeight.Bold)
            .alignSelf(ItemAlign.Start)
            .margin({ left: 20 })

          Column({ space: 8 }) {
            Row() {
              Text('X 轴角速度: ')
                .fontSize(16)
                .fontWeight(FontWeight.Bold)
              Text(this.gyroscopeX.toFixed(3))
                .fontSize(16)
                .fontColor(Color.Blue)
            }
            .width('80%')
            .justifyContent(FlexAlign.SpaceBetween)

            Row() {
              Text('Y 轴角速度: ')
                .fontSize(16)
                .fontWeight(FontWeight.Bold)
              Text(this.gyroscopeY.toFixed(3))
                .fontSize(16)
                .fontColor(Color.Green)
            }
            .width('80%')
            .justifyContent(FlexAlign.SpaceBetween)

            Row() {
              Text('Z 轴角速度: ')
                .fontSize(16)
                .fontWeight(FontWeight.Bold)
              Text(this.gyroscopeZ.toFixed(3))
                .fontSize(16)
                .fontColor(Color.Red)
            }
            .width('80%')
            .justifyContent(FlexAlign.SpaceBetween)
          }
          .padding(15)
          .backgroundColor(Color.White)
          .borderRadius(10)
          .width('90%')

          Text('说明: 测量设备的旋转角速度，单位 rad/s')
            .fontSize(14)
            .fontColor(Color.Gray)
            .width('90%')
        }

        Divider().strokeWidth(2).width('90%')

        // 光线传感器数据
        Column({ space: 10 }) {
          Text('3. 光线传感器 (Ambient Light)')
            .fontSize(22)
            .fontWeight(FontWeight.Bold)
            .alignSelf(ItemAlign.Start)
            .margin({ left: 20 })

          Column({ space: 8 }) {
            Row() {
              Text('光照强度: ')
                .fontSize(16)
                .fontWeight(FontWeight.Bold)
              Text(`${this.lightIntensity.toFixed(2)} lux`)
                .fontSize(16)
                .fontColor(Color.Orange)
            }
            .width('80%')
            .justifyContent(FlexAlign.SpaceBetween)
          }
          .padding(15)
          .backgroundColor(Color.White)
          .borderRadius(10)
          .width('90%')

          Text('说明: 测量环境光照强度，单位 lux')
            .fontSize(14)
            .fontColor(Color.Gray)
            .width('90%')
        }

        Divider().strokeWidth(2).width('90%')

        // 使用说明
        Column({ space: 5 }) {
          Text('使用说明:')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .alignSelf(ItemAlign.Start)
            .margin({ left: 20 })

          Text('1. 点击"开始监听"按钮启动传感器')
            .fontSize(14)
            .fontColor(Color.Gray)
            .alignSelf(ItemAlign.Start)
            .margin({ left: 20 })

          Text('2. 移动设备查看加速度和陀螺仪数据变化')
            .fontSize(14)
            .fontColor(Color.Gray)
            .alignSelf(ItemAlign.Start)
            .margin({ left: 20 })

          Text('3. 改变环境光线查看光线传感器数据')
            .fontSize(14)
            .fontColor(Color.Gray)
            .alignSelf(ItemAlign.Start)
            .margin({ left: 20 })

          Text('4. 使用完毕后点击"停止监听"节省电量')
            .fontSize(14)
            .fontColor(Color.Gray)
            .alignSelf(ItemAlign.Start)
            .margin({ left: 20 })

          Text('5. 需要在 module.json5 中配置传感器权限')
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
