# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class TodoChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'TodoChannel'
  end

  def unsubscribed
    stop_all_streams
  end

  def create_task(data)
    task = Task.create! data['task']
    ActionCable.server.broadcast 'TodoChannel', task.to_json
  end

  def destroy_task(data)
    task = Task.find data['id']
    task.destroy!
    ActionCable.server.broadcast 'TodoChannel', task.to_json
  end
end
