import { MoreOptionsModule } from '../view/MoreOptionsModule';
import { SettingsMenuModule } from '../view/SettingsMenuModule';
import { DarkModeDisplay } from '../view/DarkModeDisplay';
import { ApplicationVersionDisplay } from '../view/ApplicationVersionDisplay';

@Component
export struct PageMore {
  private scroller: Scroller = new Scroller();

  build() {
    Scroll(this.scroller) {
      Column() {
        MoreOptionsModule()
        SettingsMenuModule()
        DarkModeDisplay()
        ApplicationVersionDisplay()
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