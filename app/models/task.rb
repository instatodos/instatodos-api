class Task < ApplicationRecord
  default_scope { order(created_at: :desc) }
  belongs_to :todo

  def update
    binding.pry
  end
end
