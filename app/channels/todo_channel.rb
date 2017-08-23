class TodoChannel < ApplicationCable::Channel
  def subscribed
    stop_all_streams
    stream_from channel_id

    response_params = {
      todos: serialize_resource(current_todo_list.todos),
      connections: ActionCable.server.connections.length,
      action: :index
    }

    ActionCable.server.broadcast channel_id, response_params
  end

  def create(data)
    todo = current_todo_list.todos.create! data['todo_params']

    ActionCable.server.broadcast channel_id, todo: serialize_resource(todo), action: :create
  end

  def update(data)
    todo = Todo.find data['todo_params']['id']
    todo.assign_or_update data['todo_params']

    ActionCable.server.broadcast channel_id, todo: serialize_resource(todo), action: :update
  end

  def delete(data)
    todo = Todo.find(data['id']).destroy!

    ActionCable.server.broadcast channel_id, todo: serialize_resource(todo), action: :delete
  end

  private

  def channel_id
    "todo_channel_#{current_todo_list.id}"
  end
end
