class TodoChannel < ApplicationCable::Channel
  def subscribed
    stop_all_streams
    stream_from channel_id

    response_params = {
      todos: current_todo_list.todos,
      connections: ActionCable.server.connections.length,
      action: :index
    }

    ActionCable.server.broadcast channel_id, response_params
  end

  def create(data)
    todo = current_todo_list.todos.create!(data['todo_params']).to_json

    ActionCable.server.broadcast channel_id, todo: todo, action: :create
  end

  def update(data)
    todo_params = data['todo_params']
    todo = assign_or_update todo_params
    todo = TodoSerializer.new(todo).serializable_hash.as_json

    ActionCable.server.broadcast channel_id, todo: todo, action: :update
  end

  def delete(data)
    todo = find(data['id']).tap { |t| t.destroy!.to_json }

    ActionCable.server.broadcast channel_id, todo: todo, action: :delete
  end

  private

  def channel_id
    "todo_channel_#{current_todo_list.id}"
  end

  def find(id)
    Todo.find id
  end

  def assign_or_update(todo_params)
    # TODO: this belongs to the Todo model
    id = todo_params['id']
    persist = todo_params['user_editing'].nil? # TODO: should be update == false
    todo = find(id).tap do |t|
      alter_method = persist ? :update_attributes : :assign_attributes
      t.send alter_method, todo_params
    end
  end
end
