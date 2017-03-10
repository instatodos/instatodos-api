class CreateTodoLists < ActiveRecord::Migration[5.0]
  def change
    create_table :todo_lists do |t|
      t.string :title, null: false

      t.timestamps

      add_reference :todos, :todo_list, index: true
    end
  end
end
