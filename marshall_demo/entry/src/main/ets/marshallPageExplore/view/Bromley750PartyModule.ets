@Component
export struct Bromley750PartyModule {
  build() {
    Column() {
      Row() {
        Text('21:30')
          .maxFontSize(14)
          .fontColor('#FFFFFF')
          .margin(2)
          .minFontSize(8)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .maxLines(1)
        Image($r('app.media.emoji_image_1_0'))
          .margin(2)
          .height('62px').objectFit(ImageFit.Cover).borderRadius(8)
        Text('5G')
          .maxFontSize(14)
          .fontColor('#FFFFFF')
          .margin(2)
          .minFontSize(8)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .maxLines(1)
        Text('79%')
          .maxFontSize(14)
          .fontColor('#FFFFFF')
          .margin(2)
          .minFontSize(8)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .maxLines(1)
      }
      .width('100%')
      .alignItems(VerticalAlign.Center)
      .justifyContent(FlexAlign.SpaceBetween)

      Row() {
        Image($r('app.media.emoji_image_1_1'))
          .margin(2)
          .height('1016px').objectFit(ImageFit.Cover).borderRadius(8)
      }
      .width('100%')
      .alignItems(VerticalAlign.Center)

      Column() {
        Text('畅享移动派对')
          .maxFontSize(20)
          .fontColor('#FFFFFF')
          .margin(2)
          .minFontSize(8)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .maxLines(1)
        Text('约40小时无线续航')
          .maxFontSize(14)
          .fontColor('#FFFFFF')
          .margin(2)
          .minFontSize(8)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .maxLines(1)
        Button('探索BROMLEY 750')
          .fontSize(14)
          .height(40)
          .type(ButtonType.Normal)
          .fontColor('#000000')
          .backgroundColor('#FFFFFF')
          .constraintSize({ 'minWidth': 200 })
      }
      .width('100%')
      .alignItems(HorizontalAlign.Center)
    }
    .width('100%')
    .alignItems(HorizontalAlign.Center)
    .backgroundColor('#FFFFFF')
    .margin({ bottom: 10 })
    .clip(true)
    .constraintSize({ minHeight: ' 43.97%' })
    .backgroundColor('#000000')
  }
}