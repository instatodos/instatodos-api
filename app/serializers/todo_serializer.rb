class TodoSerializer < ActiveModel::Serializer
  cache key: 'todo'

  attributes :id, :title, :completed, :user_editing
  belongs_to :todo_list
end
