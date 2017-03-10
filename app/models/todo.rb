class Todo < ApplicationRecord
  default_scope { order(created_at: :desc) }
  belongs_to :todo_list
end
