@Entry
@Component
struct Index {
  @State message: string = 'Hello World'
  @State marginNumber: number = 0

  //仅支持组件的通用属性和通用事件，不支持传递参数，优先级高于全局样式
  @Styles customStyle(){
    .width(200)
    .backgroundColor(Color.Red)
    .margin(this.marginNumber)
  }

  @Styles btnNormalStateStyle(){
    .backgroundColor(Color.Blue)
  }

  @Styles btnPressStateStyle(){
    .backgroundColor(Color.Black)
  }

  @Styles btnDisabledStateStyle(){
    .backgroundColor(Color.Grey)
  }

  build() {
    Row() {
      Column() {
        Text(this.message)
          .customStyle()
          .fontSize(20)
          .fontWeight(100)
          .extendTextStyle()

        Text(this.message)
          .customStyle()
          .fontSize(20)
          .fontWeight(100)
          .extendTextStyle()

        Text(this.message)
          .customStyle()
          .fontSize(20)
          .fontWeight(100)
          .extendTextStyle()

        Text(this.message)
          .customStyle()
          .fontSize(20)
          .fontWeight(100)
          .backgroundColor(Color.Blue)
          .superTextStyle(500, this.marginNumber, () => {
            this.marginNumber -= 1
          })
        Button('占据焦点').stateStyles({
          normal: {.backgroundColor(Color.Blue)
          },
          focused: {.backgroundColor(Color.Pink)
          },
          pressed: {.backgroundColor(Color.Black)
          },
          disabled: {.backgroundColor(Color.Grey)
          },
          clicked: {.backgroundColor(Color.Green)
          }
        })
        Button('惊喜').stateStyles({
          normal: this.btnNormalStateStyle,
          pressed: this.btnPressStateStyle,
          disabled: this.btnDisabledStateStyle
        }).onClick(() => {
          this.marginNumber += 1
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}

//仅支持组件的通用属性和通用事件
@Styles function customStyle() {
  .width('200vp')
  .backgroundColor(Color.Gray)
}

//支持组件的私有属性和私有事件
@Extend(Text) function extendTextStyle() {
  .width(300)
  .fontColor(Color.White)
  .fontSize(30)
}

//支持组件的私有属性和私有事件,并支持传递参数
@Extend(Text) function superTextStyle(fontWeight: number, margin: number, onClick?: () => void) {
  .fontWeight(fontWeight)
  .extendTextStyle()
  .margin(margin)
  .onClick(onClick)
}