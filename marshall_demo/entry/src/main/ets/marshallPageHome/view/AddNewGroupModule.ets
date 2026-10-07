@Component
export struct AddNewGroupModule{
build() {
Column(){
Row(){
Text('添加新设备')
.maxFontSize(18)
.margin(2).minFontSize(8).textOverflow({ overflow: TextOverflow.Ellipsis}).maxLines(1)
}
.width('100%')
.backgroundColor('#FFFFFF')
.alignItems(VerticalAlign.Center)
.justifyContent(FlexAlign.Center)
.padding({top: '9.0px', bottom: '9.0px', left: '9.0px', right: '9.0px'})
}
.width('95%')
.backgroundColor('#000000')
.alignItems(HorizontalAlign.Center)
.padding({top: '9.0px', bottom: '9.0px', left: '9.0px', right: '9.0px'})
.borderRadius(20)
.margin({bottom: 10})
.clip(true)
}
}