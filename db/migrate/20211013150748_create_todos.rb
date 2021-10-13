class CreateTodos < ActiveRecord::Migration[7.0]
  def change
    create_table :todos do |t|
      t.text :content, null: false
      t.integer :position, default: 0
      t.boolean :complete, default: false
      t.datetime :starts_on
      t.datetime :due_on 
    end
  end
end
