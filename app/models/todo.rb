class Todo < ApplicationRecord
  include FriendlyId
  friendly_id :title

  has_many :tasks

  validates :title, format: { with: /\w+-\w+-\d{3}/, message: 'not allowed' }
end
