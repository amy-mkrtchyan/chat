class CreateRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :rooms do |t|
      t.string :name, null: false
      t.attachment :avatar
      t.boolean :private, default: false
      t.integer :created_by
      t.timestamps
    end
  end
end
