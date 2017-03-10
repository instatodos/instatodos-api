class MakeTodoListsTitleUnique < ActiveRecord::Migration[5.0]
  def change
    add_index :todo_lists, :title, :unique => true
  end
end
