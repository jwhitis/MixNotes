class AddAudioToMixes < ActiveRecord::Migration
  def change
    add_column :mixes, :audio, :string
  end
end
