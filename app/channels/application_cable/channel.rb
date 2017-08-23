module ApplicationCable
  class Channel < ActionCable::Channel::Base
    def serialize_resource(resource)
      serializer = ActiveModelSerializers::SerializableResource.new(resource)
      serializer.serializer_instance.as_json
    end
  end
end
