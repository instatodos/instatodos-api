class MakeTodoTitleUnique < ActiveRecord::Migration[5.0]
  def change
    add_index :todos, :title, :unique => true
  end
end
