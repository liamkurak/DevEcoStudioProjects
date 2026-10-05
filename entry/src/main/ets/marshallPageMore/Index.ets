import { PageMore } from './pages/PageMore'

@Entry
@Component
struct Index {
  @State currentIndex: number = 0;
  private tabsController: TabsController = new TabsController();
  @Provide('appPathStack') appPathStack: NavPathStack = new NavPathStack();

  @Builder
  tabBuilder(title: string, targetIndex: number, icon: Resource) {
    Column() {
      Image(icon)
        .width("24vp")
        .height("24vp")
        .objectFit(ImageFit.Contain)
        .fillColor(this.currentIndex === targetIndex ? ($r('app.color.app_icon_pressed_color')) :
          ($r('app.color.app_icon_color')))
      Text(title)
        .fontSize("10vp")
        .fontColor(this.currentIndex === targetIndex ? ($r('app.color.app_icon_pressed_color')) :
          ($r('app.color.app_icon_color')))
        .textAlign(TextAlign.Center)
        .lineHeight("14vp")
        .fontWeight(500)
    }
    .height('100%')
    .width('100%')
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
    .onClick(() => {
      this.currentIndex = targetIndex;
      this.tabsController.changeIndex(targetIndex);
    })
  }

  build() {
    Navigation(this.appPathStack) {
      Tabs({
        barPosition: BarPosition.End,
        controller: this.tabsController
      }) {
        TabContent() {
          PageMore()
        }.tabBar(this.tabBuilder('家用', 0, $r("app.media.lib_icon_9")))

        TabContent() {
          PageMore()
        }.tabBar(this.tabBuilder('探索', 1, $r("app.media.lib_icon_7")))

        TabContent() {
          PageMore()
        }.tabBar(this.tabBuilder('更多', 2, $r("app.media.lib_icon_83")))
      }
      .barWidth("100%")
      .barHeight("76vp")
      .barMode(BarMode.Fixed, { nonScrollableLayoutStyle: LayoutStyle.ALWAYS_CENTER })
      .vertical(false)
      .scrollable(false)
      .width('100%')
      .height('100%')
    }
    .backgroundColor($r('app.color.page_bg_color'))
    .hideTitleBar(true)
    .mode(NavigationMode.Stack)
  }
}