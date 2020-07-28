class CreateCaptains < ActiveRecord::Migration
  def change
    create_table :captains do |t|
      t.string :captain_name
      t.string :password_digest
    end
  end
end
