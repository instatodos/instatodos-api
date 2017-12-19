class Todo < ApplicationRecord
  default_scope { order(created_at: :asc) }
  belongs_to :todo_list
  attr_reader :user_editing

  def assign_or_update(params)
    persist = !params['user_editing']
    alter_method = persist ? :update_attributes : :assign_attributes
    send alter_method, params
  end
end
