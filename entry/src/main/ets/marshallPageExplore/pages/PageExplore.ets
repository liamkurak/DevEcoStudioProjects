import { Bromley750PartyModule } from '../view/Bromley750PartyModule';
import { ProductListModule } from '../view/ProductListModule';
import { OverEarStyle } from '../view/OverEarStyle';

@Component
export struct PageExplore {
  private scroller: Scroller = new Scroller();

  build() {
    Scroll(this.scroller) {
      Column() {
        Bromley750PartyModule()
        ProductListModule()
        OverEarStyle()
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