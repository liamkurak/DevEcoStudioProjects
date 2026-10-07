@Component
export struct MoreOptionsModule {
  build() {
    Row() {
      Blank()
      Text('更多')
        .maxFontSize(18)
        .fontColor('#ff800000')
        .margin(2)
        .minFontSize(8)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
        .maxLines(1)
      Blank()
    }
    .width('95%')
    // .backgroundColor('#000000')
    .alignItems(VerticalAlign.Center)
    .justifyContent(FlexAlign.Center)
    .padding({ top: '9.0px', bottom: '9.0px' })
    // .borderRadius(20)
    .margin({ bottom: 10 })
    .clip(true)
  }
}