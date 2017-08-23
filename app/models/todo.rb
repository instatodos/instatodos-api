class Todo < ApplicationRecord
  default_scope { order(created_at: :asc) }
  belongs_to :todo_list
  attr_accessor :user_editing

  def assign_or_update(params)
    persist = params['user_editing'].nil? # TODO: should be update == false
    alter_method = persist ? :update_attributes : :assign_attributes
    send alter_method, params
  end
end
