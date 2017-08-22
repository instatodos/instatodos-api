# Be sure to restart your server when you modify this file.
# Action Cable runs in a loop that does not support auto reloading.
module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_todo_list

    def connect
      self.current_todo_list = find_current_todo_list
      logger.add_tags 'ActionCable', current_todo_list.title
    end

    protected

    def find_current_todo_list
      TodoList.first
      # if current_todo_list = TodoList.find params[:todo_list_id]
      #   current_todo_list
      # else
      #   reject_unauthorized_connection
      # end
    end
  end
end
