class CreateCaptains < ActiveRecord::Migration
  def change
    create_table :captains do |t|
      t.string :username
      t.string :password_digest
    end
  end
end
