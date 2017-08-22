class TodoChannel < ApplicationCable::Channel
  def follow(data)
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
    puts 'CHANNEL_ID' + channel_id

    todo = current_todo_list.todos.create!(data['todo_params']).to_json

    ActionCable.server.broadcast channel_id, todo: todo, action: :create
  end

  def update(data)
    todo_params = data['todo_params']
    todo = assign_or_update(todo_params)

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
    id = todo_params['id']
    persist = todo_params['user_editing']
    todo = find(id).tap do |t|
      update_method = persist ? :update_attributes : :assign_attributes
      t.send update_method, todo_params
    end
    TodoSerializer.new(todo).serializable_hash.as_json
  end
end
