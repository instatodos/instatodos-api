class TodoChannel < ApplicationCable::Channel
  def follow(data)
    stop_all_streams
    # todo_list_id = data["todo_list_id"]
    todo_list_id = TodoList.first.id
    stream_from "todo_channel_#{todo_list_id}"
  end

  def unfollow
    stop_all_streams
  end

  def create_todo(data)
    todo = TodoList.first.todos.create data["todo_params"]
    ActionCable.server.broadcast(
      "todo_channel_#{todo.todo_list_id}",
      todo: todo.to_json, action: :createTodo
    )
  end

  def update_todo(data)
    puts(data["todo_params"])
    todo = find_todo(data["todo_params"]["id"])
    todo.update_attributes data["todo_params"]
    ActionCable.server.broadcast(
      "todo_channel_#{todo.todo_list_id}",
      todo: todo.to_json, action: :updateTodo
    )
  end

  def delete_todo(data)
    todo = find_todo data["id"]
    todo.destroy!
    ActionCable.server.broadcast(
      "todo_channel_#{todo.todo_list_id}",
      todo: todo.to_json, action: :deleteTodo
    )
  end

  private

  def find_todo(id)
    Todo.find(id)
  end
end
