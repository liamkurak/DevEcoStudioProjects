@Component
export struct ApplicationVersionDisplay {
  build() {
    Column() {
      Text('应用程序版本 270000.1.0 (260929.35)')
        .maxFontSize(14)
        .fontColor('#FFFFFF')
        .margin(2)
        .minFontSize(8)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
        .maxLines(1)
    }
    .width('95%')
    .backgroundColor('#333333')
    .alignItems(HorizontalAlign.Center)
    .padding({
      top: '9.0px',
      bottom: '9.0px',
      left: '9.0px',
      right: '9.0px'
    })
    .borderRadius(20)
    .margin({ bottom: 10 })
    .clip(true)
  }
}