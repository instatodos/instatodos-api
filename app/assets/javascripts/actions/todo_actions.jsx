(() => {
  class TodoActions {
    fetchTasks(id) {
      return (dispatch) => {
        dispatch()
        TodoSource.fetchTasks(id)
          .then((tasks) => {
            this.updateTasks(tasks)
          })
          .catch((errorMessage) => {
            this.tasksFailed(errorMessage)
          })
      }
    }

    updateTasks(tasks) {
      return tasks
    }

    tasksFailed(errorMessage) {
      return errorMessage
    }

    createTask(task) {
      App.todoChannel.createTask(task)
      return task
    }

    updateTask(task) {
      App.todoChannel.updateTask(task)
      return task
    }

    destroyTask(id) {
      App.todoChannel.destroyTask(id)
      return id
    }

  }
  this.TodoActions = alt.createActions(TodoActions)
})()
