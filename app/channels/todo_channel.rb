class TodoChannel < ApplicationCable::Channel
  def follow(data)
    # stop_all_streams
    # todo_list_id = data["todo_list_id"]
    @todo_list ||= TodoList.first
    @todos ||= @todo_list.todos
    @channel_id ||= "todo_channel_#{@todo_list.id}"
    stream_from @channel_id
    broadcast({ todos: @todos }, :follow)
  end

  # def unfollow
  #   stop_all_streams
  # end

  def create_todo(data)
    todo = @todos.create(data['todo_params']).to_json
    broadcast({ todo: todo }, :createTodo)
  end

  def update_todo(data)
    # TODO: look for todo in cache
    # update cache(or @todo variable, assign_attributes), only persist if flag is true
    # set editing flag to true unless persist
    # so it basically persists when it's not being edited, or not in focus
    todo_params = data["todo_params"]
    persist = data["persist"]
    todo = find_todo(todo_params["id"]).tap do |t|
      update_method = persist ? :update_attributes : :assign_attributes
      t.send update_method, todo_params
      t.to_json
    end

    broadcast({ todo: todo }, :updateTodo)
  end

  def delete_todo(data)
    todo = find_todo(data["id"]).tap do |t|
      t.destroy!
      t.to_json
    end

    broadcast({ todo: todo }, :deleteTodo)
  end

  private

  def broadcast(message, action)
    ActionCable.server.broadcast @channel_id, message: message, action: action
  end

  def find_todo(id)
    # @todos.find ?
    Todo.find(id)
  end
end
