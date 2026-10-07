import { HelpBt, ImprovProgram, Subscribe } from "./MoreSubPages"

@Component
export struct More {
  @State subpage: string = 'none' // 'none' | 'help_bt' | 'subscribe' | 'improv'

  build() {
    if (this.subpage === 'help_bt') {
      // 帮助 - 蓝牙配对
      HelpBt({
        onBack: () => {
          this.subpage = 'none'
        }
      })
    } else if (this.subpage === 'subscribe') {
      // 资讯-订阅
      Subscribe({
        onBack: () => {
          this.subpage = 'none'
        }
      })
    } else if (this.subpage === 'improv') {
      // 改进计划
      ImprovProgram({
        onBack: () => {
          this.subpage = 'none'
        }
      })
    } else {
      // 主页
      Column() {
        // 页面标题
        Text($r('app.string.MorePage')) // 更多
          .fontSize(24)
          .fontWeight(FontWeight.Bold)
          .fontColor(Color.White)
          .margin({ top: 16, bottom: 24 })

        // 菜单列表
        Scroll() {
          Column() {
            // 帮助 - 可点击进入子页面
            Row() {
              Text($r('app.string.more_help')) //帮助
                .fontSize(16)
                .fontColor(Color.White)
                .layoutWeight(1)
              Text('›')
                .fontSize(20)
                .fontColor(Color.Gray)
            }
            .width('100%')
            .height(50)
            .alignItems(VerticalAlign.Center)
            .onClick(() => {
              this.subpage = 'help_bt'
            })

            // 资讯 - 可点击进入子页面
            Row() {
              Text($r('app.string.more_info')) // 资讯
                .fontSize(16)
                .fontColor(Color.White)
                .layoutWeight(1)
              Text('›')
                .fontSize(20)
                .fontColor(Color.Gray)
            }
            .width('100%')
            .height(50)
            .alignItems(VerticalAlign.Center)
            .onClick(() => {
              this.subpage = 'subscribe'
            })

            // 改进计划- 可点击进入子页面
            Row() {
              Text($r('app.string.more_improve_plan')) //改进计划
                .fontSize(16)
                .fontColor(Color.White)
                .layoutWeight(1)
              Text('›')
                .fontSize(20)
                .fontColor(Color.Gray)
            }
            .width('100%')
            .height(50)
            .alignItems(VerticalAlign.Center)
            .onClick(() => {
              this.subpage = 'improv'
            })

            // 应用程序语言-带当前值
            Row() {
              Text($r('app.string.more_app_language')) //应用程序语言
                .fontSize(16)
                .fontColor(Color.White)
                .layoutWeight(1)

              Text($r('app.string.more_app_language_value'))  // 中文/Chinese
                .fontSize(14)
                .fontColor(Color.Gray)
                .margin({ right: 8 })
            }
            .width('100%')
            .height(50)
            .alignItems(VerticalAlign.Center)

            // 分割线
            Divider()
              .margin({ top: 24, bottom: 0 })

            // 用户协议和隐私政策-外部链接
            Row() {
              Text($r('app.string.more_user_agreement')) //用户协议和隐私政策
                .fontSize(16)
                .fontColor(Color.White)
                .layoutWeight(1)
              Text('↗️')
                .fontSize(20)
                .fontColor(Color.Gray)
            }
            .width('100%')
            .height(50)
            .alignItems(VerticalAlign.Center)

            // 免费和开源软件-外部链接
            Row() {
              Text($r('app.string.more_open_source')) //免费和开源软件
                .fontSize(16)
                .fontColor(Color.White)
                .layoutWeight(1)
              Text('↗️')
                .fontSize(20)
                .fontColor(Color.Gray)
            }
            .width('100%')
            .height(50)
            .alignItems(VerticalAlign.Center)

            // 关于我们-外部链接
            Row() {
              Text($r('app.string.more_about_us')) //关于我们
                .fontSize(16)
                .fontColor(Color.White)
                .layoutWeight(1)
              Text('↗️')
                .fontSize(20)
                .fontColor(Color.Gray)
            }
            .width('100%')
            .height(50)
            .alignItems(VerticalAlign.Center)

            // 版本号
            Text($r('app.string.more_app_version')) // 应用程序版本270000.1.0（260929.35）
              .fontSize(12)
              .fontColor(Color.Gray)
              .margin({ top: 32, bottom: 20 })
          }
          .width('100%')
          .padding({ left: 16, right: 16 })
        }
        .layoutWeight(1)
        .width('100%')
        .height('100%')
        .backgroundColor('#121212')
      }
    }
  }
}