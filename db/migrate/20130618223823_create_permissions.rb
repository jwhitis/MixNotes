class CreatePermissions < ActiveRecord::Migration
  def change
    create_table :permissions do |t|
      t.integer :mix_id
      t.integer :user_id

      t.timestamps
    end
    add_index :permissions, [:mix_id, :user_id]
  end
end
