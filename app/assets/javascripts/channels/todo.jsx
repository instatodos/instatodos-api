App.todo = App.cable.subscriptions.create("TodoChannel", {
  connected() {
    console.log("Connected...")
  },

  disconnected() {
    console.log("Disconnected...")
  },

  received(data) {
    let task = JSON.parse(data)
    console.log('TodoChannel: received task ' + task.title)
    TodoServerActionCreators.receiveTask(task)
  },

  addTask(task) {
    this.perform('add_task', { task: task })
  }

})
