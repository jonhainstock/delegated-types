class CreateRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :requests do |t|
      t.references :event, null: false, foreign_key: true
      t.string :guid
      t.string :user_agent
      t.string :ip_address
      t.datetime :created_at
    end
  end
end
