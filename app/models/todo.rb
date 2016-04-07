class Todo < ApplicationRecord
  include FriendlyId
  friendly_id :title

  has_many :tasks
end
