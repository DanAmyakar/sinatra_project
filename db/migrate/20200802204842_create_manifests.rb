class CreateManifests < ActiveRecord::Migration
  def change
    create_table :manifests do |t|
      t.string :item_name
      t.integer :item_quantity
      t.integer :ship_id
    end
  end
end
