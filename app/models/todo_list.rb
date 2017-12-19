class TodoList < ApplicationRecord
  include FriendlyId

  has_many :todos

  # TODO: Insufficient validation for title
  validates :title, format: { with: /\w+-\w+-\d{3}/, message: 'not allowed' }

  friendly_id :title
end
