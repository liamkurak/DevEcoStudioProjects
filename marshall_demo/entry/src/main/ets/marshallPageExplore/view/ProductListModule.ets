import {SpecItem_00} from '../viewmodel/ProductListModule';
@Component
export struct ProductListModule{
private specItem_00_: SpecItem_00[] = [
{ var_0: $r('app.media.emoji_image_0_0'), var_1: 'MINOR IV', var_2: '>' },
{ var_0: $r('app.media.emoji_image_0_1'), var_1: 'MOTIF II A.N.C.', var_2: '>' },
{ var_0: $r('app.media.emoji_image_0_2'), var_1: 'MINOR III', var_2: '>' }
]
@Builder
SpecItem_00_Builder(item: SpecItem_00) {
Row(){
Image(item.var_0)
.margin(2)
.height('107px').objectFit(ImageFit.Cover).borderRadius(8)
Blank()
Text(item.var_1)
.maxFontSize(14)
.fontColor('#FFFFFF')
.margin(2).minFontSize(8).textOverflow({ overflow: TextOverflow.Ellipsis}).maxLines(1)
Blank()
Button(item.var_2)
.fontSize(14)
.height(14)
.type(ButtonType.Normal)
.fontColor('#FFFFFF')
.backgroundColor('#000000')
}
.width('100%')
.backgroundColor('#333333')
.alignItems(VerticalAlign.Center)
.justifyContent(FlexAlign.SpaceBetween)
.padding({top: '9.0px', bottom: '9.0px'}).width('100%')
}
build() {
List() {
ForEach(this.specItem_00_, (item: SpecItem_00) => {
ListItem() {
this.SpecItem_00_Builder(item)
}.width('100%').borderRadius(8).clip(true)
.padding({top: 5, left: 3, bottom: 5, right: 3})
})
}.width('95%').borderRadius(8).clip(true).margin({bottom: 10}).divider({strokeWidth: 1, startMargin: 10, endMargin: 10, color: '#ffe9f0f0'}).backgroundColor('#333333')
}
}