// 蓝牙配对帮助页
@Component
export struct HelpBt {
  onBack: () => void = () => {}

  build() {
    Column() {
      // 顶部导航栏
      Row() {
        Text('<')
          .fontSize(24)
          .fontColor(Color.White)
          .padding(12)
          .onClick(() => {
            this.onBack()
          })
        Text($r('app.string.more_bluetooth_pairing')) //藍牙配対
          .fontSize(18)
          .fontWeight(FontWeight.Medium)
          .fontColor(Color.White)
          .layoutWeight(1)
          .textAlign(TextAlign.Center)
        Text(' ')
          .width(44)
      }
      .width('100%')
      .height(56)
      .padding({ left: 8, right: 8 })
      .backgroundColor('#1A1A1A')

      // 内容区
      Scroll() {
        Column() {
          // 产品图片占位区
          Column()
            .width('100%')
            .height(220)
            .backgroundColor('#2A2A2A')
            .margin({ bottom: 24 })

          // 操作步骤
          Column() {
            Text($r('app.string.more_bt_step_1')) // 1. 轻按音源按钮..
              .fontSize(14)
              .fontColor(Color.White)
              .margin({ bottom: 16 })
              .width('100%')
            Text($r('app.string.more_bt_step_2')) //  2. 按住音源按钮2秒.
              .fontSize(14)
              .fontColor(Color.White)
              .margin({ bottom: 16 })
              .width('100%')
            Text($r('app.string.more_bt_step_3')) // 3. 启用手机⋯
              .fontSize(14)
              .fontColor(Color.White)
              .margin({ bottom: 16 })
              .width('100%')
            Text($r('app.string.more_bt_step_4')) // 4. 从可用的设备列表中..
              .fontSize(14)
              .fontColor(Color.White)
              .margin({ bottom: 24 })
              .width('100%')
          }
          .width('100%')
          .padding({ left: 20, right: 20 })
        }
        .width('100%')
      }
      .layoutWeight(1)
      .scrollBar(BarState.Off)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#121212')
  }
}

// 资讯订阅页
@Component
export struct Subscribe {
  onBack: () => void = () => {}

  build() {
    Column() {
      // 顶部导航栏
      Row() {
        Text('<')
          .fontSize(24)
          .fontColor(Color.White)
          .padding(12)
          .onClick(() => {
            this.onBack()
          })

        Text($r('app.string.more_info')) //资讯
          .fontSize(18)
          .fontWeight(FontWeight.Medium)
          .fontColor(Color.White)
          .layoutWeight(1)
          .textAlign(TextAlign.Center)
        Text(' ')
          .width(44)
          .width('100%')
          .height(56)
          .padding({ left: 8, right: 8 })
          .backgroundColor('#1A1A1A')
        // 内容区
        Column() {
          //标题
          Text($r('app.string.more_info_receive')) //接收消息
            .fontSize(24)
            .fontWeight(FontWeight.Bold)
            .fontColor(Color.White)
            .margin({ top: 32, bottom: 12 })

          //说明
          Text($r('app.string.more_info_desc'))  // 深入了解如何使用您的产品..
            .fontSize(14)
            .fontColor(Color.White)
            .textAlign(TextAlign.Center)
            .width('90%')
            .margin({ bottom: 32 })

          // 注册信息
          Text($r('app.string.more_info_registered'))// 您已注册：
            .fontSize(14)
            .fontColor(Color.White)
            .opacity(0.8)
            .margin({ bottom: 8 })

          Text($r('app.string.more_info_email'))
            .fontSize(16)
            .fontColor(Color.White)
            .fontWeight(FontWeight.Medium)
            .margin({ bottom: 32 })

          Blank().layoutWeight(1)

          //隐私声明
          Text($r('app.string.more_info_privacy'))// 我们会谨慎保护您的电子邮件地址..
            .fontSize(12)
            .fontColor(Color.Gray)
            .textAlign(TextAlign.Center)

            .width('90%')
            .margin({ bottom: 16 })

          //取消订阅按钮
          Button($r('app.string.more_info_unsubscribe')) //取消订阅
            .width('90%')
            .height(48)
            .backgroundColor(Color.White)
            .fontColor(Color.Black)
            .fontSize(16)
            .fontWeight(FontWeight.Medium)
            .borderRadius(8)
            .margin({ bottom: 24 })
        }
        .width('100%')
        .layoutWeight(1)
        .alignItems(HorizontalAlign.Center)
      }
      .width('100%')
      .height('100%')
      .backgroundColor('#121212')
    }
  }
}

// 改进计划页
@Component
export struct ImprovProgram {
  @State shareData: boolean = false;
  onBack: () => void = () => {};

  build() {
    Column() {
      //顶部导航栏
      Row() {
        Text('<')
          .fontSize(24)
          .fontColor(Color.White)
          .padding(12)
          .onClick(() => {
            this.onBack()
          })

        Text($r('app.string.more_improve_plan')) // 改进计划
          .fontSize(18)
          .fontWeight(FontWeight.Medium)
          .fontColor(Color.White)
          .layoutWeight(1)
          .textAlign(TextAlign.Center)
        Text(' ')
          .width(44)
      }
      .width('100%')
      .height(56)
      .padding({ left: 8, right: 8 })
      .backgroundColor('#1A1AIA')

      // 内容区
      Column() {
        // 标题
        Text($r('app.string.more_improv_join')) //参与改进计划
          .fontSize(24)
          .fontWeight(FontWeight.Bold)
          .fontColor(Color.White)
          .margin({ top: 32, bottom: 16 })

        // 说明
        Text($r('app.string.more_improv_desc'))// 系统会将用户的使用数据以匿名形式自动发
          .fontSize(14)
          .fontColor(Color.White)
          .opacity(0.8)
          .textAlign(TextAlign.Center)
          .width('90%')
          .margin({ bottom: 32 })

        // 分析列表
        Column() {
          Text($r('app.string.more_improv_list_title')) //Marshall 将分析下列非个人信息：
            .fontSize(14)
            .fontColor(Color.White)
            .fontWeight(FontWeight.Medium)
            .margin({ bottom: 16 })

          // 列表项
          Row() {
            Text('·')
              .fontSize(14)
              .fontColor(Color.White)
              .margin({ right: 8 })
            Text($r('app.string.more_improv_item_1')) // 交互特征使得常用功能更加简单和完善
              .fontSize(14)
              .fontColor(Color.White)
              .opacity(0.9)
              .layoutWeight(1)
          }
          .width('100%')
          .margin({ bottom: 12 })

          Row() {
            Text('·')
              .fontSize(14)
              .fontColor(Color.White)
              .margin({ right: 8 })
            Text($r('app.string.more_improv_item_2'))// 设备连接状况以更好地支持相关设备
              .fontSize(14)
              .fontColor(Color.White)
              .opacity(0.9)
              .layoutWeight(1)
          }
          .width('100%')
          .margin({ bottom: 12 })

          Row() {
            Text('·')
              .fontSize(14)
              .fontColor(Color.White)
              .margin({ right: 8 })
            Text($r('app.string.more_improv_item_3'))//系统的稳定性以防止出现崩溃和系统故障
              .fontSize(14)
              .fontColor(Color.White)
              .opacity(0.9)
              .layoutWeight(1)
          }
          .width('100%')
        }
        .width('90%')
        .padding(20)
        .backgroundColor('#2A2A2A')
        .borderRadius(12)
        .alignItems(HorizontalAlign.Start)

        Blank().layoutWeight(1)

        // 底部开关
        Row() {
          Text($r('app.string.more_improv_share'))// 我想共享我的匿名数据
            .fontSize(14)
            .fontColor(Color.White)
            .layoutWeight(1)

          Toggle({ type: ToggleType.Switch, isOn: this.shareData })
            .onChange((on: boolean) => {
              this.shareData = on
            })
        }
        .width('90%')
        .height(50)
        .margin({ bottom: 24 })
      }
      .width('100%')
      .layoutWeight(1)
      .alignItems(HorizontalAlign.Center)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#121212')
  }
}
