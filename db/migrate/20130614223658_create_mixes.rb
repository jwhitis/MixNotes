class CreateMixes < ActiveRecord::Migration
  def change
    create_table :mixes do |t|
      t.string :title
      t.string :artist
      t.string :admin

      t.timestamps
    end
  end
end
