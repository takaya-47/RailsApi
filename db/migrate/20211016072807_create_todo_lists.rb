class CreateTodoLists < ActiveRecord::Migration[6.1]
  def change
    create_table :todo_lists do |t|
      t.text :todo, presence: true

      t.timestamps
    end
  end
end
