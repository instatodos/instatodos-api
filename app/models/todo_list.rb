class TodoList < ApplicationRecord
  cache key: 'todo_list'
  include FriendlyId
  friendly_id :title

  has_many :todos

  validates :title, format: { with: /\w+-\w+-\d{3}/, message: 'not allowed' }
end
