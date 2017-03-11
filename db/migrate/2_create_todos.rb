class CreateTodos < ActiveRecord::Migration[5.1]
  def change
    create_table :todos, id: :uuid do |t|
      t.belongs_to :todo_list, index: true, type: :uuid
      t.string :title, null: false
      t.boolean :completed, default: false
      t.timestamps
    end
  end
end
