class CreateRoomUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :room_users do |t|
      t.belongs_to :room, index: true
      t.belongs_to :user, index: true
    end
  end
end