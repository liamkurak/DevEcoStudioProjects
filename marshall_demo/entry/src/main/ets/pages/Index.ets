import { AddDevice } from './AddDevice';
import { Explore } from './Explore';
import { More } from './More';

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';
  @State currentPageIndex: number = 0;
  @State showAddDevice: boolean = false;

  build() {
    Column() {
      // 页面内容
      Column() {
        if (this.showAddDevice) {
          // 添加设备流程，覆盖整个页面内容区
          AddDevice({
            onClose: () => {
              this.showAddDevice = false;
            }
          })
        } else if (this.currentPageIndex === 0) {
          // Home page
          Stack() {
            Column()
              .width('100%')
              .height('100%')
              .linearGradient({
                direction: GradientDirection.Bottom,
                colors: [['#lala2e', 0], ['#16213e', 0.5], ['#0f3460', 1]]
              })

            Column() {
              Column() {
                Text('你的音乐，你的方式')
                  .fontSize(28)
                  .fontWeight(FontWeight.Bold)
                  .fontColor(Color.White)
                  .margin({ bottom: 12 })

                Text('通过添加你的第一台设备开始播放音乐。')
                  .fontSize(14)
                  .fontColor(Color.White)
                  .opacity(0.8)
              }
              .alignItems(HorizontalAlign.Center)
              .layoutWeight(1)
              .justifyContent(FlexAlign.Center)

              Button('添加新设备')
                .width('80%')
                .height(48)
                .backgroundColor(Color.White)
                .fontColor(Color.Black)
                .fontSize(16)
                .fontWeight(FontWeight.Medium)
                .borderRadius(8)
                .margin({ bottom: 20 })
                .onClick(() => {
                  this.showAddDevice = true;
                })
            }
            .width('100%')
            .height('100%')
            .alignItems(HorizontalAlign.Center)
          }
          .width('100%')
          .height('100%')
        } else if (this.currentPageIndex === 1) {
          // Explore Page
          Explore();
        } else {
          // More Page
          More();
        }
      }
      .width('100%')
      .layoutWeight(1)

      // 底部导航栏 Nav Bar
      Row() {
        // 家用
        Column() {
          Text('🏠')
            .fontSize(22)
            .fontColor(this.currentPageIndex === 0 ? Color.White : Color.Gray)
            .margin({ bottom: 4 })
          Text('家用')
            .fontSize(12)
            .fontColor(this.currentPageIndex === 0 ? Color.White : Color.Gray)
        }
        .layoutWeight(1)
        .onClick(() => {
          this.showAddDevice = false;
          this.currentPageIndex = 0;
        })

        // 探索
        Column() {
          Text('M')
            .fontSize(20)
            .fontColor(this.currentPageIndex === 1 ? Color.White : Color.Gray)
            .margin({ bottom: 4 })
          Text('探索')
            .fontSize(12)
            .fontColor(this.currentPageIndex === 1 ? Color.White : Color.Gray)
        }
        .layoutWeight(1)
        .onClick(() => {
          this.showAddDevice = false;
          this.currentPageIndex = 1;
        })

        // 更多
        Column() {
          Text('...')
            .fontSize(22)
            .fontColor(this.currentPageIndex === 2 ? Color.White : Color.Gray)
            .margin({ bottom: 4 })
          Text('更多')
            .fontSize(12)
            .fontColor(this.currentPageIndex === 2 ? Color.White : Color.Gray)
        }
        .layoutWeight(1)
        .onClick(() => {
          this.showAddDevice = false;
          this.currentPageIndex = 2;
        })
      }
      .width('100%')
      .height(60)
      .padding({
        top: 8,
        bottom: 8
      })
      .backgroundColor('#1F1F1F')
    }
      .width('100%')
      .height('100%')
  }
}