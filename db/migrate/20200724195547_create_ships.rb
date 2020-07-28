class CreateShips < ActiveRecord::Migration
  def change
    create_table :ships do |t|
      t.string :name
      t.integer :cargo_slots
      t.integer :captain_id
    end
  end
end
