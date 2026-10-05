import { AddNewDeviceModule } from '../view/AddNewDeviceModule';
import { AddNewGroupModule } from '../view/AddNewGroupModule';

@Component
export struct PageHome {
  private scroller: Scroller = new Scroller();

  build() {
    Scroll(this.scroller) {
      Column() {
        AddNewDeviceModule()
        AddNewGroupModule()
      }
      .width('100%')
    }
    .scrollable(ScrollDirection.Vertical)
    .scrollBar(BarState.Off)
    .width('100%')
    .height('100%')
    .align(Alignment.Top)
    .backgroundColor($r('app.color.page_bg_color'))
  }
}