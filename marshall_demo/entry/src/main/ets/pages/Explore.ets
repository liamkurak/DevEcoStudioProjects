import { Font } from "@ohos.arkui.UIContext"
import { common, Want } from "@kit.AbilityKit"

@Component
export struct Explore {
  // 产品数据 - 使用资源 id 标识分类
  private categories: CategoryData[] = [
    {
      name: $r('app.string.category_true_wireless'), // 真无线耳机
      items: ['MINOR IV', 'MOTIF II A.N.C.', 'MINOR II']
    },
    {
      name: $r('app.string.category_over_ear'), //包耳式
      items: ['MAJOR IV', 'MIDTOWN A.N.C.']
    },
    {
      name: $r('app.string.category_in_ear'), //入耳式
      items: ['MODE']
    },
    {
      name: $r('app.string.category_bluetooth_speaker'), //蓝牙音箱
      items: ['ACTON III', 'STANMORE II', 'WOBURN I']
    },
    {
      name: $r('app.string.category_portable'), //便携式
      items: ['STOCKWELL III', 'KILBURN I']
    }
  ]

  build() {
    Column() {
      // title
      Text('探索')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .fontColor(Color.White)
        .margin({ top: 16, bottom: 16 })

      // 滚动列表
      Scroll() {
        Column() {
          // top bar
          Stack() {
            // background
            Column()
              .width('100%')
              .height(280)
              .linearGradient({
                direction: GradientDirection.Bottom,
                colors: [['#2ala0e', 0], ['#lalala', 1]]
              })

            // content
            Column() {
              Text('畅享移动派对')
                .fontSize(28)
                .fontWeight(FontWeight.Bold)
                .fontColor(Color.White)
                .margin({ bottom: 9 })

              Text($r('app.string.explore_banner_subtitle')) //约40小时无线续航
                .fontSize(14)
                .fontColor(Color.White)
                .opacity(0.85)
                .margin({ bottom: 24 })
              Button($r('app.string.explore_banner_button')) // 探索 BROMLEY 750
                .width('60%')
                .height(40)
                .backgroundColor(Color.White)
                .fontColor(Color.Black)
                .fontSize(14)
                .fontWeight(FontWeight.Medium)
                .borderRadius(20)
            }
            .width('100%')
            .height('100%')
            .alignItems(HorizontalAlign.Center)
            .justifyContent(FlexAlign.Center)
          }
          .width('100%')
          .height(280)

          // 每个分类的产品列表
          ForEach(this.categories, (item: CategoryData) => {
            Column() {
              // 分类标题
              Row() {
                Text(item.name)
                  .fontSize(16)
                  .fontWeight(FontWeight.Medium)
                  .fontColor(Color.White)
              }
              .width('100%')
              .height(40)
              .padding({ left: 16 })
              .backgroundColor('#2A2A2A')
              .alignItems(VerticalAlign.Center)

              // 该分类下的产品
              ForEach(item.items, (productName: string) => {
                this.buildProductItem(productName)
              })
            }
            .width('100%')
          })

          // 底部占位，避免内容被导航栏遮挡
          Blank()
            .height(20)
        }
        .width('100%')
      }
      .width('100%')
      .layoutWeight(1)
      .scrollBar(BarState.Off)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#121212')
  }

  @Builder
  buildProductItem(name: string) {
    Row() {
      // 产品图片占位
      Column()
        .width(80)
        .height(80)
        .backgroundColor('#ЗАЗАЗА')
        .borderRadius(8)
        .margin({ right: 16 })

      // 产品名称
      Text(name)
        .fontSize(16)
        .fontWeight(FontWeight.Medium)
        .fontColor(Color.White)
        .layoutWeight(1)

      // 箭头
      Text('›')
        .fontSize(24)
        .fontColor(Color.Gray)
    }
    .width('100%')
    .height(100)
    .padding({ left: 16, right: 16 })
    .alignItems(VerticalAlign.Center)
    .onClick(() => {
      // 跳转到 Marshall 官网
      const context = getContext(this) as common.UIAbilityContext
      const want: Want = {
        action: 'ohos. want.action.viewData',
        uri: `https://www.marshall.cn/`
      }
      context.startAbility(want)
    })
  }
}


// 产品分类数据接口
interface CategoryData {
  name: Resource | string,
  items: string[]
}




