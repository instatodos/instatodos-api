App.todo = App.cable.subscriptions.create("TodoChannel", {
  connected() {
    console.log("Connected...")
  },

  disconnected() {
    console.log("Disconnected...")
  },

  received(data) {
    let task = JSON.parse(data)
    TodoServerActionCreators.receiveTask(task)
  },

  createTask(task) {
    this.perform('create_task', { task: task })
  },

  destroyTask(task) {
    this.perform('destroy_task', { task: task })
  }
})
