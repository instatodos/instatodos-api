(() => {
  class TodoServerActionCreators {
    receiveCreatedTask(task) {
      return( task )
    }

    receiveDeletedTask(task) {
      return( task )
    }
  }

  this.TodoServerActionCreators = alt.createActions(TodoServerActionCreators)
})();
