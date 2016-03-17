App.todo = App.cable.subscriptions.create("TodoChannel", {
  connected() {
    let todoId = document.getElementById('todo_id').value
    this.perform('follow', { todo_id: todoId })
  },

  received(data) {
    let task = JSON.parse(data)
    TodoServerActionCreators.receiveTask(task)
  },

  createTask(task) {
    this.perform('create_task', { id: id, task: task })
  },

  destroyTask(task) {
    this.perform('destroy_task', { task: task })
  }
})
