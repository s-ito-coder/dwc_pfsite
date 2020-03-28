class AddUserIdToFavorites < ActiveRecord::Migration[5.2]
  def change
    add_column :favorites, :end_user_id, :integer
    add_column :favorites, :item_id, :integer
  end
end
