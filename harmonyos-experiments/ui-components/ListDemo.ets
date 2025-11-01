/**
 * HarmonyOS 列表组件示例
 * List Component Example for HarmonyOS
 */

interface TodoItem {
  id: number
  title: string
  completed: boolean
}

@Entry
@Component
struct ListDemo {
  @State todoList: TodoItem[] = [
    { id: 1, title: '学习 HarmonyOS 开发', completed: false },
    { id: 2, title: '完成实验代码', completed: false },
    { id: 3, title: '测试应用功能', completed: false },
    { id: 4, title: '优化用户界面', completed: false },
    { id: 5, title: '编写技术文档', completed: false }
  ]
  @State newItemTitle: string = ''

  build() {
    Column() {
      // 标题
      Text('待办事项列表 Todo List')
        .fontSize(28)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })

      // 添加新项目
      Row({ space: 10 }) {
        TextInput({ placeholder: '添加新任务...', text: this.newItemTitle })
          .layoutWeight(1)
          .onChange((value: string) => {
            this.newItemTitle = value
          })

        Button('添加')
          .onClick(() => {
            if (this.newItemTitle.trim() !== '') {
              this.todoList.push({
                id: Date.now(),
                title: this.newItemTitle,
                completed: false
              })
              this.newItemTitle = ''
            }
          })
      }
      .width('90%')
      .margin({ bottom: 20 })

      // 待办事项列表
      List({ space: 10 }) {
        ForEach(this.todoList, (item: TodoItem, index: number) => {
          ListItem() {
            Row({ space: 15 }) {
              Checkbox()
                .select(item.completed)
                .onChange((isChecked: boolean) => {
                  this.todoList[index].completed = isChecked
                })

              Text(item.title)
                .fontSize(18)
                .layoutWeight(1)
                .decoration({
                  type: item.completed ? TextDecorationType.LineThrough : TextDecorationType.None
                })
                .fontColor(item.completed ? Color.Gray : Color.Black)

              Button('删除')
                .fontSize(14)
                .backgroundColor(Color.Red)
                .onClick(() => {
                  this.todoList.splice(index, 1)
                })
            }
            .width('100%')
            .padding(15)
            .backgroundColor(Color.White)
            .borderRadius(10)
          }
        }, (item: TodoItem) => item.id.toString())
      }
      .width('90%')
      .layoutWeight(1)
      .divider({
        strokeWidth: 1,
        color: Color.Gray,
        startMargin: 10,
        endMargin: 10
      })

      // 统计信息
      Row() {
        Text(`总计: ${this.todoList.length} 项`)
          .fontSize(16)
          .fontColor(Color.Gray)

        Text(`已完成: ${this.todoList.filter(item => item.completed).length} 项`)
          .fontSize(16)
          .fontColor(Color.Green)
      }
      .width('90%')
      .justifyContent(FlexAlign.SpaceBetween)
      .margin({ top: 20, bottom: 20 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F1F3F5')
  }
}
