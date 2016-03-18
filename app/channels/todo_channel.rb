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

  def create_task(task)
    task = Task.create! task['task']
    ActionCable.server.broadcast "todo_channel_#{task.todo_id}", task.to_json
  end

  def destroy_task(task)
    task = Task.find data['id']
    task.destroy!
    ActionCable.server.broadcast "todo_channel_#{task.todo_id}", task.to_json
  end
end
