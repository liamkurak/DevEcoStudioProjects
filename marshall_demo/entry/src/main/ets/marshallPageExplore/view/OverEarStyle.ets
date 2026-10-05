@Component
export struct OverEarStyle{
build() {
Column(){
Text('包耳式')
.fontColor('#FFFFFF')
.margin(2).minFontSize(8).textOverflow({ overflow: TextOverflow.Ellipsis}).maxLines(1)
}
.width('95%')
.backgroundColor('#333333')
.alignItems(HorizontalAlign.Start)
.padding({top: '9.0px', bottom: '9.0px', left: '9.0px', right: '9.0px'})
.borderRadius(20)
.margin({bottom: 10})
.clip(true)
}
}