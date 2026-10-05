@Component
export struct AddNewDeviceModule{
build() {
Column(){
Image($r('app.media.emoji_image_0_0'))
.margin(0)
.width('1079px')
.height('1867px').objectFit(ImageFit.Cover).borderRadius(8)
Column(){
Text('你的音乐，你的方式')
.maxFontSize(18)
.fontColor('#FFFFFF')
.margin(2).minFontSize(8).textOverflow({ overflow: TextOverflow.Ellipsis}).maxLines(1)
Text('通过添加你的第一台设备开始播放音乐。')
.maxFontSize(14)
.fontColor('#FFFFFF')
.margin(2).minFontSize(8).textOverflow({ overflow: TextOverflow.Ellipsis}).maxLines(1)
}
.width('100%')
.backgroundColor('transparent')
.alignItems(HorizontalAlign.Center)
.padding({top: '9.0px', bottom: '9.0px', left: '9.0px', right: '9.0px'})
Button('添加新设备')
.fontSize(16)
.height(40)
.type(ButtonType.Normal)
.fontColor('#000000')
.backgroundColor('#FFFFFF')
.constraintSize({'minWidth': '80%'})
}
.width('100%')
.backgroundColor('transparent')
.alignItems(HorizontalAlign.Center)
.padding({top: '9.0px', bottom: '9.0px', left: '9.0px', right: '9.0px'})
.margin({bottom: 10})
.clip(true).constraintSize({minHeight: ' 79.52%'}).backgroundColor('#333333')
}
}