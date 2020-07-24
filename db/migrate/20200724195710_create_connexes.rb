class CreateConnexes < ActiveRecord::Migration
  def change
    create_table :connexes do |t|
      t.string :company
      t.string :contents
      t.integer :ship_id
    end
  end
end
