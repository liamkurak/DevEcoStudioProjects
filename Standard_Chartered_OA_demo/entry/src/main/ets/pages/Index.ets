@Entry
@Preview
@Component
struct Index {
  @State message: string = 'Hello World';
  @State balance: number = 0;
  private input: number = 0;
  private textInputController: TextInputController = new TextInputController();
  @State selectedTab: number = 0;
  @State searchResult: string[] = [];

  build() {
    Tabs({ index: this.selectedTab }) {
      TabContent() {
        this.scGraphic()
      }
      .tabBar(this.tabIconOne)
      .id('1')

      TabContent() {
        this.searchBar()
      }
      .tabBar(this.atmTabIcon)
    }
    .onChange((index: number) => {
      this.selectedTab = index;
    })
    .barPosition(BarPosition.End)
  }

  @Builder
  searchBar() {
    Column() {
      Search()
        .width('100%')
        .searchButton('search', { autoDisable: true })
        .onChange((val: string) => {
          if (val === '') {
            this.searchResult = [];
          }
        })
        .onSubmit((val: string) => {
          console.log(`search: ${val}`);
          search(val).then((result) => {
            this.searchResult = result;
          })
        })

      List({ space: 5 }) {
        ForEach(this.searchResult, (item: string) => {
          ListItem() {
            Row() {
              Text(item)
            }
            .width('100%')
            .height(48)
            .backgroundColor('#eef5fcff')
            .padding({ left: 12, right: 12 })
            .borderRadius(12)
          }
        })
      }
      .edgeEffect(EdgeEffect.Spring)

    }
    .height('100%')
    .width('100%')
    .padding({ left: 24, right: 24 })
    .alignItems(HorizontalAlign.Center)
  }

  @Builder
  scGraphic() {
    Column() {
      Column() {
        Row() {
          Column() {
            Text('Account Number')
            Text('ACC01')
              .fontWeight(FontWeight.Bold)
          }
          .width('50%')

          Image($r('app.media.scLogo'))
            .width(24)
        }
        .width('100%')
        .margin({ bottom: 20 })
        .justifyContent(FlexAlign.SpaceBetween)

        Text('Current Balance')
        Text(`$${this.balance.toFixed(2)}`)
          .fontWeight(FontWeight.Bold)
      }
      .margin({ bottom: 10 })
      .justifyContent(FlexAlign.SpaceBetween)
      .width('100%')
      .padding(8)
      .backgroundColor('#ff06a40b') // todo: change to Color-Resource $r('dark-green')
      .borderRadius(7)

      Text('Enter Account')
        .margin({ bottom: 10 })

      TextInput({ controller: this.textInputController })
        .onChange((input: string) => {
          this.input = Number(input);
        })
        .borderWidth(0.5)
        .width('100%')
        .type(InputType.NUMBER_DECIMAL)
        .textAlign(TextAlign.Center)
        .margin({ bottom: 10 })

      Row() {
        Button('Deposit')
          .onClick(() => {
            this.balance += this.input;
            this.textInputController.deleteText();
          })
        Button('Withdraw')
          .onClick(() => {
            this.balance -= this.input;
            // this.textInputController.deleteText();
          })
      }
      .padding({ left: 20, right: 20 })
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)

    }
    .padding({ left: 20, right: 20 })
    .height('100%')
    .width('100%')
    .alignItems(HorizontalAlign.Center)

  }

  @Builder
  tabIconOne() {
    Image($r('app.media.employee_id'))
      .width(30)
      .fillColor(this.selectedTab == 0 ? Color.Black : Color.Grey)
  }

  @Builder
  atmTabIcon() {
    Image($r('app.media.atm'))
      .width(30)
      .fillColor(this.selectedTab == 1 ? Color.Black : Color.Grey)
  }

  @Builder
  tabIconT() {
    Image($r('app.media.atm'))
      .width(30)
      .fillColor(this.selectedTab == 2 ? Color.Black : Color.Grey)
  }
}

async function search(keywords: string): Promise<string[]> {
  const res: string[] = [];
  const results = await httpRequest('');
  console.log(`httpRequest: ${JSON.stringify(results)}`);
  if (results) {
    const httpResults: string[] = (results as HttpResult).res
    res.push(...httpResults.filter((value: string) => value.search(keywords) !== -1));
  }
  console.log(`search: ${JSON.stringify(res)}`);
  return res.slice(0, 3);
}

interface IHttpResult {
  len: number;
  res: string[];
}

class HttpResult implements IHttpResult {
  public len: number = 0;
  public res: string[] = [];
}

async function httpRequest(url: string): Promise<object | null> {
  const res: IHttpResult = {
    len: 4,
    res: [
      'dhui13hgicalkhasoih12o3526_all_search',
      'b34o8fw9buc_all_search',
      'liam zheng_all_search_nameall',
      '2025-10-16'
    ]
  }
  return res;
}