class CreateShips < ActiveRecord::Migration
  def change
    create_table :ships do |t|
      t.string :name
      t.integer :connex_slots
      t.integer :user_id
      t.integer :connex_id
    end
  end
end
