@Component
export struct AddDevice {
  @State showCannotFind: boolean = false;
  @State showCompatible: boolean = false;
  onClose: () => void = () => {
  };
  // 兼容产品数据
  private compatibleCategories: CompatibleCategory[] = [
    {
      name: '家庭音箱',
      items: ['ACTON II', 'ACTON III', 'STANMORE II', 'STANMORE III', 'WOBURN II', 'WOBURN III']
    },
    {
      name: '便携音箱',
      items: ['EMBERTON II', 'EMBERTON III', 'KILBURN III', 'MIDDLETON', 'MIDDLETON II', 'STOCKWELL III', 'WiLEN',
        'WiLEN II']
    },
    {
      name: '耳塞和耳机',
      items: ['MAJOR V', 'MILTON A.N.C.', 'MINOR III', 'MINOR IV', 'MODE II', 'MONITOR II A.N.C.']
    },
    {
      name: '派对音箱',
      items: ['BROMLEY 150', 'BROMLEY 450', 'BROMLEY 750']
    }
  ]

  build() {
    Stack() {
      //explore page background
      Column() {
        // top close page
        Row() {
          Text('x')
            .fontSize(28)
            .fontColor(Color.White)
            .padding(12)
            .onClick(() => {
              this.onClose()
            })
        }
        .width('100%')
        .justifyContent(FlexAlign.Start)
        .padding({
          left: 16,
          top: 16
        })

      }
    }
  }
}

interface CompatibleCategory {
  name: Resource|string,
  items: string[]
}