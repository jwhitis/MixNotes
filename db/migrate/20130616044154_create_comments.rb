class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :time
      t.text :content
      t.integer :mix_id
      t.integer :user_id

      t.timestamps
    end
  end
end
