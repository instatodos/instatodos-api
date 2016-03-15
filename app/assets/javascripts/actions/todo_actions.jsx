(() => {
  class TodoActions {
    fetchTasks() {
      return (dispatch) => {
        dispatch()
        TodoSource.fetchTasks(1)
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
      App.todo.createTask(task)
      return task
    }
  }
  this.TodoActions = alt.createActions(TodoActions)
})()
