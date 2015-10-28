class AddForeignUrlToUser < ActiveRecord::Migration
  def change
    add_column :users, :foreign_url, :string
  end
end
