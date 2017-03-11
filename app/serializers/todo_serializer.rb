class TodoSerializer < ActiveModel::Serializer
  cache key: 'todo'

  attributes :id, :title, :description, :completed
  belongs_to :todo_list
end
