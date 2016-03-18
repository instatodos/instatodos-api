App.todo = App.cable.subscriptions.create("TodoChannel", {
  connected() {
    let todoId = document.getElementById('todo_id').value
    this.perform('follow', { todo_id: todoId })
  },

  received(data) {
    let task = JSON.parse(data['task'])
    switch (data['action']) {
      case 'create_task':
        TodoServerActionCreators.receiveCreatedTask(task)
        break;
      case 'destroy_task':
        TodoServerActionCreators.receiveDeletedTask(task)
        break;
    }
  },

  createTask(task) {
    this.perform('create_task', { task: task })
  },

  destroyTask(id) {
    this.perform('destroy_task', { id: id })
  }
})
