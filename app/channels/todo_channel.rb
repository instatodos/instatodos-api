# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class TodoChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'TodoChannel'
  end

  def unsubscribed
    stop_all_streams
  end

  def add_task(data)
    task = Task.create! data['task']
    ActionCable.server.broadcast 'TodoChannel', task.to_json
  end
end
