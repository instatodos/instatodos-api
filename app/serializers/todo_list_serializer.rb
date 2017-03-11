class TodoListSerializer < ActiveModel::Serializer
  cache key: 'todo_list'
  attributes :id, :title

  has_many :todos
end
