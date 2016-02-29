(() => {
  class TodoActions {
    fetchTasks() {
      return (dispatch) => {
        TodoSource.fetchTasks()
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

    submitTask(task) {
      App.todo.addTask(task)
      return task
    }
  }
  this.TodoActions = alt.createActions(TodoActions)
})()
