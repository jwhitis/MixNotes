class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :model_class
      t.integer :model_id
      t.integer :user_id

      t.timestamps
    end
  end
end
