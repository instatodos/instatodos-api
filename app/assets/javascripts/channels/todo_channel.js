'use strict';

App.todoChannel = App.cable.subscriptions.create("TodoChannel", {
  connected: function connected() {
    var todoId = document.getElementById('todo_id').value;
    this.perform('follow', { todo_id: todoId });
  },

  createTask: function createTask(task) {
    this.perform('create_task', { task: task });
  },

  updateTask: function updateTask(task) {
    this.perform('update_task', { task: task });
  },

  destroyTask: function destroyTask(id) {
    this.perform('destroy_task', { id: id });
  },

  received: function received(data) {
    var task = JSON.parse(data['task']);
    switch (data['action']) {
      case 'create_task':
        TodoServerActionCreators.receiveCreatedTask(task);
        break;
      case 'update_task':
        TodoServerActionCreators.receiveUpdatedTask(task);
        break;
      case 'destroy_task':
        TodoServerActionCreators.receiveDeletedTask(task);
        break;
    }
  }
});
