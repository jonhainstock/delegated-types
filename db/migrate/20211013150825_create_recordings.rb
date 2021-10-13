class CreateRecordings < ActiveRecord::Migration[7.0]
  def change
    create_table :recordings do |t|
      t.bigint :creator_id
      t.bigint :parent_id
      t.bigint :recordable_id
      t.string :recordable_type
      t.string :status, null: false, default: :active
      t.timestamps
    end
  end
end
