module ApplicationCable
  class Channel < ActionCable::Channel::Base
    def serialize(resource)
      serializer = ActiveModelSerializers::SerializableResource.new(resource)
      serializer.serializer_instance.as_json
    end

    def current_todo_list
      @current_todo_list ||= TodoList.first
    end
  end
end
