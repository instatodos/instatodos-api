(() => {
  class TodoStore {
    constructor () {
      this.tasks = []
      this.errorMessage = null
      this.bindListeners({
        handleUpdateTasks: TodoActions.UPDATE_TASKS,
        handleFetchTasks: TodoActions.FETCH_TASKS,
        handleTasksFailed: TodoActions.TASKS_FAILED,
        handleReceiveTask: TodoServerActionCreators.RECEIVE_TASK
      })
    }

    handleUpdateTasks(tasks) {
      this.tasks = tasks
      this.errorMessage = null
    }

    handleFetchTasks() {
      this.tasks = []
    }

    handleTasksFailed(errorMessage) {
      this.errorMessage = errorMessage
    }

    handleReceiveTask(task) {
      this.tasks.unshift(task)
    }
  }

  this.TodoStore = alt.createStore(TodoStore, 'TodoStore')
})()
