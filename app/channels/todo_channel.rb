# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class TodoChannel < ApplicationCable::Channel
  def follow(data)
    stop_all_streams
    current_todo_id = data['todo_id']
    stream_from "todo_channel_#{current_todo_id}"
  end

  def unfollow
    stop_all_streams
  end

  def create_task(data)
    task = Task.create!(data['task'])
    ActionCable.server.broadcast(
      "todo_channel_#{task.todo_id}",
      task: task.to_json, action: :create_task
    )
  end

  def destroy_task(data)
    task = Task.find(data['id'])
    task.destroy!
    ActionCable.server.broadcast(
      "todo_channel_#{task.todo_id}",
      task: task.to_json, action: :destroy_task
    )
  end
end
