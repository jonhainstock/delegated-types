class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.references :recording, null: false, foreign_key: true, index: true
      t.references :creator, null: true, foreign_key: { to_table: :users }, index: true
      t.references :recordable, polymorphic: true, null: false 
      t.references :recordable_previous, polymorphic: true, null: true, index: false
      t.string :action, null: false, index: true
      t.jsonb :detail, null: false, default: "{}"
      t.datetime :created_at
      t.index [:recordable_previous_type, :recordable_previous_id], unique: false, name: 'recordable_previous_index'
    end
  end
end
