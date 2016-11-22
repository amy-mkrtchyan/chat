class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.text :body
      t.references :user
      t.references :room
      t.timestamps
    end
  end
end
