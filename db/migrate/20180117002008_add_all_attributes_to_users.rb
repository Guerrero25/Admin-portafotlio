class AddAllAttributesToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :bio, :text
    add_attachment :users, :profile
  end
end
