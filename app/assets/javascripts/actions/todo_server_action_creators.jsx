(() => {
  class TodoServerActionCreators {
    receiveTask(task) {
      return( task )
    }
  }
  this.TodoServerActionCreators = alt.createActions(TodoServerActionCreators)
})();
