class TodoChannel < ApplicationCable::Channel
  def subscribed
    stream_from current_todo_list
  end

  def create(params)
    todo = current_todo_list.todos.create! params['todo_params']
    response = { todo: serialize(todo), action: :create }
    ActionCable.server.broadcast current_todo_list, response
  end

  def update(params)
    todo = Todo.find(params['todo_params']['id'])
    todo.assign_or_update params['todo_params']
    response = { todo: serialize(todo), action: :update }
    ActionCable.server.broadcast current_todo_list, response
  end

  def delete(params)
    todo = Todo.find(params['id']).destroy!
    response = { todo: serialize(todo), action: :delete }
    ActionCable.server.broadcast current_todo_list, response
  end
end
