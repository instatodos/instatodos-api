(() => {
  class TodoStore {
    constructor () {
      this.tasks = []
      this.errorMessage = null
      this.bindListeners({
        handleUpdateTasks: TodoActions.UPDATE_TASKS,
        handleFetchTasks: TodoActions.FETCH_TASKS,
        handleTasksFailed: TodoActions.TASKS_FAILED,
        handleReceiveCreatedTask: TodoServerActionCreators.RECEIVE_CREATED_TASK,
        handleReceiveDeletedTask: TodoServerActionCreators.RECEIVE_DELETED_TASK
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

    handleReceiveCreatedTask(task) {
      this.tasks.unshift(task)
    }

    handleReceiveDeletedTask(task) {
      arr = _.reject(this.tasks, function(t){ return t.id == task.id })
      this.tasks = arr
    }
  }

  this.TodoStore = alt.createStore(TodoStore, 'TodoStore')
})()
