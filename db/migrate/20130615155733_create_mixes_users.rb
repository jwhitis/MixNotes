class CreateMixesUsers < ActiveRecord::Migration
  def change
    create_table :mixes_users, :id => false do |t|
      t.integer :mix_id
      t.integer :user_id
    end
    add_index :mixes_users, [:mix_id, :user_id]
  end
end
