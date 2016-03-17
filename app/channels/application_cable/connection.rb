# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_todo

    def connect
      self.current_todo = find_current_todo
    end

    protected
    def find_current_todo
      Todo.last
      # if current_todo = Todo.find_by(id: cookies.signed[:user_id])
      #   current_todo
      # else
      #   reject_unauthorized_connection
      # end
    end
  end
end
