class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :url
      t.string :person
      t.string :comment

      t.timestamps null: false
    end
  end
end
