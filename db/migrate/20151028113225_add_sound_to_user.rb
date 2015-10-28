class AddSoundToUser < ActiveRecord::Migration
  def change
    add_column :users, :sound, :string
  end
end
