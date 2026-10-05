@Component
export struct SettingsMenuModule{
build() {
List({space: 10}){
ListItem(){Row(){
Text('帮助')
.fontColor('#FFFFFF')
.margin(2).minFontSize(8).textOverflow({ overflow: TextOverflow.Ellipsis}).maxLines(1)
Image($r('app.media.emoji_image_5_0'))
.margin(2)
.height('17px').objectFit(ImageFit.Cover).borderRadius(8)
}
.width('100%')
.backgroundColor('#333333')
.alignItems(VerticalAlign.Center)
.padding({left: '9.0px', right: '9.0px'})}.padding({top: 5, left: 3, bottom: 5, right: 3})
ListItem(){Row(){
Text('资讯')
.maxFontSize(14)
.fontColor('#FFFFFF')
.margin(2).minFontSize(8).textOverflow({ overflow: TextOverflow.Ellipsis}).maxLines(1)
Image($r('app.media.emoji_image_5_1'))
.margin(2)
.height('17px').objectFit(ImageFit.Cover).borderRadius(8)
}
.width('100%')
.backgroundColor('#333333')
.alignItems(VerticalAlign.Center)
.padding({left: '9.0px', right: '9.0px'})}.padding({top: 5, left: 3, bottom: 5, right: 3})
ListItem(){Row(){
Text('改进计划')
.maxFontSize(14)
.fontColor('#FFFFFF')
.margin(2).minFontSize(8).textOverflow({ overflow: TextOverflow.Ellipsis}).maxLines(1)
Image($r('app.media.emoji_image_5_2'))
.margin(2)
.height('17px').objectFit(ImageFit.Cover).borderRadius(8)
}
.width('100%')
.backgroundColor('#333333')
.alignItems(VerticalAlign.Center)
.padding({left: '9.0px', right: '9.0px'})}.padding({top: 5, left: 3, bottom: 5, right: 3})
ListItem(){Row(){
Text('应用程序语言')
.maxFontSize(14)
.fontColor('#FFFFFF')
.margin(2).minFontSize(8).textOverflow({ overflow: TextOverflow.Ellipsis}).maxLines(1)
Text('中文/Chinese')
.maxFontSize(14)
.fontColor('#FFFFFF')
.margin(2).minFontSize(8).textOverflow({ overflow: TextOverflow.Ellipsis}).maxLines(1)
Image($r('app.media.emoji_image_5_3'))
.margin(2)
.height('17px').objectFit(ImageFit.Cover).borderRadius(8)
}
.width('100%')
.backgroundColor('#333333')
.alignItems(VerticalAlign.Center)
.padding({left: '9.0px', right: '9.0px'})}.padding({top: 5, left: 3, bottom: 5, right: 3})
ListItem(){Row(){
Text('用户协议和隐私政策')
.maxFontSize(14)
.fontColor('#FFFFFF')
.margin(2).minFontSize(8).textOverflow({ overflow: TextOverflow.Ellipsis}).maxLines(1)
Image($r('app.media.emoji_image_5_4'))
.margin(2)
.height('35px').objectFit(ImageFit.Cover).borderRadius(8)
}
.width('100%')
.backgroundColor('#333333')
.alignItems(VerticalAlign.Center)
.padding({left: '9.0px', right: '9.0px'})}.padding({top: 5, left: 3, bottom: 5, right: 3})
ListItem(){Row(){
Text('免费和开源软件')
.maxFontSize(14)
.fontColor('#FFFFFF')
.margin(2).minFontSize(8).textOverflow({ overflow: TextOverflow.Ellipsis}).maxLines(1)
Image($r('app.media.emoji_image_5_5'))
.margin(2)
.height('35px').objectFit(ImageFit.Cover).borderRadius(8)
}
.width('100%')
.backgroundColor('#333333')
.alignItems(VerticalAlign.Center)
.padding({left: '9.0px', right: '9.0px'})}.padding({top: 5, left: 3, bottom: 5, right: 3})
ListItem(){Row(){
Text('关于我们')
.maxFontSize(14)
.fontColor('#FFFFFF')
.margin(2).minFontSize(8).textOverflow({ overflow: TextOverflow.Ellipsis}).maxLines(1)
Image($r('app.media.emoji_image_5_6'))
.margin(2)
.height('35px').objectFit(ImageFit.Cover).borderRadius(8)
}
.width('100%')
.backgroundColor('#333333')
.alignItems(VerticalAlign.Center)
.padding({left: '9.0px', right: '9.0px'})}.padding({top: 5, left: 3, bottom: 5, right: 3})
}
.listDirection(Axis.Vertical)
.backgroundColor('#333333')
.width('95%')
.borderRadius(20)
.margin({bottom: 10})
.clip(true).divider({strokeWidth: 1, startMargin: 10, endMargin: 10, color: '#ffe9f0f0'})
}
}