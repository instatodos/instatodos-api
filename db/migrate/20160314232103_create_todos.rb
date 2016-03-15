class CreateTodos < ActiveRecord::Migration[5.0]
  def change
    create_table :todos do |t|
      t.string :title, null: false

      t.timestamps

      add_reference :tasks, :todo, index: true
    end
  end
end
