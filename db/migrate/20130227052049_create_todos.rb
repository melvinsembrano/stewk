class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :title
      t.text :description
      t.integer :account_id
      t.integer :type_id
      t.datetime :due_on

      t.timestamps
    end
    add_index :todos, :account_id
    add_index :todos, [:account_id, :title]
  end
end
