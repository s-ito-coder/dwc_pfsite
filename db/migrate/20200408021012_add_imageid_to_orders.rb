class AddImageidToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :image_id, :string
    add_column :orders, :item_id, :string
    remove_column :orders, :exhibition_username, :string
  end
end
